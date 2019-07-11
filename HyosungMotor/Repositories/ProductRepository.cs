using HyosungMotor.Dtos;
using HyosungMotor.Enums;
using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Product;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace HyosungMotor.Repositories
{
    public class ProductRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public PagedResult<TdStandardMotorViewModel> GetAll(int pageIndex, int pageSize, int eff, int? langId)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                var list = (from l in _db.SP_TDSTANDARDMOTOR_GETALL(pageIndex, pageSize, eff, totalRow, langId)
                            select new TdStandardMotorViewModel()
                            {
                                Id = l.Id,
                                Kw = l.kw,
                                Rpm = l.rpm,
                                Voltage = l.voltage,
                                Hz = l.hz,
                                Frame = l.Frame,
                                DataSheet1 = l.DataSheet1,
                                DataSheet2 = l.DataSheet2,
                                OutLine1 = l.Outline1,
                                OutLine2 = l.OutLine2,
                                Efficiency = (l.Efficiency == 0 ? EnergyEefficiency.IE1 : (l.Efficiency == 1 ? EnergyEefficiency.IE2 : EnergyEefficiency.IE3))
                            }).ToList();
                var paginationSet = new PagedResult<TdStandardMotorViewModel>()
                {
                    PageSize = pageSize,
                    CurrentPage = pageIndex,
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

        public PagedResult<TdStandardMotorViewModel> GetAllFor60HzMotor(int pageIndex, int pageSize, int eff, int? langId)
        {
            try
            {
                var totalRow = new ObjectParameter("totalRow", typeof(int));
                var list = (from l in _db.SP_TD60HZMOTOR_GETALL(pageIndex, pageSize, eff, totalRow, langId)
                            select new TdStandardMotorViewModel()
                            {
                                Id = l.Id,
                                Kw = l.kw,
                                Rpm = l.rpm,
                                Voltage = l.voltage,
                                Hz = l.hz,
                                Frame = l.Frame,
                                DataSheet1 = l.DataSheet1,
                                DataSheet2 = l.DataSheet2,
                                OutLine1 = l.Outline1,
                                OutLine2 = l.OutLine2,
                                Efficiency = (l.Efficiency == 0 ? EnergyEefficiency.IE1 : (l.Efficiency == 1 ? EnergyEefficiency.IE2 : EnergyEefficiency.IE3))
                            }).ToList();
                var paginationSet = new PagedResult<TdStandardMotorViewModel>()
                {
                    PageSize = pageSize,
                    CurrentPage = pageIndex,
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
    }
}