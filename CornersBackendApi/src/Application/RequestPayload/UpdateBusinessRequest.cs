using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Application.RequestPayload
{
    public class UpdateBusinessRequest
    {
        [Required]
        public string Id { get; set; }
        [Required]
        public string BusinessName { get; set; }
        [Required]
        public string BusinessLocation { get; set; }
        [Phone]
        public string? BusinessPhoneNumber { get; set; }


        //Bank Account Details
        public int? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? Bank { get; set; }
    }
}
