using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Helper.VModels;
using Quiz.MobileApi.Extensions;
using System.Linq;
using System.Threading.Tasks;

namespace Quiz.MobileApi.Controllers
{
    [ApiController]
    [Route("api/menu")]
    public class MenuController : MyController
    {
        private readonly DbEntities _entities;

        public MenuController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("menu-list")]
        public async Task<IActionResult> MenuList(SearchParam param)
        {
            var menus = await _entities.Menus
                        .Where(x=>x.IsActive)
                        .OrderBy(x=>x.SerialNo)
                        .AsNoTracking()
                        .ToListAsync();

            return Ok(new
            {
                Success = true,
                Menus = menus
            });
        }
    }
}
