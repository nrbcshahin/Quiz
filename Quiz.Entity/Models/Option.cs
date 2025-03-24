using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Option
    {
        [Key]
        public int OptionId { get; set; }
        public string Title { get; set; }
        public bool IsActive { get; set; }
        public bool IsCorrect { get; set; }

        public int QuestionId { get; set; }
    }
}
