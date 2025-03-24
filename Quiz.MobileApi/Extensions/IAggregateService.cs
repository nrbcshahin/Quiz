using Microsoft.Extensions.Configuration;
using Quiz.Contract.App.Interfaces;

namespace Quiz.MobileApi.Extensions
{
    public interface IAggregateService
    {
        public ILoginRepository LoginRepository { get; set; }
        public IUserRepository UserRepository { get; set; }
        public IConfiguration Configuration { get; set; }
        public IApiLogRepository ApiLogRepository { get; set; }
        public ITokenService TokenService { get; set; }
        public IMenuRepository MenuRepository { get; set; }
    }
}