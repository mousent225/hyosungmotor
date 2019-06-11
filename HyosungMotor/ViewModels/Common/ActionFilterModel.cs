using HyosungMotor.Models;
using System;

namespace HyosungMotor.ViewModels
{
    public class ActionFilterModel
    {
        public string ID { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
    }
    public class ControllerModel
    {
        public string ControllerId { get; set; }
        public string ControllerName { get; set; }
    }
    public class ActionModel
    {
        public string RoleId { get; set; }
        public string ControllerId { get; set; }
        public string ActionId { get; set; }
        public string ActionName { get; set; }
        public bool IsAllow { get; set; }
        public DateTime CreateDate { get; set; }
        public string CreateUid { get; set; }
        public virtual SysRoles SysRole { get; set; }
    }
}