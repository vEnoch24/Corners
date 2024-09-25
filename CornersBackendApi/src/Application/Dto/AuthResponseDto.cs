using CornersBackendApi.src.Application.Dto;

namespace CornersBackendApi.src.Application.Dto
{
    public record AuthResponseDto(UserDto User, string Token);
}
