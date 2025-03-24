using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Quiz.Entity.Models
{
    public class Login
    {
        [Key]
        public int LoginId { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int UserId { get; set; }

        [Required]
        [DisplayName("Is Login")]
        public bool IsLogin { get; set; }

        [Required]
        [DataType(DataType.DateTime)]
        [DisplayName("Login Date")]
        public DateTime LoginDate { get; set; }

        [DataType(DataType.DateTime)]
        [DisplayName("Logout Date")]
        public DateTime? LogoutDate { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Device Info")]
        public string DeviceInfo { get; set; }

        [Required]
        [StringLength(250)]
        [DataType(DataType.Text)]
        [DisplayName("Machine Name")]
        public string MachineName { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Machine Info")]
        public string MachineInfo { get; set; }

        [Required]
        [StringLength(250)]
        [DataType(DataType.Text)]
        [DisplayName("Login Ip")]
        public string LoginIp { get; set; }

        [Required]
        [DisplayName("Attempt")]
        public int Attempt { get; set; }

        [JsonIgnore]
        [DataType(DataType.Text)]
        [DisplayName("Signature")]
        public string Signature { get; set; }

        public virtual User User { get; set; }
    }
}