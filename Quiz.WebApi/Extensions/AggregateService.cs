using Quiz.Contract.App.Interfaces;
using Quiz.WebApi.Extensions;

namespace Quiz.MobileApi.Extensions
{
    public class AggregateService : IAggregateService
    {
        public ILoginRepository LoginRepository { get; set; }
        public IUserRepository UserRepository { get; set; }
        public IConfiguration Configuration { get; set; }
        public IApiLogRepository ApiLogRepository { get; set; }
        public ITokenService TokenService { get; set; }
        public IMenuRepository MenuRepository { get; set; }

        public AggregateService(ILoginRepository loginRepository,
            IUserRepository userRepository,
            IConfiguration configuration,
            IApiLogRepository apiLogRepository,
            ITokenService tokenService,
            IMenuRepository menuRepository)
        {
            LoginRepository = loginRepository;
            UserRepository = userRepository;
            Configuration = configuration;
            ApiLogRepository = apiLogRepository;
            TokenService = tokenService;
            MenuRepository = menuRepository;
        }
    }
}