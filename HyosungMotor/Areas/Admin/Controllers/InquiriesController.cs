using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using System;
using System.IO;
using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin.Controllers
{
    [KSAuthorized]
    public class InquiriesController : Controller
    {
        InquiriesRepository _re = new InquiriesRepository();
        // GET: Admin/Inquiries
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetAllPaging(string keyword, int page, int pageSize)
        {
            var data = _re.GetAll(page, pageSize, string.IsNullOrEmpty(keyword) ? null : keyword);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //[HttpPost]
        //public ActionResult ExportExcel()
        //{
        //    var originalDirectory = new DirectoryInfo(string.Format("{0}wwwroot\\ExportExcel", Server.MapPath(@"\")));
        //    var pathString = Path.Combine(originalDirectory.ToString(), "export-files");
        //    bool isExists = Directory.Exists(pathString);
        //    if (!isExists)
        //        Directory.CreateDirectory(pathString);

        //    string sFileName = $"Product_{DateTime.Now:yyyyMMddhhmmss}.xlsx";
        //    string fileUrl = $"{Request.Scheme}://{Request.Host}/export-files/{sFileName}";
        //    FileInfo file = new FileInfo(Path.Combine(pathString, sFileName));
        //    if (file.Exists)
        //    {
        //        file.Delete();
        //        file = new FileInfo(Path.Combine(originalDirectory, sFileName));
        //    }
        //    var products = _productService.GetAll();
        //    using (ExcelPackage package = new ExcelPackage(file))
        //    {
        //        // add a new worksheet to the empty workbook
        //        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Products");
        //        worksheet.Cells["A1"].LoadFromCollection(products, true, TableStyles.Light1);
        //        worksheet.Cells.AutoFitColumns();
        //        package.Save(); //Save the workbook.
        //    }
        //    return new OkObjectResult(fileUrl);
        //}
    }
}