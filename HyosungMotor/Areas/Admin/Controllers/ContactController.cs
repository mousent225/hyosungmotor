using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Contact;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    [KSAuthorized]
    public class ContactController : Controller
    {
        // GET: Admin/Contact
        ContactRepository _re = new ContactRepository();
        public ActionResult Index()
        {
            return View();
        }

        #region GET

        [HttpGet]
        public JsonResult GetAllPaging(string keyword, int page, int pageSize)
        {
            var data = _re.GetAll(page, pageSize, string.IsNullOrEmpty(keyword) ? null : keyword);
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetById(int id)
        {
            var data = _re.GetDetail(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        #endregion GET

        [HttpPost]
        public JsonResult SaveEntity(ContactViewModel model)
        {
            model.UserCreated = User.GetClaimValue(ClaimTypes.Sid);
            var mess = "";
            if (model.Id == 0)
                mess = _re.Insert(model);
            else
                mess = _re.Update(model);

            return Json(new { Message = mess });
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            return Json(new { mess = _re.Delete(id, User.GetClaimValue(ClaimTypes.Sid)) });
        }
    }
}