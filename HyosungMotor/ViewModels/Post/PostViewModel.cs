using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HyosungMotor.Enums;

namespace HyosungMotor.ViewModels.Post
{
    public class PostViewModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Thumbnail { get; set; }
        public string Image { get; set; }
        public String ImageCaption { get; set; }
        public DateTime PublishedDate { get; set; }
        public int CategoryId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime? DateDeleted { get; set; }
        public string UserDeleted { get; set; }
        public String UserCreated { get; set; }
        public DateTime? DateCreated { get; set; }
        public string UserModified { get; set; }
        public DateTime? DateModified { get; set; }
        public Status Status { get; set; }
        public PublishStatus PublishStatus { get; set; }
        public PostKoViewModel PostKo { get; set; }
        public PostViViewModel PostVi { get; set; }
        public bool HasKo { get; set; }
        public bool HasVi { get; set; }
    }
}