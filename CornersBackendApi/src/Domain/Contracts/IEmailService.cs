using CornersBackendApi.src.Application.Dto;
using CornersBackendApi.src.Domain.Entities;

namespace CornersBackendApi.src.Domain.Contracts
{
    public interface IEmailService
    {
        Task<bool> SendEmailAsync(EmailDto request);

        Task<bool> SendMail(MailData mailData);
    }
}
