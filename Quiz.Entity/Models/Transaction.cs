using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Transaction
    {
        [Key]
        public int TransactionId { get; set; }
        public string DrCr { get; set; }
        public decimal Amount { get; set; }
        public string Narration { get; set; }
        public int UserId { get; set; }
        public DateTime TxnDate { get; set; }
    }
}
