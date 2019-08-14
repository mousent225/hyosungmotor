using HyosungMotor.Dtos;
using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Inquiries;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace HyosungMotor.Repositories
{
    public class InquiriesRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public PagedResult<InquiriesViewModel> GetAll(int pageIndex, int pageSize, string keyword)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                var list = (from l in _db.SP_INQUIRIES_GETALL(pageIndex, pageSize, keyword, totalRow)
                            select new InquiriesViewModel()
                            {
                                Id = l.Id,
                                FullName = l.FullName,
                                Email = l.Email,
                                PhoneNumber = l.PhoneNumber,
                                DateCreated = l.CreateDate,
                                Message = l.Message
                            }).ToList();
                var paginationSet = new PagedResult<InquiriesViewModel>()
                {
                    Results = list,
                    RowCount = int.Parse(totalRow.Value.ToString())
                };

                return paginationSet;
            }
            catch (Exception ex)
            {
                LogHelper.Error("InquiriesRepository GetAll: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }


        public string Insert(InquiriesViewModel model)
        {
            try
            {
                if (model == null)
                    return "Error";
                _db.SP_INQUIRIES_INSERT(model.FullName, model.PhoneNumber, model.Email, model.Message);

                return "Ok";
            }
            catch (Exception ex)
            {
                LogHelper.Error("InquiriesRepository Insert: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "Message" + ex.Message + " Inner Exception: " + ex.InnerException.Message;
            }
        }
    }
}