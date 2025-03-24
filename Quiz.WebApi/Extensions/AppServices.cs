using Quiz.Contract.App.Interfaces;
using Quiz.Contract.App.Repositories;
using Quiz.Contract.Web.Interfaces;
using Quiz.Contract.Web.Repositories;
using Quiz.MobileApi.Extensions;

namespace Quiz.WebApi.Extensions
{
    public static class AppServices
    {
        public static void GetServices(this IServiceCollection services)
        {
            services.AddScoped<IAggregateService, AggregateService>();
            services.AddScoped<ITokenService, TokenService>();
            services.AddScoped<ILoginRepository, LoginRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IApiLogRepository, ApiLogRepository>();
            services.AddScoped<IMenuRepository, MenuRepository>();
            services.AddScoped<IAppConfigRepository, AppConfigRepository>();
            services.AddScoped<IQuestionRepository, QuestionRepository>();

        }
    }
}