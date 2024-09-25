using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Application.Dto.SellerDtos
{
    public class LoginBusinessDto
    {
        [Required]
        [EmailAddress]
        public string BusinessEmail { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
