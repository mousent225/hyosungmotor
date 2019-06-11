using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;

namespace HyosungMotor.Repositories
{
    public class AuthorizationRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public IEnumerable<AuthorizationModel> GetControllerAction(string id)
        {
            var asm = Assembly.GetAssembly(typeof(MvcApplication));
            var controlleractionlist = asm.GetTypes()
                    .Where(type => typeof(System.Web.Mvc.Controller).IsAssignableFrom(type))
                    .SelectMany(type => type.GetMethods(BindingFlags.Instance | BindingFlags.DeclaredOnly | BindingFlags.Public))
                    .Where(m => !m.GetCustomAttributes(typeof(System.Runtime.CompilerServices.CompilerGeneratedAttribute), true).Any())
                    .Select(x => new AuthorizationModel { Controller = x.DeclaringType.Name, Action = x.Name })//.Select(x => new { Controller = x.DeclaringType.Name, Action = x.Name, ReturnType = x.ReturnType.Name, Attributes = String.Join(",", x.GetCustomAttributes().Select(a => a.GetType().Name.Replace("Attribute", ""))) })
                    .OrderBy(x => x.Controller).ThenBy(x => x.Action).Distinct().ToList();
            foreach (var item in controlleractionlist)
            {
                item.Controller = item.Controller.Substring(0, item.Controller.Length - 10);
                if (id != null)
                    item.Owner = id;
            }
            var removeDuplicate = RemoveDuplicates(controlleractionlist);

            return removeDuplicate;
        }

        private static List<AuthorizationModel> RemoveDuplicates(IEnumerable<AuthorizationModel> inputList)
        {
            var finalList = new List<AuthorizationModel>();
            foreach (var currValue in inputList.Where(currValue => !Contains(finalList, currValue)))
            {
                finalList.Add(currValue);
            }
            return finalList;
        }

        private static bool Contains(IEnumerable<AuthorizationModel> list, AuthorizationModel comparedValue)
        {
            return list.Any(listValue => listValue.Controller == comparedValue.Controller && listValue.Action == comparedValue.Action);
        }

        public bool CheckAuthorized(ActionFilterModel model)
        {
            if (model == null)
                return false;
            try
            {
                var item = (from u in
                                _db.SysRoleMapping
                            where
                                u.RoleId.ToString() == model.ID && u.ControllerId == model.Controller &&
                                u.ActionId == model.Action
                            select u).FirstOrDefault();
                return item != null && item.IsAllow;
            }
            catch (Exception ex)
            {
                LogHelper.Error("AuthorizationRepository:CheckAuthorized: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public string GetRights(string controllerId, string roleId)
        {
            var actionList = "";
            try
            {
                var list = (from u in _db.SysRoleMapping
                            where u.RoleId == roleId && u.ControllerId == controllerId
                            select u).ToList();
                if (list == null) return "";
                foreach (var action in list)
                {
                    actionList = (actionList == "" ? action.ActionId : (actionList + "|" + action.ActionId));
                }

                return actionList;
            }
            catch (Exception ex)
            {
                LogHelper.Error("AuthorizationRepository:GetRights: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return "";
            }
        }

        //get controler
        public List<ControllerModel> GetControler(string namespaces)
        {
            var ass = Assembly.GetExecutingAssembly();
            IEnumerable<Type> types =
                ass.GetTypes()
                    .Where(t => typeof(Controller).IsAssignableFrom(t) && t.Namespace.Contains(namespaces))
                    .OrderBy(x => x.Name);
            var listControler = (from t in types
                                 let attr = t.GetCustomAttributes(typeof(DisplayNameAttribute), false)
                                 select new ControllerModel()
                                 {
                                     //lấy lên tên display của controller
                                     ControllerId = t.Name,
                                     ControllerName = attr.Length > 0 ? ((DisplayNameAttribute)attr[0]).DisplayName : t.Name
                                 }).ToList();
            return listControler;
        }

        //get actions in controler
        public List<ActionModel> GetActions(string namespaces, string controllerId)
        {
            //get list controller
            var ass = Assembly.GetExecutingAssembly();
            IEnumerable<Type> types =
                ass.GetTypes()
                    .Where(t => typeof(Controller).IsAssignableFrom(t) && t.Namespace.Contains(namespaces))
                    .OrderBy(x => x.Name);
            var controller = types.FirstOrDefault(t => t.Name == controllerId);

            if (controller == null)
                return null;
            //get action via controller
            IEnumerable<MemberInfo> memInfo =
                controller.GetMethods(BindingFlags.Instance | BindingFlags.DeclaredOnly | BindingFlags.Public)
                    .Where(
                        m =>
                            !m.GetCustomAttributes(
                                typeof(System.Runtime.CompilerServices.CompilationRelaxationsAttribute), true).Any()
                                && !m.IsDefined(typeof(AllowAnonymousAttribute))//bỏ ra những hàm anonymous
                                )
                    .OrderBy(x => x.Name);

            return (from memberInfo in memInfo
                    let attr = memberInfo.GetCustomAttributes(typeof(DisplayNameAttribute), false)
                    where memberInfo.ReflectedType != null && (memberInfo.ReflectedType.IsPublic && !memberInfo.IsDefined(typeof(NonActionAttribute)))
                    select new ActionModel()
                    {
                        ControllerId = controller.Name,
                        ActionId = memberInfo.Name,
                        ActionName = attr.Length > 0 ? ((DisplayNameAttribute)attr[0]).DisplayName : memberInfo.Name,
                        IsAllow = false
                    }).ToList();
        }
    }
}