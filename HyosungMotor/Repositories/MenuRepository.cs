using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class MenuRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public IEnumerable<MenuModel> GetAllMenuViaMasterMenu(string id)
        {
            throw new NotImplementedException();
        }

        public MenuModel GetAll()
        {
            try
            {
                var model = (from u in _db.SysMenus
                             orderby u.SortOrder
                             select new MenuModel
                             {
                                 Id = u.Id.ToString(),
                                 Name = u.Name,
                                 URL = u.URL,
                                 Sequence = u.SortOrder,
                                 ParentId = u.ParentId,
                                 Icon = u.IconCss
                             }).FirstOrDefault();

                return model;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository GetMenu: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        internal IEnumerable<MenuModel> GetActiveMenuViaMasterMenuUser(string role)
        {
            try
            {
                var list = (from u in _db.SP_GETMENU(role)
                            select new MenuModel
                            {
                                Id = u.Id,
                                Name = u.Name,
                                URL = u.URL,
                                Icon = u.IconCss,
                                ParentId = u.ParentId,
                                Sequence = u.SortOrder
                            }).ToList();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository GetActiveMenuViaMasterMenuUser: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public MenuModel GetMenu(string id)
        {
            try
            {
                var model = (from u in _db.SysMenus
                             where u.Id.ToString() == id
                             from mm in _db.SysMenus.Where(m => m.Id == u.ParentId).DefaultIfEmpty()
                             orderby u.SortOrder
                             select new MenuModel
                             {
                                 Id = u.Id.ToString(),
                                 Name = u.Name,
                                 URL = u.URL,
                                 Sequence = u.SortOrder,
                                 ParentId = u.ParentId,
                                 ParentName = mm.Name,
                                 Icon = u.IconCss
                             }).FirstOrDefault();
                return model;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository GetMenu: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public bool InsertMenu(MenuModel model)
        {
            try
            {
                var mn = new SysMenus
                {
                    Id = model.Id,
                    SortOrder = model.Sequence ?? 0,
                    Name = model.Name,
                    URL = model.URL,
                    IconCss = model.Icon,
                    ParentId = model.ParentId
                };
                _db.SysMenus.Add(mn);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public bool UpdateMenu(MenuModel model)
        {
            try
            {
                var mn = _db.SysMenus.FirstOrDefault(m => m.Id == model.Id);
                mn.Name = model.Name;
                mn.SortOrder = model.Sequence ?? 0;
                mn.URL = model.URL;
                mn.IconCss = model.Icon;
                mn.ParentId = model.ParentId;
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public bool DeleteMenu(string id)
        {
            try
            {
                var mn = _db.SysMenus.FirstOrDefault(m => m.Id == id);
                _db.SysMenus.Remove(mn);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public IEnumerable<MenuTreeViewModel> GetMenuTreeView(string id)
        {
            try
            {
                var list = (from u in _db.SysMenus
                            where u.ParentId == null //&& u.MasterMenu.ToString() == id
                            from mm in _db.SysMenus.Where(m => m.Id == u.ParentId).DefaultIfEmpty()
                            orderby u.SortOrder
                            select new MenuTreeViewModel
                            {
                                Id = u.Id,
                                Name = u.Name,
                                HasChildren = _db.SysMenus.Any(m => m.ParentId == u.Id),
                                URL = u.URL,
                                Sequence = u.SortOrder,
                                ParentId = u.ParentId,
                                ParentName = mm.Name
                            }).ToList();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Error("MenuRepository GetMenu: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }
    }
}