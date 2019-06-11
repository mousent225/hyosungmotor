using HyosungMotor.Enums;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    public class CommonController : Controller
    {
        // GET: Admin/Common
        [HttpGet]
        public JsonResult GetStatus()
        {
            List<EnumViewModel> enums = ((Status[])Enum.GetValues(typeof(Status)))
                .Select(c => new EnumViewModel()
                {
                    Value = (int)c,
                    Name = c.GetDescription()
                }).ToList();
            return Json(enums, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetPublishStatus()
        {
            List<EnumViewModel> enums = ((PublishStatus[])Enum.GetValues(typeof(PublishStatus)))
                .Select(c => new EnumViewModel()
                {
                    Value = (int)c,
                    Name = c.GetDescription()
                }).ToList();
            return Json(enums, JsonRequestBehavior.AllowGet);
        }
    }
}