using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public partial class Carousel
    {
        [Key]
        public int CarouselId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public bool IsActive { get; set; }
        public int AppId { get; set; }
        public int SerialNo { get; set; }
    }
}
