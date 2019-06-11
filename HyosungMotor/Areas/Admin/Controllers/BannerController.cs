using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Banner;
using System.Security.Claims;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    [KSAuthorized]
    public class BannerController : Controller
    {
        private BannerRepository _re = new BannerRepository();

        // GET: Admin/Banner
        public ActionResult Index()
        {
            return View();
        }

        #region GET

        [HttpGet]
        public JsonResult GetAllPaging(string keyword, int page, int pageSize)
        {
            var data = _re.GetAll(page, pageSize, string.IsNullOrEmpty(keyword) ? null : keyword, null);
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
        public JsonResult SaveEntity(BannerViewModel model)
        {
            model.UserCreated = User.GetClaimValue(ClaimTypes.Sid);
            model.HasKo = !(string.IsNullOrEmpty(model.BannerKo.Heading) && string.IsNullOrEmpty(model.BannerKo.SubHeading) && string.IsNullOrEmpty(model.BannerKo.Description));
            model.HasVi = !(string.IsNullOrEmpty(model.BannerVi.Heading) && string.IsNullOrEmpty(model.BannerVi.SubHeading) && string.IsNullOrEmpty(model.BannerVi.Description));
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