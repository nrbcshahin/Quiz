using Quiz.Entity.Models;

namespace Quiz.Contract.App.Interfaces
{
    public interface ILoginRepository
    {
        Task<int> Save(Login login);
        Task<int> Logout(int loginId);
        Task<int> Update(Login login);
        Task<List<Login>> GetAll();
        Task<Login> GetBySignature(string signature);
        Task<Login> GetByUserId(int userId);
    }
}