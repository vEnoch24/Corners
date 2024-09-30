using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.RequestPayload
{
    public class UpdateBusinesssRequest
    {
        [Required]
        public string Id { get; set; }
        [Required]
        public string BusinessName { get; set; }
        [Required]
        public string? BusinessLocation { get; set; }
        //[EmailAddress]
        //public string? BusinessEmail { get; set; }
        [Phone]
        public string? BusinessPhoneNumber { get; set; }


        //Bank Account Details
        public int? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? Bank { get; set; }
    }
}
