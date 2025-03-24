using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Interfaces
{
    public interface IMenuRepository
    {
        Task<PageList<Menu>> GetAll(SearchParam search);
        Task<int> Save(Menu menu);
        Task<int> Update(Menu menu);
        Task<Menu> GetById(int menuId);
        Task<Menu> GetByName(string menuName);
    }
}
