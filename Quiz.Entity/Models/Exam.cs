using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Exam : BaseModel
    {
        [Key]
        public int ExamId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsRandom { get; set; }
        public decimal PassScore { get; set; }
        public ExamType ExamType { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<UserExam> UserExams { get; set; }
    }

    public enum ExamType
    {
        Timed,
        Untimed,
        Practice
    }
}
