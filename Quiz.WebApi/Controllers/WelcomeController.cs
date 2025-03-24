using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;

namespace Quiz.WebApi.Controllers
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
                .Take(5)
                .AsNoTracking()
                .ToListAsync();

            return Ok(new
            {
                Success = true,
                Carousels = carousels,
            });
        }
    }
}
