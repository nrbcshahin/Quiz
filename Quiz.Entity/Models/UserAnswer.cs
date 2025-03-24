namespace Quiz.Entity.Models
{
    public class UserAnswer
    {
        public int UserAnswerId { get; set; }
        public int UserExamId { get; set; } 
        public int QuestionId { get; set; } 
        public int OptionId { get; set; } 
        public int TimeTaken { get; set; }  
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }

        public UserExam UserExam { get; set; }
        public Question Question { get; set; }
        public Option Option { get; set; }
    }
}
