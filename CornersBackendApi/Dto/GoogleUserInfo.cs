using Newtonsoft.Json;

namespace CornersBackendApi.Dto
{
    public class GoogleUserInfo
    {

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        //[JsonProperty("picture")]
        //public string Picture { get; set; }
    }
}
