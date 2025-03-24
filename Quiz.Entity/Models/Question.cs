using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Question
    {
        [Key]
        public int QuestionId { get; set; }
        public string Title { get; set; }
        public bool IsActive { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Option> Options { get; set; }
    }
}