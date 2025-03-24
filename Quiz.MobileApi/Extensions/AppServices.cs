using Microsoft.Extensions.DependencyInjection;
using Quiz.Contract.App.Interfaces;
using Quiz.Contract.App.Repositories;

namespace Quiz.MobileApi.Extensions
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

        }
    }
}