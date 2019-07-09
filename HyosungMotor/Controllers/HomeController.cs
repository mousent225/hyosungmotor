using HyosungMotor.Repositories;
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
        public JsonResult GetAllPaging(int eff, int page, int pageSize)
        {
            var data = (new ProductRepository()).GetAll(page, pageSize, eff, null);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion

    }
}