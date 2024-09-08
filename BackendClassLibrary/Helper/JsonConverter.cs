using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace BackendClassLibrary.Helper
{
    public class JsonConverter
    {
        public static JsonSerializerOptions JsonSerializerOptions => new()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            //PropertyNameCaseInsensitive = true,
        };

        public static string Serialize(object value, JsonSerializerOptions? jsonSerializerOptions = null)
        {
            return JsonSerializer.Serialize(value, jsonSerializerOptions ?? JsonSerializerOptions);
        }

        public static TResult? Deserialize<TResult>(string serializeString, JsonSerializerOptions? jsonSerializerOptions = null)
        {
            return JsonSerializer.Deserialize<TResult>(serializeString, jsonSerializerOptions ?? JsonSerializerOptions);
        }
    }
}
