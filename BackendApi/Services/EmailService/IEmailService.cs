using BackendApi.Data;
using BackendApi.Dto;

namespace BackendApi.Services.EmailService
{
    public interface IEmailService
    {
        Task<bool> SendEmailAsync(EmailDto request);

        Task<bool> SendMail(MailData mailData);
    }
}
