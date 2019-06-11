//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HyosungMotor.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SysUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SysUser()
        {
            this.SysUserRoleMapping = new HashSet<SysUserRoleMapping>();
        }
    
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
        public Nullable<int> Status { get; set; }
        public string CreateUid { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string UpdateUid { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public string DeleteUid { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SysUserRoleMapping> SysUserRoleMapping { get; set; }
    }
}
