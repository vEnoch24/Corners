using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Domain.Entities.Models.SellerModels
{
    public class BusinessDetails
    {
        public string? BusinessName { get; set; }
        public string? BusinessLocation { get; set; }
        [EmailAddress]
        public string? BusinessEmail { get; set; }
        [Phone]
        public string? BusinessPhoneNumber { get; set; }


        //Bank Account Details
        public int? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? Bank { get; set; }
    }
}
