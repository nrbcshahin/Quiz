using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;


namespace Quiz.Helper.Helpers
{
    public class ExceptionFilter : ExceptionFilterAttribute
    {
        public override Task OnExceptionAsync(ExceptionContext context)
        {
            context.Result = new JsonResult(new
            {
                Success = false,
                Message = context.Exception.Message + " :: Inner Ex : " + context.Exception.InnerException?.Message
            });
            return Task.CompletedTask;
        }
    }
}