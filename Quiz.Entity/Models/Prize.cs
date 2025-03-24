using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Prize
    {
        [Key]
        public int PrizeId { get; set; }
        public int EntityId { get; set; }
        public string Name { get; set; }
        public decimal Amount { get; set; }

        public ICollection<UserPrize> UserPrizes { get; set; }
    }
}
