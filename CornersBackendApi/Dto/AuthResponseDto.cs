using CornersBackendApi.Data.Models;

namespace CornersBackendApi.Dto
{
    public record AuthResponseDto(UserDto User, string Token);
}
