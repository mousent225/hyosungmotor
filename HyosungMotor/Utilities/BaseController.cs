using HyosungMotor.Repositories;
using HyosungMotor.ViewModels;
using System.Linq;
using System.Security.Claims;
using System.Web.Mvc;

namespace HyosungMotor.Utilities
{
    [Authorize]
    public class BaseController : Controller
    {
        public string GetIpAddress()
        {
            string stringIpAddress;
            stringIpAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (stringIpAddress == null)
            {
                stringIpAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            return stringIpAddress;
        }

        protected override void OnAuthorization(AuthorizationContext filterContext)
        {
            var httpContext = filterContext.HttpContext;
            if (httpContext.Request.RequestType == "GET"
                && !httpContext.Request.IsAjaxRequest()
                && filterContext.IsChildAction == false) // do no overwrite if we do child action.
            {
                HttpContext.Session["PrevUrl"] = HttpContext.Session["CurUrl"] ?? httpContext.Request.Url;
                HttpContext.Session["CurUrl"] = httpContext.Request.Url;
            }

            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                var controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
                var actionName = filterContext.ActionDescriptor.ActionName;
                var claims = (ClaimsIdentity)filterContext.HttpContext.User.Identity;

                var model = new ActionFilterModel
                {
                    ID = claims.Claims.First(m => m.Type == ClaimTypes.Role).Value,
                    Action = actionName,
                    Controller = controllerName + "Controller"
                };

                var res = new AuthorizationRepository();

                if (filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true)) return;
                if (res.CheckAuthorized(model)) return;
                var result = new ViewResult { ViewName = "NoAccess" };

                filterContext.Result = result;
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary {
                        {"controller", "Anonymous"}, {"action", "Login"}
                    }
                );
            }
        }
    }
}