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
    
    public partial class PostVis
    {
        public int Id { get; set; }
        public int MasterId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string ImageCaption { get; set; }
    
        public virtual Posts Posts { get; set; }
    }
}
