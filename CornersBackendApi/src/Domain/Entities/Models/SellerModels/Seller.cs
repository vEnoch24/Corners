using CornersBackendApi.src.Domain.Enum;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Domain.Entities.Models.SellerModels
{
    public class Seller : BusinessDetails
    {
        [Key]
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; } = Roles.Seller.ToString();
        public string? Otp { get; set; }
        public DateTime? OtpExpiry { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public byte[] PasswordHash { get; set; } = new byte[32];
        public byte[] PasswordSalt { get; set; } = new byte[32];
        public string? EmailVerificationToken { get; set; }
        public DateTime? VerifiedAt { get; set; }
        public string? PasswordRestToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }


        public ICollection<Products> Products { get; set; }
    }
}
