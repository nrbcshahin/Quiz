using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Quiz.Entity.Models
{
    public class UserPrize
    {
        [Key]
        public int UpId { get; set; }

        public int EntityId { get; set; }

        [ForeignKey("Prizes")]
        public int PrizeId { get; set; }

        [ForeignKey("Users")]
        public int UserId { get; set; }

        public virtual Prize Prize { get; set; }
        public virtual User User { get; set; }
    }
}
