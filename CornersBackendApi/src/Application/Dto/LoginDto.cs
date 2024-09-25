using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Application.Dto
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
