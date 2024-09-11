using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CornersBackendApi.Data.Models.BuyerModels
{
    [Table("User")]
    public class User
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        public string? Otp { get; set; }
        public DateTime? OtpExpiry { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public byte[] passwordhash { get; set; } = new byte[32];
        public byte[] passwordSalt { get; set; } = new byte[32];
        public DateTime? VerifiedAt { get; set; }
        public string? PasswordRestToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }

    }
}
