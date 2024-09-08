namespace BackendApi.Data.Models.SellerModels
{
    public class Seller
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Name { get; set; }
        public int? PhoneNumber { get; set; }
        public string Email { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public byte[] PasswordHash { get; set; } = new byte[32];
        public byte[] PasswordSalt { get; set; } = new byte[32];
        public string? EmailVerificationToken { get; set; }
        public DateTime? VerifiedAt { get; set; }
        public string? PasswordRestToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }


        //Bank Account Details
        public int? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? Bank { get; set; }
    }
}
