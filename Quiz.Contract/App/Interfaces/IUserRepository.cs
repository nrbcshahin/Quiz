using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Interfaces
{
    public interface IUserRepository
    {
        Task<User> GetById(int userId);
        Task<User> GetByMobile(string userName);
        Task<int> Save(User user);
        Task<PageList<User>> GetAll(SearchParam search);
        Task<int> Update(User user);
    }
}