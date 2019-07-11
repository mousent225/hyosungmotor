using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Post;
using System.Security.Claims;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    [KSAuthorized]
    public class PostController : Controller
    {
        private PostRepository _re = new PostRepository();

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetAllPaging(string keyword, int page, int pageSize)
        {
            var data = _re.GetAll(page, pageSize, string.IsNullOrEmpty(keyword) ? null : keyword, null);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetTop2(string langCode)
        {
            //vi-VN|ko-KR|en-US
            var data = _re.GetTop2(langCode, User.GetClaimValue(ClaimTypes.Sid));
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveEntity(PostViewModel model)
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
        [HttpGet]
        public JsonResult GetById(int id, string langCode)
        {
            var data = _re.GetDetail(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}