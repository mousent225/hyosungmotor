using HyosungMotor.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Common
{
    public class MenuModel
    {
        public string Id { get; set; }
        [Required(ErrorMessage = "Required!")]
        [Display(Name = "Name")]
        public string Name { get; set; }
        public string URL { get; set; }
        public string Icon { get; set; }
        public string ParentId { get; set; }
        public int? Sequence { get; set; }
        public string ParentName { get; set; }
        public bool Actived { get; set; }
        public string ModifyUID { get; set; }
        public DateTime? ModifyDate { get; set; }
    }
    public class MenuTreeViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        public bool HasChildren { get; set; }
        public string ParentId { get; set; }
        public string ParentName { get; set; }
        public int? Sequence { get; set; }
        public string MasterMenu { get; set; }

        private IEnumerable<MenuTreeViewModel> _Children;

        public IEnumerable<MenuTreeViewModel> Children
        {
            get
            {
                if (HasChildren)
                {
                    using (var db = new MotorHomepageEntities())
                    {
                        var list = (from u in db.SysMenus
                                    where u.ParentId == Id
                                    from mm in db.SysMenus.Where(m => m.Id == u.ParentId).DefaultIfEmpty()
                                    orderby u.SortOrder
                                    select new MenuTreeViewModel
                                    {
                                        Id = u.Id,
                                        Name = u.Name,
                                        HasChildren = db.SysMenus.Any(m => m.ParentId == u.Id),
                                        URL = u.URL,
                                        Sequence = u.SortOrder,
                                        ParentId = u.ParentId,
                                        ParentName = mm.Name
                                    }).ToList();
                        return list;
                    }
                }
                return null;
            }
            set { _Children = value; }
        }

    }
}