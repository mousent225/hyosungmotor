using System.Web.Mvc;

namespace HyosungMotor.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "HyosungMotor.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin_LocalizedDefault",
                "Admin/{lang}/{controller}/{action}",
                new { action = "Index" },
                new { lang = "vi-VN|ko-KR|en-US" },
                new[] { "HyosungMotor.Areas.Admin.Controllers" }
            );
        }
        
    }
}