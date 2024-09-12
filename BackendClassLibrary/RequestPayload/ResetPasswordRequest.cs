using BackendClassLibrary.CustomAttributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.RequestPayload
{
    public class ResetPasswordRequest
    {
        [Required]
        public string Token { get; set; }

        [Required, DataType(DataType.Password)]
        [StrongPassword]
        public string Password { get; set; } = string.Empty;

        [Required, Compare("Password")]
        public string confirmPassword { get; set; } = string.Empty;
    }
}
