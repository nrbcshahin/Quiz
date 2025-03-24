using Microsoft.EntityFrameworkCore;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;

namespace Quiz.Contract.App.Repositories
{
    public class LoginRepository : ILoginRepository
    {
        private readonly DbEntities _entities;

        public LoginRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<int> Save(Login login)
        {
            await _entities.Logins.AddAsync(login);
            return await _entities.SaveChangesAsync();
        }

        public async Task<int> Update(Login login)
        {
            var loginInfo = await _entities.Logins
                .Where(x => x.LoginId == login.LoginId)
                .FirstOrDefaultAsync();

            if (loginInfo == null)
            {
                return 0;
            }

            loginInfo.IsLogin = login.IsLogin;
            loginInfo.LoginDate = DateTime.Now;
            loginInfo.DeviceInfo = login.DeviceInfo;
            loginInfo.LoginIp = login.LoginIp;
            loginInfo.MachineName = login.MachineName;
            loginInfo.MachineInfo = login.MachineInfo;
            loginInfo.Attempt = login.Attempt;
            loginInfo.Signature = login.Signature;

            return await _entities.SaveChangesAsync();
        }

        public async Task<int> Logout(int loginId)
        {
            var loginInfo = await _entities.Logins
                .Where(x => x.LoginId == loginId)
                .FirstOrDefaultAsync();

            if (loginInfo == null)
            {
                return 0;
            }

            loginInfo.IsLogin = false;
            loginInfo.Attempt = 0;
            loginInfo.LogoutDate = DateTime.Now;
            loginInfo.Signature = null;

            return await _entities.SaveChangesAsync();
        }

        public async Task<List<Login>> GetAll()
        {
            return await _entities.Logins
                .Where(x => x.IsLogin)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Login> GetByUserId(int userId)
        {
            return await _entities.Logins
                .Where(x => x.UserId == userId)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<Login> GetBySignature(string signature)
        {
            return await _entities.Logins
                .Where(x => x.Signature == signature)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }
    }
}