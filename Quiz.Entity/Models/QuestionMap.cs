using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class QuestionMap : BaseModel
    {
        [Key]
        public int MapId { get; set; }
        public int QuestionId { get; set; }
        public int MenuId { get; set; }
    }
}
