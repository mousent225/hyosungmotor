using HyosungMotor.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Banner
{
    public class BannerViewModel
    {
        public int Id { get; set; }
        public string Heading { get; set; }
        public string SubHeading { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string UserCreated { set; get; }
        public DateTime DateCreated { set; get; }
        public string UserModified { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
        public PublishStatus PublishStatus { get; set; }
        public bool IsDeleted { set; get; }
        public DateTime? DateDeleted { set; get; }
        public string UserDeleted { set; get; }

        public BannerKoViewModel BannerKo { get; set; }
        public BannerViViewModel BannerVi { get; set; }

        public bool HasKo { get; set; }
        public bool HasVi { get; set; }
    }
}