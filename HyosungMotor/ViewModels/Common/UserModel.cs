using System.ComponentModel.DataAnnotations;

namespace HyosungMotor.ViewModels
{
    public class UserModel
    {//public Guid ID { get; set; }
        [Display(Name = "Login ID")]
        public string UserId { get; set; }

        [Display(Name = "Name")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address!")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Required")]
        [Display(Name = "Mobile")]
        [RegularExpression("^[0]{1}[19]{1}[0-9]{8,9}$", ErrorMessage = "Please enter valid phone no.")]
        public string Mobile { get; set; }

        [Display(Name = "Password")]
        public string Password { get; set; }

        public string Image { get; set; }

        public string RoleId { get; set; }
        public string RoleName { get; set; }
    }
}