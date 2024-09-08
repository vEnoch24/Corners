using BackendApi.CustomAttributes;
using System.ComponentModel.DataAnnotations;

namespace BackendApi.Dto
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
