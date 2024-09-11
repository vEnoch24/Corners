using CornersBackendApi.CustomAttributes;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.Dto.SellerDtos
{
    public class RegisterBusinessDto
    {
        [Required]
        public string BusinessName { get; set; }
        [Required]
        [EmailAddress]
        public string BusinessEmail { get; set; }
        
        public int PhoneNumber { get; set; }

        [Required]
        public string BusinessLocation { get; set; }
        [Required, MinLength(5), DataType(DataType.Password)]
        [StrongPassword]
        public string Password { get; set; }

        [Required, Compare("Password")]
        public string ConfirmPassword { get; set; }
    }
}
