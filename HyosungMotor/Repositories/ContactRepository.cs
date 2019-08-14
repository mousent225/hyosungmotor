using HyosungMotor.Dtos;
using HyosungMotor.Enums;
using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Contact;
using System;
using System.Data.Entity.Core.Objects;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class ContactRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public PagedResult<ContactViewModel> GetAll(int pageIndex, int pageSize, string keyword)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                var list = (from l in _db.SP_CONTACT_GETALL(pageIndex, pageSize, keyword, totalRow)
                            select new ContactViewModel()
                            {
                                Id = l.Id,
                                Name = l.Name,
                                DateCreated = l.DateCreated,
                                UserCreated = l.UserCreated,
                                DateModified = l.DateModified,
                                UserModified = l.UserModified,
                                Address = l.Address,
                                AddressURL = l.AddressURL,
                                Email = l.Email,
                                PhoneNumber = l.PhoneNumber,
                                Seq = l.SEQ ?? 0,
                                Status = l.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (l.PublishStatus == 0 ? PublishStatus.Draft : (l.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published))
                            }).ToList();
                var paginationSet = new PagedResult<ContactViewModel>()
                {
                    Results = list,
                    RowCount = int.Parse(totalRow.Value.ToString())
                };

                return paginationSet;
            }
            catch (Exception ex)
            {
                LogHelper.Error("ContactRepository GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public ContactViewModel GetDetail(int id)
        {
            try
            {
                var item = (from i in _db.Contact
                            where i.Id == id
                            select new ContactViewModel
                            {
                                Id = i.Id, Name = i.Name, Address = i.Address, AddressURL = i.AddressURL, Email = i.Email, PhoneNumber = i.PhoneNumber,
                                Status = i.Status == 0 ? Status.InActice : Status.Active,
                                PublishStatus = (i.PublishStatus == 0 ? PublishStatus.Draft : (i.PublishStatus == 1 ? PublishStatus.Pending_Review : PublishStatus.Published)),
                                
                            }).FirstOrDefault();

                return item;
            }
            catch (Exception ex)
            {
                LogHelper.Error("ContactRepository GetDetail: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public string Insert(ContactViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_CONTACT_INSERT(model.Name, model.Address, model.AddressURL, model.Email, model.PhoneNumber, model.UserCreated, (int)model.Status, (int)model.PublishStatus, model.Seq);

                return "Ok";
            }
            catch (Exception ex)
            {
                LogHelper.Error("ContactRepository Insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public string Update(ContactViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_CONTACT_UPDATE(model.Id, model.Name, model.Address, model.AddressURL, model.Email, model.PhoneNumber, model.UserCreated, (int)model.Status, (int)model.PublishStatus, model.Seq);

                return "Ok";
            }
            catch (Exception ex)
            {
                LogHelper.Error("ContactRepository Update: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }

        public string Delete(int id, string userId)
        {
            if (id == 0)
                return "Error";
            var item = (from i in _db.Contact where i.Id == id select i).FirstOrDefault();
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