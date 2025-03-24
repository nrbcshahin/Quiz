using Microsoft.EntityFrameworkCore;
using Quiz.Contract.Web.Interfaces;
using Quiz.Entity.Database;
using Quiz.Entity.Models;
using Quiz.Helper.Helpers;
using Quiz.Helper.VModels;

namespace Quiz.Contract.Web.Repositories
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly DbEntities _entities;

        public QuestionRepository(DbEntities entities)
        {
            _entities = entities;
        }

        public async Task<PageList<Question>> GetAll(SearchParam param)
        {
            IQueryable<Question> data = _entities.Questions;

            if (param.SearchText != null)
            {
                data = data.Where(x => x.Title.Contains(param.SearchText));
            }

            data = data.AsNoTracking().OrderByDescending(x => x.QuestionId);

            return await PageList<Question>.ToPageList(data, param);
        }
    }
}
