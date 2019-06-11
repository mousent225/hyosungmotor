using HyosungMotor.Repositories;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace HyosungMotor.Areas.Admin.Controllers
{
    [KSAuthorized]
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        #region Menu

        [AllowAnonymous]
        public ActionResult NavigationBar()
        {
            string menus = GenerateMenu();
            ViewBag.Navigation = menus;
            return PartialView("_NavigationBar");
        }

        [NonAction]
        private IEnumerable<MenuModel> GetMenus()
        {
            try
            {
                MenuRepository res = new MenuRepository();
                //return res.GetActiveMenuViaMasterMenu(AppDictionary.MasterMenu.First(x => x.Key == "Navigation").Value);
                return res.GetActiveMenuViaMasterMenuUser(User.GetClaimValue(ClaimTypes.Role));
            }
            catch (Exception ex)
            {
                LogHelper.Error("Controller: " + Request.RequestContext.RouteData.Values["Controller"].ToString() + " Action: " + Request.RequestContext.RouteData.Values["Action"].ToString() + " Method GetMenus:" + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        [NonAction]
        private string GenerateMenu()
        {
            string result = null;
            try
            {
                var menus = GetMenus();
                if (menus != null)
                {
                    var listParent = menus.Where(m => m.ParentId == null).ToList();
                    var ul = new HtmlGenericControl("ul");
                    ul.Attributes["class"] = @"gui-controls";
                    ul.ID = "main-menu";

                    var liHome = new HtmlGenericControl("li");
                    liHome.Attributes["class"] = @"active expanding";
                    var home = GenerateControl("Admin/Home/Index", "md md-home", "Dashboard");
                    liHome.Controls.Add(home);
                    ul.Controls.Add(liHome);

                    foreach (var item in listParent)
                    {
                        var li = new HtmlGenericControl("li");
                        li.Attributes["class"] = @"gui-folder";

                        var listChildren = GetChildrenMenu(item.Id, menus);
                        var a = GenerateControl(item.URL, item.Icon, item.Name);
                        li.Controls.Add(a);
                        ul.Controls.Add(li);
                        //gen ra html cho mấy menu con
                        if (listChildren != null && listChildren.Count() > 0)
                        {
                            li.Controls.Add(AddChildrenMenu(item.Id, menus, li));
                        }
                    }
                    using (System.IO.StringWriter swriter = new System.IO.StringWriter())
                    {
                        HtmlTextWriter writer = new HtmlTextWriter(swriter);
                        ul.RenderControl(writer);
                        result = swriter.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Error("Controller: " + Request.RequestContext.RouteData.Values["Controller"].ToString() + " Action: " + Request.RequestContext.RouteData.Values["Action"].ToString() + " Method GenerateMenu:" + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return null;
            }
            return result;
        }

        [NonAction]
        private HtmlGenericControl GenerateControl(string url, string icon, string title)
        {
            var tagA = new HtmlGenericControl("a");
            tagA.Attributes["href"] = url;
            //tagA.Attributes["class"] = @"active";
            var div = new HtmlGenericControl("div");
            div.Attributes["class"] = @"gui-icon";
            var tagI = new HtmlGenericControl("i");
            tagI.Attributes["class"] = icon;
            div.Controls.Add(tagI);
            var span = new HtmlGenericControl("span");
            span.Attributes["class"] = @"title";
            span.InnerHtml = title;
            tagA.Controls.Add(div);
            tagA.Controls.Add(span);
            return tagA;
        }

        [NonAction]
        private IEnumerable<MenuModel> GetChildrenMenu(string parent, IEnumerable<MenuModel> source)
        {
            if (string.IsNullOrEmpty(parent))
                return null;
            return source.Where(m => m.ParentId == parent).ToList();
        }

        [NonAction]
        private HtmlGenericControl AddChildrenMenu(string parent, IEnumerable<MenuModel> source, HtmlGenericControl pLi)
        {
            var ul = new HtmlGenericControl("ul");
            var listChildren = GetChildrenMenu(parent, source);
            if (listChildren != null && listChildren.Count() > 0)
            {
                foreach (var item in listChildren)
                {
                    var li = new HtmlGenericControl("li");
                    li.Attributes["data-href"] = item.URL;
                    var a = new HtmlGenericControl("a");
                    a.Attributes["href"] = item.URL;

                    var span = new HtmlGenericControl("span");
                    span.Attributes["class"] = @"title";
                    var i = new HtmlGenericControl("i");
                    i.Attributes["class"] = item.Icon;
                    span.Controls.Add(i);
                    var span2 = new HtmlGenericControl("span")
                    {
                        InnerHtml = "&nbsp;" + item.Name
                    };
                    span.Controls.Add(span2);

                    a.Controls.Add(span);
                    li.Controls.Add(a);
                    ul.Controls.Add(li);
                    HtmlGenericControl liChild = AddChildrenMenu(item.Id, source, li);
                    if (liChild != null)
                        li.Controls.Add(liChild);
                }
                pLi.Controls.Add(ul);
                return ul;
            }
            return null;
        }

        #endregion Menu
    }
}