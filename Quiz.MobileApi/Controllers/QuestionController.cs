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
    [Route("api/question")]
    public class QuestionController : MyController
    {
        private readonly DbEntities _entities;

        public QuestionController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("question-list")]
        public async Task<IActionResult> QuestionList(SearchParam search)
        {
            var questions = await _entities.Questions
                .Include(x => x.Options)
                .Where(x => x.IsActive)
                .AsNoTracking()
                .ToListAsync();

            if (!questions.Any())
            {
                return Ok(new
                {
                    Success = false,
                    Message = "There are no question found",
                });
            }

            return Ok(new
            {
                Success = true,
                Questions = questions,
            });
        }
    }
}
