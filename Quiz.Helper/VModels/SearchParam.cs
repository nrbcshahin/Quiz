namespace Quiz.Helper.VModels
{
    public class SearchParam : Paging
    {
        public string SearchText { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public bool? IsActive { get; set; }
        public string Gender { get; set; }
        public DateTime Date { get; set; }
        public int MenuId { get; set; }
        public int ParentId { get; set; }
        public int UserId { get; set; }
    }

    public class Paging 
    {
        public int PageNo { get; set; }
        public int PageSize { get; set; }
    }
}
