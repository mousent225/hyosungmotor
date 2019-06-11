using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Common;
using System;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class CommonRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        #region ATTACHMENT FILE

        public bool AttachmentInsert(AttachmentModel model)
        {
            try
            {
                _db.SP_SYS_ATTACHMENT_INSERT(model.ModuleId, model.MasterId, model.Name, model.Path, model.Type, model.Size);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("CommonRepository: AttachmentInsert: " + ex.Message + " Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        //public List<AttachmentModel> AttachmentGet(int? moduleId, int? masterId)
        //{
        //    try
        //    {
        //        var list = (from l in _db.SP_SYS_ATTACHMENT_GET(moduleId, masterId)
        //                    select new AttachmentModel()
        //                    {
        //                        AttachId = l.AttachId,
        //                        ModuleId = l.ModuleId,
        //                        MasterId = l.MasterId,
        //                        Name = l.FileName,
        //                        Path = l.FilePath,
        //                        Type = l.FileType,
        //                        Size = l.FileSize
        //                    }).ToList();
        //        return list;
        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.Error("CommonRepository: AttachmentInsert: " + ex.Message + " Exception: " + ex.InnerException.Message);
        //        return null;
        //    }
        //}

        public string AttachmentDelete(int id)
        {
            try
            {
                var item = (from i in _db.Attachments
                            where i.Id == id
                            select i).FirstOrDefault();
                if (item == null)
                    return "Nothing to do";
                _db.Attachments.Remove(item);
                _db.SaveChanges();
                return item.FilePath;
            }
            catch (Exception ex)
            {
                LogHelper.Error("CommonRepository: AttachmentDelete: " + ex.Message + " Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        #endregion ATTACHMENT FILE
    }
}