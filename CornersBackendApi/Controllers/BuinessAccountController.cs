using CornersBackendApi.Data;
using CornersBackendApi.Services.EmailService;
using CornersBackendApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MailKit;
using CornersBackendApi.Data.Models.BuyerModels;
using CornersBackendApi.Data.Models.SellerModels;
using CornersBackendApi.Dto;
using Microsoft.EntityFrameworkCore;
using CornersBackendApi.Dto.SellerDtos;
using System.Security.Cryptography;
using System.Text;
using CornersBackendApi.RequestPayload;

namespace CornersBackendApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuinessAccountController : ControllerBase
    {

        private readonly ApplicationDbContext _context;
        private readonly TokenService _tokenService;
        private readonly IEmailService _mailService;

        public BuinessAccountController(ApplicationDbContext context, TokenService tokenService, IEmailService mailService)
        {
            _context = context;
            _tokenService = tokenService;
            _mailService = mailService;
        }


        [HttpPost("register-business")]
        public async Task<IActionResult> RegisterBusiness(RegisterBusinessDto dto, CancellationToken cancellationToken)
        {
            var userExists = await _context.Sellers.AsNoTracking().AnyAsync(u => u.Email == dto.BusinessEmail, cancellationToken);

            if (userExists)
            {
                return BadRequest($"{nameof(dto.BusinessEmail)} alread exist");
            }

            CreatePasswordHash(dto.Password, out byte[] passwordHash, out byte[] passwordSalt);

            var seller = new Seller
            {
                Email = dto.BusinessEmail,
                Name = dto.BusinessName,
                PhoneNumber = dto.PhoneNumber,
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt,
                EmailVerificationToken = CreateRandomToken(),
            };

            await _context.Sellers.AddAsync(seller, cancellationToken);
            await _context.SaveChangesAsync(cancellationToken);

            return Ok(GenerateToken(seller));
        }

        [HttpPost("business-login")]
        public async Task<IActionResult> Login(LoginBusinessDto dto, CancellationToken cancellationToken)
        {
            var seller = await _context.Sellers.AsNoTracking().FirstOrDefaultAsync(u => u.Email == dto.BusinessEmail);

            if (seller == null)
            {
                return BadRequest("User not found");
            }
            if (!VerifyPasswordHash(dto.Password, seller.PasswordHash, seller.PasswordSalt))
            {
                return BadRequest("Wrong Password!");
            }

            return Ok(GenerateToken(seller));
        }

        [HttpPatch("forgot-password")]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordRequest request)
        {
            var seller = await _context.Sellers.FirstOrDefaultAsync(s => s.Email == request.Email);
            if (seller == null)
            {
                return BadRequest("User not found");
            }

            try
            {
                seller.PasswordRestToken = new Random().Next(10000, 100000).ToString();
                seller.ResetTokenExpires = DateTime.Now.AddMinutes(30);
                await SendPasswordResetEmail(request.Email, seller.PasswordRestToken);

                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


            return Ok(seller);
        }

        [HttpPatch("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordRequest request)
        {
            var seller = await _context.Sellers.FirstOrDefaultAsync(s => s.PasswordRestToken == request.Token);
            if (seller == null || seller.ResetTokenExpires < DateTime.Now)
            {
                return BadRequest("Invalid Token or Token Expired");
            }

            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);

            seller.PasswordHash = passwordHash;
            seller.PasswordSalt = passwordSalt;
            seller.PasswordRestToken = null;
            seller.ResetTokenExpires = null;

            await _context.SaveChangesAsync();

            return Ok("Password successfully reset.");
        }

        [HttpPost("send-verification-mail")]
        public async Task<IActionResult> SendVerificationEmail(EmailVerificationRequest request)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == request.userId);
            if (user == null)
            {
                return BadRequest("Invalid User");
            }
            if (user.VerifiedAt.HasValue)
            {
                return BadRequest("Email is already verified");
            }

            //Get and Hash otp
            var otp = new Random().Next(1000, 10000).ToString();
            var hashedOtp = HashOtp(otp);

            // Store the hashed OTP and expiry time
            user.Otp = hashedOtp;
            user.OtpExpiry = DateTime.Now.AddMinutes(30);
            _context.Users.Update(user);
            await _context.SaveChangesAsync();

            var emailBody = "<!DOCTYPE html>" +
                "<html lang=\"en\">" +
                "<head>" +
                "</head>" +
                "<body> " +
                " <div style=\"background-color: #f4f4f4; padding: 20px;\">" +
                "<p style=\"font-size: 18px;\"><b>Hello!</b></p>" +
                "<p style=\"font-size: 16px;\">Below is your verification otp number</p>" +
                "<p style=\"font-size: 16px;\">Expires in 30 minutes</p>" +
                "<div href=\" style=\"display: inline-block; background-color: #007bff; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 16px;\">" + otp + "</div>" +
                " </body>" +
                "</html>";

            var emailDto = new EmailDto(user.Email, "Email Verification", emailBody);
            await _mailService.SendEmailAsync(emailDto);

            return Ok("User Verification Sent");
        }

        [HttpPost("send-passwordreset-mail")]
        public async Task<IActionResult> SendPasswordResetEmail(string email, string token)
        {
            var emailBody = "<!DOCTYPE html>" +
               "<html lang=\"en\">" +
               "<head>" +
               "</head>" +
               "<body> " +
               " <div style=\"background-color: #f4f4f4; padding: 20px;\">" +
               "<p style=\"font-size: 18px;\"><b>Hello!</b></p>" +
               "<p style=\"font-size: 16px;\">Below is your password reset token</p>" +
               "<p style=\"font-size: 16px;\">Expires in 30 minutes</p>" +
               "<div href=\" style=\"display: inline-block; background-color: #007bff; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 16px;\">" + token + "</div>" +
               " </body>" +
               "</html>";

            var emailDto = new EmailDto(email, "Password Reset", emailBody);
            await _mailService.SendEmailAsync(emailDto);

            return Ok("Password reset token sent");
        }

        [HttpPost("verify-otp")]
        public async Task<IActionResult> Verify(OtpVerificationRequest request)
        {
            var seller = await _context.Users.FirstOrDefaultAsync(s => s.Email == request.Email);
            if (seller == null)
            {
                return BadRequest("User not Valid");
            }
            if (seller.VerifiedAt.HasValue)
            {
                return BadRequest("Email is already verified");
            }

            // Hash the input OTP for comparison
            var hashedInputOtp = HashOtp(request.Otp);

            // Check if the OTP is correct and not expired
            if (seller.Otp != hashedInputOtp)
            {
                return BadRequest("Invalid OTP");
            }
            if (seller.OtpExpiry < DateTime.Now)
            {
                return BadRequest("OTP has expired");
            }

            seller.VerifiedAt = DateTime.Now;
            seller.Otp = null;
            seller.OtpExpiry = null;
            await _context.SaveChangesAsync();

            return Ok(seller);
        }

        private string CreateRandomToken()
        {
            return Convert.ToHexString(RandomNumberGenerator.GetBytes(64));
        }

        private AuthBusinessResponseDto GenerateToken(Seller seller)
        {
            var token = _tokenService.CreateBusinessToken(seller);
            return new AuthBusinessResponseDto(new SellerDto(seller.Id, seller.Email, seller.Name, seller.Role), token);
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            passwordSalt = new byte[16];
            RandomNumberGenerator.Fill(passwordSalt);

            using (var pbkdf2 = new Rfc2898DeriveBytes(password, passwordSalt, 100000, HashAlgorithmName.SHA512))
            {
                passwordHash = pbkdf2.GetBytes(64);
            }

            //using (var hmac = new HMACSHA512())
            //{
            //    passwordSalt = hmac.Key;
            //    passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            //}
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var pbkdf2 = new Rfc2898DeriveBytes(password, passwordSalt, 100000, HashAlgorithmName.SHA512))
            {
                var computedHash = pbkdf2.GetBytes(64);
                return computedHash.SequenceEqual(passwordHash);
            }
        }

        private string HashOtp(string otp)
        {
            using (var sha256 = SHA256.Create())
            {
                var otpBytes = Encoding.UTF8.GetBytes(otp);

                var hashBytes = sha256.ComputeHash(otpBytes);

                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }
    }
}
