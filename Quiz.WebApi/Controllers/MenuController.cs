using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;

namespace Quiz.WebApi.Controllers
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
        public async Task<IActionResult> MenuList(SearchParam search)
        {
            var menus = await _entities.Questions
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
