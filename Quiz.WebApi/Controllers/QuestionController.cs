using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Quiz.Contract.Web.Interfaces;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;

namespace Quiz.WebApi.Controllers
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/question")]
    public class QuestionController : MyController
    {
        private readonly IQuestionRepository _question;

        public QuestionController(
            IAggregateService aggregate,
            IQuestionRepository question) : base(aggregate)
        {
            _question = question;
        }

        [HttpPost]
        [Route("question-list")]
        public async Task<IActionResult> QuestionList(SearchParam param)
        {
            var questions = await _question.GetAll(param);

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
                Page = questions.PageData
            });
        }
    }
}
