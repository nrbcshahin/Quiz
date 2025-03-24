using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class Menu
    {
        [Key]
        public int MenuId { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public bool IsActive { get; set; }
        public int SerialNo { get; set; }
    }
}
