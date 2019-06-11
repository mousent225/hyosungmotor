using HyosungMotor.Utilities;
using System;
using System.IO;
using System.Security.Claims;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    public class UploadController : Controller
    {
        // GET: Admin/Upload
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult UploadImage()
        {
            DateTime now = DateTime.Now;
            var files = Request.Files;
            bool isSavedSuccessfully = true;
            string fName = "";
            var mess = "";
            JsonResult result = Json(new { Result = "Error", Message = "Error in saving file" });

            if (files.Count == 0)
            {
                return Json(new { Result = "Error", FileCount = 0 });
            }

            try
            {
                var file = files[0];
                var filename = Path.GetFileName(file.FileName).Trim();
                var originalDirectory = new DirectoryInfo(string.Format("{0}wwwroot\\Resource\\Images", Server.MapPath(@"\")));
                var pathString = Path.Combine(originalDirectory.ToString(), User.GetClaimValue(ClaimTypes.Sid), now.ToString("yyyyMMdd"));
                var ext = file.FileName.Split('.')[file.FileName.Split('.').Length - 1];
                var fileSize = file.ContentLength;
                bool isExists = Directory.Exists(pathString);
                if (!isExists)
                    Directory.CreateDirectory(pathString);
                fName = Util.ToUnsignString(file.FileName.Replace("." + ext, "")).Replace(" ", "");

                var path = string.Format("{0}\\{1}-{2:HHmmss}.{3}", pathString, fName, now, ext);

                var fileName = string.Format("../wwwroot/Resource/Images/{0}/{1:yyyyMMdd}/{2}-{3:HHmmss}.{4}", User.GetClaimValue(ClaimTypes.Sid), now, fName, DateTime.Now, ext);

                result = Json(new { Result = "OK", FileType = ext, FileName = fileName, FileSize = fileSize });

                file.SaveAs(path);
            }
            catch (Exception ex)
            {
                mess = ex.InnerException.Message;
                isSavedSuccessfully = false;
            }

            if (isSavedSuccessfully)
            {
                return result;
            }
            else
            {
                return Json(new { Result = "Error", Message = "Error in saving file" });
            }
        }
    }
}