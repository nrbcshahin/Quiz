using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using Quiz.Entity.Models;

namespace Quiz.Helper.VModels
{
    public class LoginRequest
    {
        public string Mobile { get; set; }
        public string Password { get; set; }
    }

    public class LoginResponse : Response
    {
        public User User { get; set; }
    }


    public class AppParam
    {
        public int UserId { get; set; }
        public int NotificationId { get; set; }
        public DateTime Date { get; set; }
    }

    public class AppSignature
    {
        public string Signature { get; set; }
        public int UserId { get; set; }
    }

    public class SendNotificationParam
    {
        [Required]
        [Range(1, int.MaxValue)]
        [DisplayName("Notification Id")]
        public int NotificationId { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        [DisplayName("Type Id")]
        public int TypeId { get; set; }

        [Required]
        [DisplayName("Users")]
        public List<UserParam> Users { get; set; }
    }

    public class UserParam
    {
        [Required]
        [DisplayName("User Id")]
        public int UserId { get; set; }
    }
}
