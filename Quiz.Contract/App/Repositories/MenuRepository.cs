using Microsoft.EntityFrameworkCore;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Repositories
{
    public class MenuRepository : IMenuRepository
    {
        private readonly DbEntities _entities;

        public MenuRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<int> Save(Menu menu)
        {
            await _entities.Menus.AddAsync(menu);
            return await _entities.SaveChangesAsync();
        }

        public async Task<int> Update(Menu menu)
        {
            _entities.Update(menu);
            return await _entities.SaveChangesAsync();
        }

        public async Task<Menu> GetById(int menuId)
        {
            return await _entities.Menus
                .Where(x => x.MenuId == menuId)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<Menu> GetByName(string menuName)
        {
            return await _entities.Menus
                .Where(x => x.Name == menuName)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<PageList<Menu>> GetAll(SearchParam search)
        {
            IQueryable<Menu> data = _entities.Menus;

            if (search.SearchText != null)
            {
                data = data.Where(x => x.Name.Contains(search.SearchText));
            }

            data = data.AsNoTracking().OrderByDescending(x => x.MenuId);

            return await PageList<Menu>.ToPageList(data, search);
        }
    }
}