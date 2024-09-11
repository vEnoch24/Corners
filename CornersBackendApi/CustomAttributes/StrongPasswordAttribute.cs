using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace CornersBackendApi.CustomAttributes
{
    public class StrongPasswordAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value is string password)
            {
                // Example criteria: At least 5 characters, 1 uppercase, 1 lowercase, 1 digit, 1 special character
                if (password.Length < 5 ||
                    !Regex.IsMatch(password, @"[A-Z]") || // At least one uppercase letter
                    !Regex.IsMatch(password, @"[a-z]") || // At least one lowercase letter
                    !Regex.IsMatch(password, @"\d") ||    // At least one digit
                    !Regex.IsMatch(password, @"[@$!%*?&#]")) // At least one special character
                {
                    return new ValidationResult("Password must be at least 5 characters long and include uppercase(A-Z), lowercase(a-z), digit(0-9), and special character.");
                }

                return ValidationResult.Success;
            }

            return new ValidationResult("Invalid password.");
        }
    }
}
