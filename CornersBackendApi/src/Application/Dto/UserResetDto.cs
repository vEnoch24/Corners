namespace CornersBackendApi.src.Application.Dto
{
    public class UserResetDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string? PasswordRestToken { get; set; }
    }
}
