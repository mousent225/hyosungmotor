using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HyosungMotor.Enums;

namespace HyosungMotor.ViewModels.Post
{
    public class PostViViewModel
    {
        public int Id { get; set; }
        public String Title { get; set; }
        public String Description { get; set; }
        public String Image { get; set; }
        public String Thumbnail { get; set; }
        public String Content { get; set; }
        public String ImageCaption { get; set; }
        public PostViewModel Post { get; set; }
        public Status Status { get; set; }
        public PublishStatus PublishStatus { get; set; }
    }
}