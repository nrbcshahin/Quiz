using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Entity.Models;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;

namespace Quiz.WebApi.Controllers
{
    [ApiController]
    [Route("api/user")]
    public class UserController : MyController
    {
        private readonly DbEntities _entities;

        public UserController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("save-user")]
        public async Task<IActionResult> SaveUser([FromBody] User user)
        {
            var exist = await _entities.Menus
               .Where(x => x.Name == user.Name)
               .AsNoTracking()
               .FirstOrDefaultAsync();

            if (exist != null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "User already exist"
                });
            }

            await _entities.Users.AddAsync(user);
            var status = await _entities.SaveChangesAsync();

            if (status <= 0)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "User created failed"
                });
            }

            return Ok(new
            {
                Success = true,
                Message = "User created successfully."
            });
        }

        [HttpPost]
        [Route("update-user")]
        public IActionResult UpdateUser([FromBody] User user)
        {
            return Ok(new
            {
                Success = true,
                Message = "User update successfully."
            });
        }

        [HttpPost]
        [Route("user-info")]
        public async Task<IActionResult> UserInfoAsync([FromBody] AppParam param)
        {
            var user = await _entities.Users
               .Where(x => x.UserId == param.UserId)
               .AsNoTracking()
               .FirstOrDefaultAsync();

            return Ok(new
            {
                Success = true,
                Message = "User update successfully."
            });
        }
    }
}