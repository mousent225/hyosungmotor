using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Post
{
    public class PostTransViewModel
    {
        public int Id { get; set; }
        public int LanguageId { get; set; }
        public int PostId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string ImageCaption { get; set; }
    }
}