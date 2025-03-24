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
    [Route("api/subject")]
    public class SubjectController : MyController
    {
        private readonly DbEntities _entities;

        public SubjectController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("subject-list")]
        public async Task<IActionResult> SubjectList(SearchParam param)
        {
            var subjects = await _entities.Subjects
                        .Where(x => x.IsActive)
                        .OrderBy(x => x.SerialNo)
                        .AsNoTracking()
                        .ToListAsync();

            return Ok(new
            {
                Success = true,
                Subjects = subjects
            });
        }
    }
}
