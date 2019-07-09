using HyosungMotor.App_Code;
using HyosungMotor.Utilities;
using System;
using System.Web;
using System.Web.Mvc;

namespace HyosungMotor.Controllers
{
    public abstract class BaseController : Controller
    {
        private static string _cookieLangName = "LangForMultiLanguage";

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string cultureOnCookie = GetCultureOnCookie(filterContext.HttpContext.Request);
            string cultureOnUrl = filterContext.RouteData.Values.ContainsKey("lang") ? filterContext.RouteData.Values["lang"].ToString() : GlobalHelper.DefaultCulture;
            string culture = (cultureOnCookie == string.Empty) ? (filterContext.RouteData.Values["lang"].ToString()) : cultureOnCookie;

            if (cultureOnUrl != culture)
            {
                filterContext.HttpContext.Response.RedirectToRoute("LocalizedDefault",
                    new { lang = culture, controller = filterContext.RouteData.Values["controller"], action = filterContext.RouteData.Values["action"] });
                return;
            }

            SetCurrentCultureOnThread(culture);

            //if (culture != MultiLanguageViewEngine.CurrentCulture)
            //{
            //    (ViewEngines.Engines[0] as MultiLanguageViewEngine).SetCurrentCulture(culture);
            //}

            base.OnActionExecuting(filterContext);
        }

        public static void SetCurrentCultureOnThread(string lang)
        {
            if (string.IsNullOrEmpty(lang))
                lang = GlobalHelper.DefaultCulture;
            var cultureInfo = new System.Globalization.CultureInfo(lang);
            System.Threading.Thread.CurrentThread.CurrentUICulture = cultureInfo;
            System.Threading.Thread.CurrentThread.CurrentCulture = cultureInfo;
        }

        public static String GetCultureOnCookie(HttpRequestBase request)
        {
            var cookie = request.Cookies[_cookieLangName];
            string culture = GlobalHelper.DefaultCulture;
            if (cookie != null)
                culture = cookie.Value;

            return culture;
        }
    }
}