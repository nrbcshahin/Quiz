using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class AppConfig
    {
        [Key]
        [Required]
        [StringLength(100)]
        [DisplayName("App Name")]
        public string ConfigKey { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Config Value")]
        public string ConfigValue { get; set; }
    }
}
