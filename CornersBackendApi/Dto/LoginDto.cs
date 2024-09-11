using CornersBackendApi.CustomAttributes;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.Dto
{
    public class LoginDto
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required, DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
