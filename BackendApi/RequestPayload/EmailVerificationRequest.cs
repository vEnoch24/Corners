namespace BackendApi.RequestPayload
{
    public class EmailVerificationRequest
    {
        public string userId { get; set; }
        public string Email { get; set; }
    }
}
