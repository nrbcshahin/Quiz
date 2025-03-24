using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Quiz.Helper.VModels
{
    public class SetupParam
    {
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public int MenuId { get; set; }
        public int ModuleId { get; set; }
        public int PermissionId { get; set; }
        public int StatusId { get; set; }
        public int ProcessId { get; set; }
    }

    public class UserRoleParam
    {
        [Required]
        [DisplayName("User Id")]
        public int UserId { get; set; }

        [Required]
        [DisplayName("Roles")]
        public List<RoleParam> Roles { get; set; }
    }

    public class RoleParam
    {
        [Required]
        [DisplayName("Role Id")]
        public int RoleId { get; set; }
    }

    public class RolePermissionParam
    {
        [Required]
        [DisplayName("Role Id")]
        public int RoleId { get; set; }

        [Required]
        [DisplayName("Permissions")]
        public List<PermissionParam> Permissions { get; set; }
    }

    public class PermissionParam
    {
        [Required]
        [DisplayName("Permission Id")]
        public int PermissionId { get; set; }
    }
}
