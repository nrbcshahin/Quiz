using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Helper.VModels;
using Quiz.MobileApi.Extensions;
using System.Linq;
using System.Threading.Tasks;

namespace Quiz.MobileApi.Controllers
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/welcome")]
    public class WelcomeController : MyController
    {
        private readonly DbEntities _entities;

        public WelcomeController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("")]
        public async Task<IActionResult> GetData([FromBody] SearchParam search)
        {
            var carousels = await _entities.Carousels
                .Where(x => x.IsActive)
                .OrderBy(x => x.SerialNo)
                .Take(5)
                .AsNoTracking()
                .ToListAsync();

            var menus = await _entities.Menus
               .Where(x => x.IsActive)
               .OrderBy(x=>x.SerialNo)
               .Take(6)
               .AsNoTracking()
               .ToListAsync();

            var courses = await _entities.Courses
              .Where(x => x.IsActive)
              .OrderBy(x => x.SerialNo)
              .Take(10)
              .AsNoTracking()
              .ToListAsync();

            var exams = await _entities.Exams
             .Where(x => x.IsActive)
             .OrderBy(x => x.SerialNo)
             .Take(10)
             .AsNoTracking()
             .ToListAsync();

            return Ok(new
            {
                Success = true,
                Carousels = carousels,
                Menus = menus,
                Courses = courses,
                Exams = exams
            });
        }
    }
}
