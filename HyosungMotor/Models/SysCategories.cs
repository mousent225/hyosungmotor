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
    
    public partial class SysCategories
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SysCategories()
        {
            this.Posts = new HashSet<Posts>();
            this.SysCategoryValues = new HashSet<SysCategoryValues>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Remark { get; set; }
        public bool IsDeleted { get; set; }
        public Nullable<System.DateTime> DateDeleted { get; set; }
        public string UserDeleted { get; set; }
        public string UserCreated { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string UserModified { get; set; }
        public Nullable<System.DateTime> DateModified { get; set; }
        public int Status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Posts> Posts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SysCategoryValues> SysCategoryValues { get; set; }
    }
}
