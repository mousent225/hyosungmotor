using HyosungMotor.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Contact
{
    public class ContactViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string AddressURL { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public int Seq { get; set; }

        public string UserCreated { set; get; }
        public DateTime DateCreated { set; get; }
        public string UserModified { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
        public PublishStatus PublishStatus { get; set; }
        public bool IsDeleted { set; get; }
        public DateTime? DateDeleted { set; get; }
        public string UserDeleted { set; get; }
    }
}