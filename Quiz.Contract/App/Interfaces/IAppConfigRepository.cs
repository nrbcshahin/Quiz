using Quiz.Entity.Models;

namespace Quiz.Contract.App.Interfaces
{
    public interface IAppConfigRepository
    {
        Task<List<AppConfig>> GetAll();
        Task<AppConfig> GetByKey(string configKey);
    }
}
