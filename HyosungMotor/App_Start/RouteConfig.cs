using System.Web.Mvc;
using System.Web.Routing;

namespace HyosungMotor
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "LocalizedDefault",
                "{lang}/{controller}/{action}",
                new { controller = "Home", action = "Index" },
                new { lang = "vi-VN|ko-KR|en-US" },
                new[] { "HyosungMotor.Controllers" }
            );
            routes.MapRoute(
                "Default",
                "{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "HyosungMotor.Controllers" }
            );
        }
    }
}