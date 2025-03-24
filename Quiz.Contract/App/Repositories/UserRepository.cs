using Microsoft.EntityFrameworkCore;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DbEntities _entities;

        public UserRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<User> GetById(int userId)
        {
            return await _entities.Users
                .Include(x => x.Logins)
                .Where(x => x.UserId == userId)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<User> GetByMobile(string mobile)
        {
            return await _entities.Users
                .Where(x => x.Mobile == mobile)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<int> Save(User user)
        {
            await _entities.Users.AddAsync(user);
            return await _entities.SaveChangesAsync();
        }

        public async Task<int> Update(User user)
        {
            _entities.Update(user);
            _entities.Entry(user).Property(p => p.Password).IsModified = false;
            return await _entities.SaveChangesAsync();
        }

        public async Task<PageList<User>> GetAll(SearchParam search)
        {
            IQueryable<User> data = _entities.Users;

            if (search.IsActive != null)
            {
                data = data.Where(x => x.IsActive == search.IsActive);
            }

            if (search.Gender != null)
            {
                data = data.Where(x => x.Gender == search.Gender);
            }

            if (search.SearchText != null)
            {
                data = data.Where(x => x.Name.Contains(search.SearchText) ||
                                       x.Email.Contains(search.SearchText) ||
                                       x.Mobile.Contains(search.SearchText));
            }

            data = data.AsNoTracking().OrderByDescending(x => x.UserId);

            return await PageList<User>.ToPageList(data, search);
        }
    }
}