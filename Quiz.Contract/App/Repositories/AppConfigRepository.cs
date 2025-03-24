using Microsoft.EntityFrameworkCore;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;

namespace Quiz.Contract.App.Repositories
{
    public class AppConfigRepository : IAppConfigRepository
    {
        private readonly DbEntities _entities;

        public AppConfigRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<List<AppConfig>> GetAll()
        {
            return await _entities.AppConfigs
               .AsNoTracking()
               .ToListAsync();
        }

        public async Task<AppConfig> GetByKey(string configKey)
        {
            return await _entities.AppConfigs
               .Where(x => x.ConfigKey == configKey)
               .AsNoTracking()
               .FirstOrDefaultAsync();
        }
    }
}