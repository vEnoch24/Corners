
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Authorization;
using System.Text;
using static System.Net.WebRequestMethods;
using Microsoft.Extensions.Options;
using System.Threading;
using CornersBackendApi.src.Domain.Entities.Models.BuyerModels;
using CornersBackendApi.src.Application.Services;
using CornersBackendApi.src.Application.Dto;
using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Infrastructure.Persistence.Data;

namespace CornersBackendApi.src.Presentation.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly TokenService _tokenService;
        private readonly IEmailService _mailService;
        private readonly GoogleAuthSettingsDto _googleAuthSettings;
        private readonly IConfiguration _configuration;

        public AccountController(ApplicationDbContext context, TokenService tokenService,
            IEmailService mailService, IOptions<GoogleAuthSettingsDto> googleAuthSettings, IConfiguration configuration)
        {
            _context = context;
            _tokenService = tokenService;
            _mailService = mailService;
            _googleAuthSettings = googleAuthSettings.Value;
            _configuration = configuration;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterDto dto, CancellationToken cancellationToken)
        {
            var userExists = await _context.Users.AsNoTracking().AnyAsync(u => u.Email == dto.Email, cancellationToken);

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


        [HttpPatch("forgot-password")]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordRequest request)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
            if (user == null)
            {
                return BadRequest("User not found");
            }

            try
            {
                user.PasswordRestToken = new Random().Next(10000, 100000).ToString();
                user.ResetTokenExpires = DateTime.Now.AddMinutes(30);
                await SendPasswordResetEmail(request.Email, user.PasswordRestToken);

                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


            return Ok(user);
        }

        [HttpPatch("reset-password")]
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

        [HttpGet("google-auth")]
        public async Task<IActionResult> GetGoogleAuthSettings()
        {
            return Ok(new
            {
                _googleAuthSettings.ClientId,
                _googleAuthSettings.ClientSecret,
            });
        }

        [HttpPost("signin-google")]
        public async Task<IActionResult> GoogleLogin()
        {
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("GoogleResponse")
            };

            return Challenge(properties, GoogleDefaults.AuthenticationScheme);
        }

        [HttpPost("maui-signin-google")]
        public async Task<IActionResult> GoogleMauiLogin()
        {
            var clientId = _configuration.GetSection("Authentication:Google:ClientId").Value; // Read from configuration
            //var redirectUri = "https://localhost:44365/signin-google"; // Example: "com.companyname.app:/auth";
            var redirectUri = "http://localhost:5000/authcallback/";

            var googleUrl = "https://accounts.google.com/o/oauth2/auth" +
                            $"?scope=openid email profile&" +
                            $"access_type=offline&" +
                            $"include_granted_scopes=true&" +
                            $"response_type=code&" +
                            $"client_id={clientId}" +
                            $"&redirect_uri={redirectUri}";

            return Ok(new { url = googleUrl });
        }

        [HttpPost("store-google-user")]
        public async Task<IActionResult> StoreGoolgeUser(GoogleUserInfo googleUser, CancellationToken cancellationToken)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == googleUser.Email);

            if (user == null)
            {
                user = new User
                {
                    Email = googleUser.Email,
                    FirstName = googleUser.FirstName,
                    LastName = googleUser.LastName,
                    DateAdded = DateTime.UtcNow,
                    VerifiedAt = DateTime.UtcNow,
                };

                await _context.Users.AddAsync(user, cancellationToken);
                await _context.SaveChangesAsync(cancellationToken);
            }


            return Ok(GenerateToken(user));
        }

        [HttpGet("google-response")]
        public async Task<IActionResult> GoogleResponse()
        {
            var authenticateResult = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            if (!authenticateResult.Succeeded || authenticateResult.Principal == null)
            {
                return BadRequest("Google authentication failed.");
            }

            var claims = authenticateResult.Principal.Identities.FirstOrDefault()?.Claims.Select(claim => new
            {
                claim.Issuer,
                claim.OriginalIssuer,
                claim.Type,
                claim.Value
            });

            return Ok(claims);
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
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
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
            if (user.OtpExpiry < DateTime.Now)
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
            return new AuthResponseDto(new UserDto(user.Id, user.Email, user.FirstName, user.LastName, user.Role), token);
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
