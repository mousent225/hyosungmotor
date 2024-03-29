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
    
    public partial class SysDictionnary
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SysDictionnary()
        {
            this.SysCategoryValues = new HashSet<SysCategoryValues>();
        }
    
        public int Id { get; set; }
        public string Language1 { get; set; }
        public string Language2 { get; set; }
        public string Language3 { get; set; }
        public string Language4 { get; set; }
        public string Language5 { get; set; }
        public int MasterId { get; set; }
        public int ModuleId { get; set; }
        public bool IsDeleted { get; set; }
        public Nullable<System.DateTime> DateDeleted { get; set; }
        public string UserDeleted { get; set; }
        public string UserCreated { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string UserModified { get; set; }
        public Nullable<System.DateTime> DateModified { get; set; }
        public int Status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SysCategoryValues> SysCategoryValues { get; set; }
    }
}
