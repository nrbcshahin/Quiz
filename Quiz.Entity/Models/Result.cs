namespace Quiz.Entity.Models
{
    public class Result
    {
        public int ResultId { get; set; }
        public int UserExamId { get; set; }
        public int Total { get; set; }
        public int Correct { get; set; }
        public int Incorrect { get; set; }
        public decimal Score { get; set; } 
        public bool Passed { get; set; } 
        public DateTime CreatedDate { get; set; }

        public UserExam UserExam { get; set; }
    }
}
