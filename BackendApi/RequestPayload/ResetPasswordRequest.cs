using System.ComponentModel.DataAnnotations;

namespace BackendApi.RequestPayload
{
    public class ResetPasswordRequest
    {
        [Required]
        public string Token { get; set; }

        [Required, MaxLength(20), DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;

        [Required, Compare("Password")]
        public string confirmPassword { get; set; } = string.Empty;
    }
}
