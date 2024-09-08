using BackendApi.Data.Models;

namespace BackendApi.Dto
{
    public record AuthResponseDto(UserDto User, string Token);
}
