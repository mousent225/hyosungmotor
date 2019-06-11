using HyosungMotor.Models;
using HyosungMotor.Utilities;
using HyosungMotor.ViewModels;
using System;
using System.Linq;

namespace HyosungMotor.Repositories
{
    public class UserRepository
    {
        private MotorHomepageEntities _db = new MotorHomepageEntities();

        public UserModel Login(LoginModel model)
        {
            try
            {
                var item = (from u in _db.SP_SYS_USER_LOGIN(model.LoginID, model.Password, null)
                            select new UserModel()
                            {
                                UserId = u.UserId,
                                UserName = u.UserName,
                                Email = u.Email ?? "",
                                Image = u.Image,
                                RoleId = u.RoleId,
                                RoleName = u.RoleName,
                                Password = u.Password
                            }).FirstOrDefault();
                return item;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository: Login: " + ex.Message + " Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public UserModel GetUser(string id)
        {
            try
            {
                var item = (from u in _db.SysUser
                            where u.Deleted == false //&& u.LoginID == id
                            select new UserModel
                            {
                                UserId = u.UserId,
                                Password = u.Password,
                                //IMG = u.IMG,
                                UserName = u.UserName,
                                Email = u.Email,
                                Mobile = u.Mobile
                            }).FirstOrDefault();

                return item;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository: GetUser: " + ex.Message + " Exception: " + ex.InnerException.Message);
                return null;
            }
        }

        public bool CheckExists(UserModel model)
        {
            throw new NotImplementedException();
        }

        public bool InsertUser(UserModel model)
        {
            if (model == null)
                return false;
            try
            {
                var user = new SysUser()
                {
                    UserId = model.UserId,
                    Password = ED5Helper.Encrypt(model.Password),
                    UserName = model.UserName,
                    Email = model.Email,
                    Mobile = model.Mobile,
                    //CreateUid = model.c,
                    CreateDate = DateTime.Now,
                    Deleted = false,
                    Status = 1
                };
                _db.SysUser.Add(user);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository:InsertUser: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public bool UpdateUser(UserModel model)
        {
            if (model == null)
                return false;
            try
            {
                var user = (from u in _db.SysUser where u.UserId == model.UserId select u).FirstOrDefault();
                user.UserName = model.UserName;
                user.Email = model.Email;
                user.Mobile = model.Mobile;
                //user.UpdateUid = model.ModifyUID;
                user.UpdateDate = DateTime.Now;
                //user.Status = model.Status;
                //if (model.PasswordNew != null)
                //    user.Password = ED5Helper.Encrypt(model.PasswordNew); ;
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository:UpdateUser: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public bool ResetPassword(string loginId)
        {
            var list = loginId.Split(';');
            try
            {
                foreach (var login in list)
                {
                    if (string.IsNullOrEmpty(login))
                        continue;
                    var user = (from u in _db.SysUser where u.UserId == login select u).FirstOrDefault();
                    user.Password = loginId;
                    //user.uStatus = new Guid(AppDictionary.UserStatus.FirstOrDefault(a => a.Key == "Reset").Value);
                    _db.SaveChanges();
                }

                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository:UpdateUser: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
                return false;
            }
        }

        public bool DeleteUser(UserModel model)
        {
            if (model == null)
                return false;
            try
            {
                var user = (from u in _db.SysUser where u.UserId == model.UserId select u).FirstOrDefault();
                //user.DeleteUid = model.ModifyUID;
                user.DeleteDate = DateTime.Now;
                user.Deleted = true;
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Error("UserRepository:UpdateUser: " + ex.Message);
                return false;
            }
        }

        public string GetPassword(string userId)
        {
            var user = (from u in _db.SysUser where u.UserId.ToLower() == userId.ToLower() select u).FirstOrDefault();
            if (user == null)
                return "";
            return user.Password;
        }

        //public string GetStatus(string empId)
        //{
        //    var user = (from u in _db.HrEmpMaster where u.Code.ToLower() == empId.ToLower() select u).FirstOrDefault();
        //    if (user != null)
        //        return user.uStatus.ToString();

        //    var guard = (from g in _db.Guard where g.GuardId.ToLower() == empId.ToLower() select g).FirstOrDefault();
        //    if (guard == null)
        //        return "";
        //    else
        //        return "beb23056-8602-4da6-9fa8-ee29f86381a7";
        //}

        //public bool ChangePassword(string empId, string pass)
        //{
        //    var active = new Guid(AppDictionary.UserStatus.FirstOrDefault(d => d.Key == "Active").Value);
        //    try
        //    {
        //        var item = _db.HrEmpMaster.FirstOrDefault(i => i.Code.ToLower() == empId.ToLower());
        //        if (item == null)
        //            return false;
        //        item.Password = pass;
        //        item.uStatus = active;
        //        item.UpdateDate = DateTime.Now;
        //        _db.SaveChanges();
        //        return true;

        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.Error("UserRepository:UpdatePassword: " + ex.Message + " Inner Exception: " + ex.InnerException.Message);
        //        return false;
        //    }
        //}
    }
}