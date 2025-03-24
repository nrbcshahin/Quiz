
using Microsoft.EntityFrameworkCore;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.App.Repositories
{
    public class ApiLogRepository : IApiLogRepository
    {
        private readonly DbEntities _entities;

        public ApiLogRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<ApiLog> GetById(int logId)
        {
            return await _entities.ApiLogs
                .Include(x => x.User)
                .Where(x => x.LogId == logId)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<PageList<ApiLog>> GetAll(SearchParam search)
        {
            IQueryable<ApiLog> data = _entities.ApiLogs
                .Include(x => x.User);

            if (search.FromDate != null && search.ToDate != null)
            {
                data = data.Where(x => x.RequestDate >= search.FromDate && x.RequestDate <= search.ToDate);
            }

            if (search.SearchText != null)
            {
                data = data.Where(x => x.Action.Contains(search.SearchText) ||
                                       x.Controller.Contains(search.SearchText) ||
                                       x.ClientIp.Contains(search.SearchText));
            }

            data = data.AsNoTracking().OrderByDescending(x => x.LogId);

            return await PageList<ApiLog>.ToPageList(data, search);
        }

        public async Task<int> Save(ApiLog apiLog)
        {
            await _entities.ApiLogs.AddAsync(apiLog);
            return await _entities.SaveChangesAsync();
        }
    }
}