
using CornersBackendApi.src.Domain.CustomAttributes;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Application.RequestPayload
{
    public class ResetPasswordRequest
    {
        public string Token { get; set; }

        [Required, DataType(DataType.Password)]
        [StrongPassword]
        public string Password { get; set; } = string.Empty;

        [Required, Compare("Password")]
        public string confirmPassword { get; set; } = string.Empty;
    }
}
