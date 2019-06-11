using HyosungMotor.Dtos;
using HyosungMotor.Enums;
using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Banner;
using System;
using System.Data.Entity.Core.Objects;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class BannerRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public PagedResult<BannerViewModel> GetAll(int pageIndex, int pageSize, string keyword, string langCode)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                var list = (from l in _db.SP_BANNER_GETALL(pageIndex, pageSize, keyword, totalRow, langCode)
                            select new BannerViewModel()
                            {
                                Id = l.Id,
                                Heading = l.Heading,
                                SubHeading = l.SubHeading,
                                HasKo = l.HasKo ?? false,
                                HasVi = l.HasVi ?? false,
                                DateCreated = l.DateCreated,
                                UserCreated = l.UserCreated,
                                DateModified = l.DateModified,
                                UserModified = l.UserModified,
                                Status = l.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (l.PublishStatus == 0 ? PublishStatus.Draft : (l.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published))
                            }).ToList();
                var paginationSet = new PagedResult<BannerViewModel>()
                {
                    Results = list,
                    RowCount = int.Parse(totalRow.Value.ToString())
                };

                return paginationSet;
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public BannerViewModel GetDetail(int id)
        {
            try
            {
                var item = (from i in _db.Banners
                            from ii in _db.BannerKos.Where(x => x.MasterId == i.Id).DefaultIfEmpty()
                            from iii in _db.BannerVis.Where(x => x.MasterId == i.Id).DefaultIfEmpty()
                            where i.Id == id
                            select new BannerViewModel
                            {
                                Id = i.Id,
                                Heading = i.Heading,
                                SubHeading = i.SubHeading,
                                Description = i.Description,
                                Image = i.Image,
                                Status = i.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (i.PublishStatus == 0 ? PublishStatus.Draft : (i.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                BannerKo = new BannerKoViewModel
                                {
                                    Id = ii.Id,
                                    MasterId = ii.MasterId,
                                    Heading = ii.Heading,
                                    SubHeading = ii.SubHeading,
                                    Description = ii.Description
                                },
                                BannerVi = new BannerViViewModel
                                {
                                    Id = iii.Id,
                                    MasterId = iii.MasterId,
                                    Heading = iii.Heading,
                                    SubHeading = iii.SubHeading,
                                    Description = iii.Description
                                }
                            }).FirstOrDefault();

                //item.BannerVi = (from i in _db.BannerVis where i.MasterId == id select new BannerViViewModel { Id = i.Id, MasterId = i.MasterId, Heading = i.Heading, SubHeading = i.SubHeading, Description = i.Description }).FirstOrDefault();
                //item.BannerKo = (from i in _db.BannerKos where i.MasterId == id select new BannerKoViewModel { Id = i.Id, MasterId = i.MasterId, Heading = i.Heading, SubHeading = i.SubHeading, Description = i.Description }).FirstOrDefault();
                return item;
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository GetDetail: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public string Insert(BannerViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_BANNER_INSERT(model.Heading, model.SubHeading, model.Description, model.Image, model.UserCreated, (int)model.Status, (int)model.PublishStatus,
                    model.HasKo, model.BannerKo.Heading, model.BannerKo.SubHeading, model.BannerKo.Description,
                    model.HasVi, model.BannerVi.Heading, model.BannerVi.SubHeading, model.BannerVi.Description);

                return "Ok";
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository Insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public string Update(BannerViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_BANNER_UPDATE(model.Id, model.Heading, model.SubHeading, model.Description, model.Image, model.UserCreated, (int)model.Status, (int)model.PublishStatus,
                    model.HasKo, model.BannerKo.Heading, model.BannerKo.SubHeading, model.BannerKo.Description,
                    model.HasVi, model.BannerVi.Heading, model.BannerVi.SubHeading, model.BannerVi.Description);

                return "Ok";
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository Update: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public string Delete(int id, string userId)
        {
            if (id == 0)
                return "Error";
            var item = (from i in _db.Banners where i.Id == id select i).FirstOrDefault();
            if (item == null)
                return "Error";
            item.IsDeleted = true;
            item.UserDeleted = userId;
            item.DateDeleted = DateTime.Now;

            _db.SaveChanges();
            return "OK";
        }
    }
}