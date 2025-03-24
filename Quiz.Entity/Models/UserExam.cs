namespace Quiz.Entity.Models
{
    public class UserExam : BaseModel
    {
        public int UserExamId { get; set; }
        public int UserId { get; set; }
        public int ExamId { get; set; }
        public ExamStatus Status { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public decimal Score { get; set; }


        public User User { get; set; }
        public Exam Exam { get; set; }
        public ICollection<UserAnswer> UserAnswers { get; set; }
    }

    public enum ExamStatus
    {
        NotStarted,
        InProgress,
        Completed,
        Expired
    }
}
