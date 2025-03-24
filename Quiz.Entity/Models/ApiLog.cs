using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Quiz.Entity.Models
{
    public class ApiLog
    {
        [Key]
        public int LogId { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        [DisplayName("UserId")]
        public int UserId { get; set; }

        [Required]
        [StringLength(20)]
        [DataType(DataType.Text)]
        [DisplayName("Controller")]
        public string Controller { get; set; }

        [Required]
        [StringLength(50)]
        [DataType(DataType.Text)]
        [DisplayName("Action")]
        public string Action { get; set; }

        [Required]
        [StringLength(250)]
        [DataType(DataType.Url)]
        [DisplayName("Request Url")]
        public string RequestUrl { get; set; }

        [Required]
        [StringLength(50)]
        [DataType(DataType.Text)]
        [DisplayName("Client Ip")]
        public string ClientIp { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Device Info")]
        public string DeviceInfo { get; set; }

        [Required]
        [StringLength(500)]
        [DataType(DataType.Text)]
        [DisplayName("Machine Info")]
        public string MachineInfo { get; set; }

        [DataType(DataType.Text)]
        [DisplayName("Response Data")]
        public string RequestData { get; set; }

        [DataType(DataType.Text)]
        [DisplayName("Header Data")]
        public string HeaderData { get; set; }

        [DataType(DataType.Text)]
        [DisplayName("Response Data")]
        public string ResponseData { get; set; }

        [Required]
        [DisplayName("Request Date")]
        [DataType(DataType.DateTime)]
        public DateTime RequestDate { get; set; }

        public virtual User User { get; set; }
    }
}