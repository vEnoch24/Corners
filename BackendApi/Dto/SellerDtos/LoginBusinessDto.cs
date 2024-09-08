using System.ComponentModel.DataAnnotations;

namespace BackendApi.Dto.SellerDtos
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
