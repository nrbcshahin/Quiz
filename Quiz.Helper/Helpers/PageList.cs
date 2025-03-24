using Microsoft.EntityFrameworkCore;
using Quiz.Helper.VModels;

namespace Quiz.Helper.Helpers
{
    public class PageList<T> : List<T>
    {
        public PageData PageData { get; }

        private PageList(IEnumerable<T> items, int count, int pageNo, int pageSize)
        {

            PageData = new PageData
            {
                TotalRow = count,
                PageSize = pageSize,
                CurrentPage = pageNo,
                TotalPage = (int)Math.Ceiling(count / (double)pageSize),
            };
            AddRange(items);
        }

        public static async Task<PageList<T>> ToPageList(IQueryable<T> source, Paging paging)
        {
            var count = source.Count();

            if (paging.PageSize > 0)
            {
                source = source.Skip(paging.PageSize * paging.PageNo)
                    .Take(paging.PageSize);
            }

            var result = await source.ToListAsync();

            return new PageList<T>(result, count, paging.PageNo, paging.PageSize);
        }
    }

    public class PageData
    {
        public int CurrentPage { get; set; }
        public int PageSize { get; set; }
        public int TotalPage { get; set; }
        public int TotalRow { get; set; }
    }
}