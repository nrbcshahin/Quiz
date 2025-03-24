using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.Web.Interfaces
{
    public interface IQuestionRepository
    {
        Task<PageList<Question>> GetAll(SearchParam param);
    }
}
