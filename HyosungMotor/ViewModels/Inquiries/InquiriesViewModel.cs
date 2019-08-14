using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Inquiries
{
    public class InquiriesViewModel
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Message { get; set; }
        public DateTime? DateCreated { get; set; }
    }
}