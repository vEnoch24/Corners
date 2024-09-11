using CornersBackendApi.CustomAttributes;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.Dto
{
    public class RegisterDto
    {
        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required, MinLength(5), DataType(DataType.Password)]
        [StrongPassword]
        public string Password { get; set; }

        [Required, Compare("Password")]
        public string confirmPassword { get; set; }

    }
}
