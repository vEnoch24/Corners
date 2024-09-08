namespace BackendApi.RequestPayload
{
    public class OtpVerificationRequest
    {
        public string userId { get; set; }
        public string Email { get; set; }
        public string Otp {  get; set; }
    }
}
