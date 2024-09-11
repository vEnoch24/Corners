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

        //[HttpPost("business-login")]
        //public async Task<IActionResult> Login(LoginDto dto, CancellationToken cancellationToken)
        //{
        //    var user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(u => u.Email == dto.Email);

        //    if (user == null)
        //    {
        //        return BadRequest("User not found");
        //    }
        //    if (!VerifyPasswordHash(dto.Password, user.passwordhash, user.passwordSalt))
        //    {
        //        return BadRequest("Wrong Password!");
        //    }

        //    return Ok(GenerateToken(user));
        //}

        private string CreateRandomToken()
        {
            return Convert.ToHexString(RandomNumberGenerator.GetBytes(64));
        }

        private AuthBusinessResponseDto GenerateToken(Seller seller)
        {
            var token = _tokenService.CreateBusinessToken(seller);
            return new AuthBusinessResponseDto(new SellerDto(seller.Id, seller.Email, seller.Name), token);
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
    }
}
