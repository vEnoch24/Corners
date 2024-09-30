using CornersBackendApi.src.Domain.Enum;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CornersBackendApi.src.Domain.Entities.Models.BuyerModels
{
    [Table("User")]
    public class User
    {
        [Key]
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string FirstName { get; set; }
        public string LastName { get; set; }
        [EmailAddress]
        public string Email { get; set; }
        public string Role { get; set; } = Roles.Buyer.ToString();
        public string? Otp { get; set; }
        public DateTime? OtpExpiry { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public byte[] passwordhash { get; set; } = new byte[32];
        public byte[] passwordSalt { get; set; } = new byte[32];
        public DateTime? VerifiedAt { get; set; }
        public string? PasswordRestToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }


        public ICollection<Order> Orders { get; set; }
    }
}
