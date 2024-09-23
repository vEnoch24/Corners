using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.Dto
{
    public class GoogleUserInfo
    {

        [JsonProperty("given_name")]
        public string FirstName { get; set; }

        [JsonProperty("family_name")]
        public string LastName { get; set; }

        [JsonProperty("email")]
        public string Email { get; set; }

        //[JsonProperty("picture")]
        //public string Picture { get; set; }

    }
}
