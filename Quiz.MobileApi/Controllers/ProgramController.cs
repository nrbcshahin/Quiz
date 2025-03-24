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
    [Route("api/program")]
    public class ProgramController : MyController
    {
        private readonly DbEntities _entities;

        public ProgramController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("program-list")]
        public async Task<IActionResult> ProgramList(SearchParam param)
        {
            var programs = await _entities.Programs
                        .Where(x => x.IsActive)
                        .OrderBy(x => x.SerialNo)
                        .AsNoTracking()
                        .ToListAsync();

            return Ok(new
            {
                Success = true,
                Programs = programs
            });
        }
    }
}
