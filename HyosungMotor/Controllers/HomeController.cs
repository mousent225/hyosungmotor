using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using System.Security.Claims;
using System.Web.Mvc;

namespace HyosungMotor.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        #region GET
        [HttpGet]
        public JsonResult GetAllPagingFor60HzMotor(int eff, int page, int pageSize)
        {
            var data = (new ProductRepository()).GetAllFor60HzMotor(page, pageSize, eff, null);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetAllPaging(int eff, int page, int pageSize)
        {
            var data = (new ProductRepository()).GetAll(page, pageSize, eff, null);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetNewsTop2(string langCode)
        {
            //vi-VN|ko-KR|en-US
            var data = (new PostRepository()).GetTop2(langCode, User.GetClaimValue(ClaimTypes.Sid));
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetNewById(int id, string langCode)
        {
            var data = (new PostRepository()).GetTop2Detail(id, langCode);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion

    }
}