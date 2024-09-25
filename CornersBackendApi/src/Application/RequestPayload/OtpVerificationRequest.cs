namespace CornersBackendApi.src.Application.RequestPayload
{
    public class OtpVerificationRequest
    {
        public string Email { get; set; }
        public string Otp { get; set; }
    }
}
