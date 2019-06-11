using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class CategoryRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();
        public static string Key = "";

        public List<CategoryValueModel> GetListValues(int category, string name, int status)
        {
            try
            {
                var u = (from v in _db.SysCategoryValues
                         from c in _db.SysCategories
                             .Where(c => c.Id == v.CategoryId).DefaultIfEmpty()
                         from p in _db.SysCategoryValues
                             .Where(p => p.Id == v.ParentId).DefaultIfEmpty()
                         where v.CategoryId == category && v.IsDeleted != true && v.Name.Contains(name) && (v.Status == status)
                         orderby v.ParentId, v.SortOrder
                         select new CategoryValueModel
                         {
                             Id = v.Id,
                             Name = v.Name,
                             Sequence = v.SortOrder,
                             Category = v.CategoryId,
                             CategoryName = c.Name,
                             ParentID = v.ParentId,
                             ParentName = p.Name ?? "",
                             ModifyDate = v.DateModified ?? v.DateCreated,
                             Status = v.Status,
                             HasChild = _db.SysCategoryValues.Any(a => a.ParentId == v.Id && a.IsDeleted != true)
                         }).ToList();
                return u;
            }
            catch (Exception ex)
            {
                LogHelper.Error("GetListValuesViaParent GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public List<CategoryValueModel> GetListValuesViaParent(int category, string name, int status, int parentId)
        {
            try
            {
                var u = (from v in _db.SysCategoryValues
                         from c in _db.SysCategories
                             .Where(c => c.Id == v.CategoryId).DefaultIfEmpty()
                         from p in _db.SysCategoryValues
                             .Where(p => p.Id == v.ParentId).DefaultIfEmpty()
                         where v.CategoryId == category && v.IsDeleted != true && v.Name.Contains(name) && ((v.Status == status) && v.ParentId == parentId)
                         orderby v.ParentId, v.SortOrder
                         select new CategoryValueModel
                         {
                             Id = v.Id,
                             Name = v.Name,
                             Sequence = v.SortOrder,
                             Category = v.CategoryId,
                             CategoryName = c.Name,
                             ParentID = v.ParentId,
                             ParentName = p.Name ?? "",
                             ModifyDate = v.DateModified ?? v.DateCreated,
                             Status = v.Status,
                             HasChild = _db.SysCategoryValues.Any(a => a.ParentId == v.Id && a.IsDeleted != true)
                         }).ToList();

                return u;
            }
            catch (Exception ex)
            {
                LogHelper.Error("GetListValuesViaParent GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }
    }
}