using BackendApi.Data;
using BackendApi.Dto;
using BackendApi.RequestPayload;
using BackendApi.Services;
using BackendApi.Services.EmailService;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Authorization;
using BackendApi.Data.Models.BuyerModels;
using BackendApi.Data.Models.SellerModels;
using System.Text;

namespace BackendApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly TokenService _tokenService;
        private readonly IEmailService _mailService;

        public AccountController(ApplicationDbContext context, TokenService tokenService, IEmailService mailService)
        {
            _context = context;
            _tokenService = tokenService;
            _mailService = mailService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterDto dto, CancellationToken cancellationToken)
        {
            var userExists = await _context.Users.AsNoTracking().AnyAsync( u => u.Email == dto.Email, cancellationToken);

            if (userExists)
            {
                return BadRequest($"{nameof(dto.Email)} alread exist");
            }

            CreatePasswordHash(dto.Password, out byte[] passwordHash, out byte[] passwordSalt);

            var user = new User
            {
                Email = dto.Email,
                FirstName = dto.FirstName,
                LastName = dto.LastName,
                passwordhash = passwordHash,
                passwordSalt = passwordSalt,
            };

            await _context.Users.AddAsync(user, cancellationToken);
            await _context.SaveChangesAsync(cancellationToken);

            return Ok(GenerateToken(user));
        }


        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginDto dto, CancellationToken cancellationToken)
        {
            var user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(u => u.Email == dto.Email);

            if (user == null)
            {
                return BadRequest("User not found");
            }
            if (!VerifyPasswordHash(dto.Password, user.passwordhash, user.passwordSalt))
            {
                return BadRequest("Wrong Password!");
            }

            return Ok(GenerateToken(user));
        }


        [HttpPost("forgot-password")]
        public async Task<IActionResult> ForgotPassword([FromBody] string Email)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == Email);
            if (user == null)
            {
                return BadRequest("User not found");
            }

            user.PasswordRestToken = CreateRandomToken();
            user.ResetTokenExpires = DateTime.Now.AddDays(1);
            await _context.SaveChangesAsync();

            return Ok("You may now reset your password");
        }

        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordRequest request)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.PasswordRestToken == request.Token);
            if (user == null || user.ResetTokenExpires < DateTime.Now)
            {
                return BadRequest("Invalid Token or Token Expired");
            }

            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);

            user.passwordhash = passwordHash;
            user.passwordSalt = passwordSalt;
            user.PasswordRestToken = null;
            user.ResetTokenExpires = null;

            await _context.SaveChangesAsync();

            return Ok("Password successfully reset.");
        }

        [HttpGet("get-user/{Email}")]
        public async Task<IActionResult> GetUser(string email)
        {
            var user = await _context.Users.Where(u => u.Email == email).FirstOrDefaultAsync();

            if (user == null)
            {
                return BadRequest("user not found");
            }

            var userDto = new UserResetDto()
            {
                Email = user.Email,
                PasswordRestToken = user.PasswordRestToken,
                FirstName = user.FirstName,
                LastName = user.LastName,
            };

            return Ok(userDto);
        }

        [HttpGet("id")]
        [Authorize]
        public ActionResult<string> Login(int id)
        {
            var user = this.User;
            return "value";
        }

        [HttpGet("signin-google")]
        public async Task<IActionResult> GoogleLogin()
        {
            var response = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            if (response.Principal == null) return BadRequest();

            var name = response.Principal.FindFirstValue(ClaimTypes.Name);
            var givenName = response.Principal.FindFirstValue(ClaimTypes.GivenName);
            var email = response.Principal.FindFirstValue(ClaimTypes.Email);
            //Do something with the claims
            // var user = await UserService.FindOrCreate(new { name, givenName, email});

            return Ok();
        }


        [HttpPost("send-verification-mail")]
        public async Task<IActionResult> SendVerificationEmail(EmailVerificationRequest request)
        {
            var user = await _context.Users.FirstOrDefaultAsync( u => u.Id == request.userId);
            if (user == null)
            {
                return BadRequest("Invalid User");
            }
            if(user.VerifiedAt.HasValue)
            {
                return BadRequest("Email is already verified");
            }

            //Get and Hash otp
            var otp = new Random().Next(100000, 999999).ToString();
            var hashedOtp = HashOtp(otp);

            // Store the hashed OTP and expiry time
            user.Otp = hashedOtp;
            user.OtpExpiry = DateTime.Now.AddMinutes(10);
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
                "<div href=\" style=\"display: inline-block; background-color: #007bff; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 16px;\">" + otp + "</div>" +
                " </body>" +
                "</html>";

            var emailDto = new EmailDto(user.Email, "Email Verification", emailBody);
            await _mailService.SendEmailAsync(emailDto);

            return Ok("User Verification Sent");
        }


        [HttpPatch("verify-otp")]
        public async Task<IActionResult> Verify(OtpVerificationRequest request)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Email && u.Id == request.userId);
            if (user == null)
            {
                return BadRequest("User not Valid");
            }
            if (user.VerifiedAt.HasValue)
            {
                return BadRequest("Email is already verified");
            }

            // Hash the input OTP for comparison
            var hashedInputOtp = HashOtp(request.Otp);

            // Check if the OTP is correct and not expired
            if (user.Otp != hashedInputOtp)
            {
                return BadRequest("Invalid OTP");
            }
            if(user.OtpExpiry < DateTime.Now)
            {
                return BadRequest("OTP has expired");
            }

            user.VerifiedAt = DateTime.Now;
            user.Otp = null;
            user.OtpExpiry = null;
            await _context.SaveChangesAsync();

            return Ok(user);
        }


        [HttpPost("send-mail")]
        public async Task<bool> SendMail(EmailDto mailData)
        {
            return await _mailService.SendEmailAsync(mailData);
        }

        private string CreateRandomToken()
        {
            return Convert.ToHexString(RandomNumberGenerator.GetBytes(64));
        }

        private AuthResponseDto GenerateToken(User user)
        {
            var token = _tokenService.CreateToken(user);
            return new AuthResponseDto(new UserDto(user.Id, user.Email, user.FirstName, user.LastName), token);
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
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computedHash.SequenceEqual(passwordHash);
            }
        }

        private string HashOtp(string otp)
        {
            using (var sha256 = SHA256.Create())
            {
                // Convert OTP to byte array
                var otpBytes = Encoding.UTF8.GetBytes(otp);
                // Compute the hash
                var hashBytes = sha256.ComputeHash(otpBytes);
                // Convert the hash back to a string
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }
    }
}
