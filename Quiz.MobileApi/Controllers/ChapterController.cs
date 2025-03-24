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
    [Route("api/chapter")]
    public class ChapterController : MyController
    {
        private readonly DbEntities _entities;

        public ChapterController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("chapter-list")]
        public async Task<IActionResult> ChapterList(SearchParam param)
        {
            var chapters = await _entities.Chapters
                        .Where(x => x.IsActive)
                        .OrderBy(x => x.SerialNo)
                        .AsNoTracking()
                        .ToListAsync();

            return Ok(new
            {
                Success = true,
                Chapters = chapters
            });
        }
    }
}
