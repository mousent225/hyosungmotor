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
    
    public partial class SP_BANNER_GETALL_Result
    {
        public int Id { get; set; }
        public string Heading { get; set; }
        public string SubHeading { get; set; }
        public Nullable<bool> HasKo { get; set; }
        public Nullable<bool> HasVi { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string UserCreated { get; set; }
        public Nullable<System.DateTime> DateModified { get; set; }
        public string UserModified { get; set; }
        public int Status { get; set; }
        public int PublishStatus { get; set; }
    }
}
