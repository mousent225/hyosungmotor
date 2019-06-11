using System;
using System.ComponentModel.DataAnnotations;

namespace HyosungMotor.ViewModels
{
    [Serializable]
    public class CategoryValueModel
    {
        public int Id { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }

        [Display(Name = "Dictionary")]
        public Guid? Dictionary { get; set; }

        [Display(Name = "Dictionary")]
        public string DictionaryName { get; set; }

        [Display(Name = "Seq")]
        public int Sequence { get; set; }

        [Display(Name = "Actived")]
        public int Status { get; set; }

        public int? Category { get; set; }

        [Display(Name = "CategoryName")]
        public string CategoryName { get; set; }

        public int? ParentID { get; set; }

        [Display(Name = "Parent")]
        public string ParentName { get; set; }

        [Display(Name = "Remark")]
        public string RemarkValue { get; set; }

        public DateTime CreateDate { get; set; }
        public string CreateUID { get; set; }

        [Display(Name = "ModifyDate")]
        public DateTime? ModifyDate { get; set; }

        [Display(Name = "ModifyUser")]
        public string ModifyUID { get; set; }

        public string ModifyName { get; set; }
        public bool? Deleted { get; set; }
        public DateTime? DeleteDate { get; set; }
        public string DeleteUID { get; set; }

        [Display(Name = "SubCode")]
        public string SubCode { get; set; }

        public bool HasChild { get; set; }
    }
}