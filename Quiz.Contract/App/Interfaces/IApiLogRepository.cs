using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Interfaces
{
    public interface IApiLogRepository
    {
        Task<PageList<ApiLog>> GetAll(SearchParam search);
        Task<ApiLog> GetById(int logId);
        Task<int> Save(ApiLog apiLog);
    }
}
