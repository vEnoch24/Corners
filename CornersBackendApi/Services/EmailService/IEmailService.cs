using CornersBackendApi.Data;
using CornersBackendApi.Dto;

namespace CornersBackendApi.Services.EmailService
{
    public interface IEmailService
    {
        Task<bool> SendEmailAsync(EmailDto request);

        Task<bool> SendMail(MailData mailData);
    }
}
