using HyosungMotor.Dtos;
using HyosungMotor.Enums;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Post;
using System;
using System.Data.Entity.Core.Objects;
using System.Linq;
using HyosungMotor.Models;
using HyosungMotor.ViewModels.Banner;
using System.Collections.Generic;

namespace HyosungMotor.Repositories
{
    public class PostRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public PagedResult<PostViewModel> GetAll(int pageIndex, int pageSize, String keyword, int? langId)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));

                var list = (from l in _db.SP_POST_GETALL(pageIndex, pageSize, keyword, totalRow, langId)
                            select new PostViewModel()
                            {
                                Id = l.Id,
                                Title = l.Title,
                                Description = l.Description,
                                UserCreated = l.UserCreate,
                                DateCreated = l.DateCreated,
                                Status = l.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (l.PublishStatus == 0 ? PublishStatus.Draft : (l.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                HasKo = l.HasKo ?? false,
                                HasVi = l.HasVi ?? false

                            }).ToList();
                var paginationSet = new PagedResult<PostViewModel>()
                {
                    Results = list,
                    RowCount = int.Parse(totalRow.Value.ToString())
                };
                return paginationSet;
            }
            catch (Exception ex)
            {
                LogHelper.Error("PostRepository GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public List<PostViewModel> GetTop2(string langCode, string userId)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                
                var list = (from l in _db.SP_POST_GETTOP2(langCode, userId)
                            select new PostViewModel()
                            {
                                Id = l.Id,
                                Title = l.Title,
                                Description = l.Description,
                                UserCreated = l.UserCreate,
                                DateCreated = l.DateCreated,
                                Thumbnail = l.Thumbnail

                            }).ToList();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Error("PostRepository GetTop2: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }
        public PostViewModel GetTop2Detail(int id, string langCode)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));

                var list = (from l in _db.SP_POST_GETTOP2_DETAIL(id, langCode)
                            select new PostViewModel()
                            {
                                Id = l.Id,
                                Title = l.Title,
                                Description = l.Description,
                                UserCreated = l.UserCreate,
                                DateCreated = l.DateCreated,
                                Thumbnail = l.Thumbnail,
                                Content = l.Content

                            }).FirstOrDefault();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Error("PostRepository GetTop2: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }
        public String Insert(PostViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";

                _db.SP_POST_INSERT(
                    model.Title, model.Description, model.Content, model.Thumbnail, model.Image, model.ImageCaption, model.UserCreated, (int)model.Status, (int)model.PublishStatus,
                    model.PostKo.Title, model.PostKo.Description, model.PostKo.Content, model.PostKo.ImageCaption,
                    model.PostVi.Title, model.PostVi.Description, model.PostVi.Content, model.PostVi.ImageCaption);
                return "OK";
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository Insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public String Update(PostViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_POST_UPDATE(
                        model.Id, model.Title, model.Description, model.Content, model.Thumbnail, model.Image, model.ImageCaption, model.UserCreated, (int)model.Status, (int)model.PublishStatus,
                        model.PostKo.Title, model.PostKo.Description, model.PostKo.Content, model.PostKo.ImageCaption,
                        model.PostVi.Title, model.PostVi.Description, model.PostVi.Content, model.PostVi.ImageCaption);
                return "OK";
            }
            catch (Exception ex)
            {
                LogHelper.Error("PostRepository Insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public PostViewModel GetDetail(int id)
        {
            try
            {
                var item = (from i in _db.Posts
                            from ii in _db.PostTranslations.Where(x => x.PostId == i.Id && x.LanguageId == 1).DefaultIfEmpty()
                            from iii in _db.PostTranslations.Where(x => x.PostId == i.Id && x.LanguageId == 2).DefaultIfEmpty()
                            from iiii in _db.PostTranslations.Where(x => x.PostId == i.Id && x.LanguageId == 3).DefaultIfEmpty()
                            where i.Id == id
                            select new PostViewModel
                            {
                                Id = i.Id,
                                Title = ii.Title,
                                Description = ii.Description,
                                ImageCaption = ii.ImageCaption,
                                Image = i.Image,
                                Thumbnail = i.Thumbnail,
                                Content = ii.Content,
                                Status = i.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (i.PublishStatus == 0 ? PublishStatus.Draft : (i.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                PostKo = new PostKoViewModel
                                {
                                    Id = iii.Id,
                                    Title = iii.Title,
                                    Description = iii.Description,
                                    ImageCaption = iii.ImageCaption,
                                    Image = i.Image,
                                    Thumbnail = i.Thumbnail,
                                    Content = iii.Content,
                                    Status = i.Status == 0 ? Status.InActice : Status.Active,
                                    PublishStatus = (i.PublishStatus == 0 ? PublishStatus.Draft : (i.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                },
                                PostVi = new PostViViewModel
                                {
                                    Id = iiii.Id,
                                    Title = iiii.Title,
                                    Description = iiii.Description,
                                    ImageCaption = iiii.ImageCaption,
                                    Image = i.Image,
                                    Thumbnail = i.Thumbnail,
                                    Content = iiii.Content,
                                    Status = i.Status == 0 ? Status.InActice : Status.Active,
                                    PublishStatus = (i.PublishStatus == 0 ? PublishStatus.Draft : (i.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                }

                            }).FirstOrDefault();

                return item;
            }
            catch (Exception ex)
            {
                LogHelper.Error("BannerRepository GetDetail: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public string Delete(int id, string userId)
        {
            if (id == 0)
                return "Error";
            var item = (from i in _db.Posts where i.Id == id select i).FirstOrDefault();
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