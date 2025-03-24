using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Quiz.Entity.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Name")]
        public string Name { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Password")]
        public string Password { get; set; }

        [Required]
        [StringLength(250)]
        [DataType(DataType.Text)]
        [DisplayName("Image")]
        public string Image { get; set; }

        [Required]
        [StringLength(20)]
        [DataType(DataType.PhoneNumber)]
        [DisplayName("Mobile")]
        public string Mobile { get; set; }

        [StringLength(200)]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Email")]
        public string Email { get; set; }

        [Required]
        [DisplayName("Is Active")]
        public bool IsActive { get; set; }

        [Required]
        [DataType(DataType.DateTime)]
        [DisplayName("Join Date")]
        public DateTime JoinDate { get; set; }

        [Required]
        [StringLength(1)]
        [DisplayName("Gender")]
        public string Gender { get; set; }

        [Required]
        [DisplayName("Role")]
        public Role Role { get; set; }

        public virtual Login Logins { get; set; }
        public ICollection<UserPrize> UserPrizes { get; set; }

    }

    public enum Role
    {
        Student,
        Teacher,
        Admin
    }
}