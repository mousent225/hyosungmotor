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
    
    public partial class TdStandardMotor
    {
        public int Id { get; set; }
        public string kw { get; set; }
        public string rpm { get; set; }
        public string voltage { get; set; }
        public string hz { get; set; }
        public string Frame { get; set; }
        public Nullable<int> Efficiency { get; set; }
        public string DataSheet1 { get; set; }
        public string DataSheet2 { get; set; }
        public string Outline1 { get; set; }
        public string OutLine2 { get; set; }
    }
}