using System.ComponentModel;
using System.Runtime.Serialization;

namespace CornersBackendApi.Enum
{
    public enum Roles
    {
        [Description("Seller")]
        [EnumMember(Value = "Seller")]
        Seller,

        [Description("Buyer")]
        [EnumMember(Value = "Buyer")]
        Buyer
    }
}
