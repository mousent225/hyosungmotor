﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HyosungMotor.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MotorHomepageEntities : DbContext
    {
        public MotorHomepageEntities()
            : base("name=MotorHomepageEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Attachments> Attachments { get; set; }
        public virtual DbSet<Banners> Banners { get; set; }
        public virtual DbSet<BannerTranslations> BannerTranslations { get; set; }
        public virtual DbSet<Languages> Languages { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductTranslations> ProductTranslations { get; set; }
        public virtual DbSet<SysCategories> SysCategories { get; set; }
        public virtual DbSet<SysCategoryValues> SysCategoryValues { get; set; }
        public virtual DbSet<SysDictionnaries> SysDictionnaries { get; set; }
        public virtual DbSet<SysMenus> SysMenus { get; set; }
        public virtual DbSet<SysRoleMapping> SysRoleMapping { get; set; }
        public virtual DbSet<SysRoles> SysRoles { get; set; }
        public virtual DbSet<SysUser> SysUser { get; set; }
        public virtual DbSet<SysUserRoleMapping> SysUserRoleMapping { get; set; }
        public virtual DbSet<TdStandardMotor> TdStandardMotor { get; set; }
        public virtual DbSet<Posts> Posts { get; set; }
        public virtual DbSet<PostTranslations> PostTranslations { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<Inquiries> Inquiries { get; set; }
    
        public virtual int SP_SYS_ATTACHMENT_GET(Nullable<int> mODULEID, Nullable<int> mASTERID)
        {
            var mODULEIDParameter = mODULEID.HasValue ?
                new ObjectParameter("MODULEID", mODULEID) :
                new ObjectParameter("MODULEID", typeof(int));
    
            var mASTERIDParameter = mASTERID.HasValue ?
                new ObjectParameter("MASTERID", mASTERID) :
                new ObjectParameter("MASTERID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_SYS_ATTACHMENT_GET", mODULEIDParameter, mASTERIDParameter);
        }
    
        public virtual int SP_SYS_ATTACHMENT_INSERT(Nullable<int> mODULEID, Nullable<int> mASTERID, string fILENAME, string fILEPATH, string fILETYPE, Nullable<int> fILESIZE)
        {
            var mODULEIDParameter = mODULEID.HasValue ?
                new ObjectParameter("MODULEID", mODULEID) :
                new ObjectParameter("MODULEID", typeof(int));
    
            var mASTERIDParameter = mASTERID.HasValue ?
                new ObjectParameter("MASTERID", mASTERID) :
                new ObjectParameter("MASTERID", typeof(int));
    
            var fILENAMEParameter = fILENAME != null ?
                new ObjectParameter("FILENAME", fILENAME) :
                new ObjectParameter("FILENAME", typeof(string));
    
            var fILEPATHParameter = fILEPATH != null ?
                new ObjectParameter("FILEPATH", fILEPATH) :
                new ObjectParameter("FILEPATH", typeof(string));
    
            var fILETYPEParameter = fILETYPE != null ?
                new ObjectParameter("FILETYPE", fILETYPE) :
                new ObjectParameter("FILETYPE", typeof(string));
    
            var fILESIZEParameter = fILESIZE.HasValue ?
                new ObjectParameter("FILESIZE", fILESIZE) :
                new ObjectParameter("FILESIZE", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_SYS_ATTACHMENT_INSERT", mODULEIDParameter, mASTERIDParameter, fILENAMEParameter, fILEPATHParameter, fILETYPEParameter, fILESIZEParameter);
        }
    
        public virtual ObjectResult<SP_SYS_USER_LOGIN_Result> SP_SYS_USER_LOGIN(string uSERID, string pASSWORD, Nullable<int> sYSTEM)
        {
            var uSERIDParameter = uSERID != null ?
                new ObjectParameter("USERID", uSERID) :
                new ObjectParameter("USERID", typeof(string));
    
            var pASSWORDParameter = pASSWORD != null ?
                new ObjectParameter("PASSWORD", pASSWORD) :
                new ObjectParameter("PASSWORD", typeof(string));
    
            var sYSTEMParameter = sYSTEM.HasValue ?
                new ObjectParameter("SYSTEM", sYSTEM) :
                new ObjectParameter("SYSTEM", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_SYS_USER_LOGIN_Result>("SP_SYS_USER_LOGIN", uSERIDParameter, pASSWORDParameter, sYSTEMParameter);
        }
    
        public virtual ObjectResult<SP_GETMENU_Result> SP_GETMENU(string user)
        {
            var userParameter = user != null ?
                new ObjectParameter("User", user) :
                new ObjectParameter("User", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_GETMENU_Result>("SP_GETMENU", userParameter);
        }
    
        public virtual ObjectResult<SP_BANNER_GETALL_Result> SP_BANNER_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, string keyword, ObjectParameter totalRow, Nullable<int> languageId)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var keywordParameter = keyword != null ?
                new ObjectParameter("keyword", keyword) :
                new ObjectParameter("keyword", typeof(string));
    
            var languageIdParameter = languageId.HasValue ?
                new ObjectParameter("languageId", languageId) :
                new ObjectParameter("languageId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_BANNER_GETALL_Result>("SP_BANNER_GETALL", pageIndexParameter, pageSizeParameter, keywordParameter, totalRow, languageIdParameter);
        }
    
        public virtual int SP_BANNER_INSERT(string heading, string subHeading, string description, string image, string userCreated, Nullable<int> status, Nullable<int> publishStatus, Nullable<bool> hasKo, string headingKo, string subHeadingKo, string descriptionKo, Nullable<bool> hasVi, string headingVi, string subHeadingVi, string descriptionVi)
        {
            var headingParameter = heading != null ?
                new ObjectParameter("heading", heading) :
                new ObjectParameter("heading", typeof(string));
    
            var subHeadingParameter = subHeading != null ?
                new ObjectParameter("subHeading", subHeading) :
                new ObjectParameter("subHeading", typeof(string));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("description", description) :
                new ObjectParameter("description", typeof(string));
    
            var imageParameter = image != null ?
                new ObjectParameter("image", image) :
                new ObjectParameter("image", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var publishStatusParameter = publishStatus.HasValue ?
                new ObjectParameter("publishStatus", publishStatus) :
                new ObjectParameter("publishStatus", typeof(int));
    
            var hasKoParameter = hasKo.HasValue ?
                new ObjectParameter("hasKo", hasKo) :
                new ObjectParameter("hasKo", typeof(bool));
    
            var headingKoParameter = headingKo != null ?
                new ObjectParameter("headingKo", headingKo) :
                new ObjectParameter("headingKo", typeof(string));
    
            var subHeadingKoParameter = subHeadingKo != null ?
                new ObjectParameter("subHeadingKo", subHeadingKo) :
                new ObjectParameter("subHeadingKo", typeof(string));
    
            var descriptionKoParameter = descriptionKo != null ?
                new ObjectParameter("descriptionKo", descriptionKo) :
                new ObjectParameter("descriptionKo", typeof(string));
    
            var hasViParameter = hasVi.HasValue ?
                new ObjectParameter("hasVi", hasVi) :
                new ObjectParameter("hasVi", typeof(bool));
    
            var headingViParameter = headingVi != null ?
                new ObjectParameter("headingVi", headingVi) :
                new ObjectParameter("headingVi", typeof(string));
    
            var subHeadingViParameter = subHeadingVi != null ?
                new ObjectParameter("subHeadingVi", subHeadingVi) :
                new ObjectParameter("subHeadingVi", typeof(string));
    
            var descriptionViParameter = descriptionVi != null ?
                new ObjectParameter("descriptionVi", descriptionVi) :
                new ObjectParameter("descriptionVi", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_BANNER_INSERT", headingParameter, subHeadingParameter, descriptionParameter, imageParameter, userCreatedParameter, statusParameter, publishStatusParameter, hasKoParameter, headingKoParameter, subHeadingKoParameter, descriptionKoParameter, hasViParameter, headingViParameter, subHeadingViParameter, descriptionViParameter);
        }
    
        public virtual int SP_BANNER_UPDATE(Nullable<int> id, string heading, string subHeading, string description, string image, string userCreated, Nullable<int> status, Nullable<int> publishStatus, Nullable<bool> hasKo, string headingKo, string subHeadingKo, string descriptionKo, Nullable<bool> hasVi, string headingVi, string subHeadingVi, string descriptionVi)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var headingParameter = heading != null ?
                new ObjectParameter("heading", heading) :
                new ObjectParameter("heading", typeof(string));
    
            var subHeadingParameter = subHeading != null ?
                new ObjectParameter("subHeading", subHeading) :
                new ObjectParameter("subHeading", typeof(string));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("description", description) :
                new ObjectParameter("description", typeof(string));
    
            var imageParameter = image != null ?
                new ObjectParameter("image", image) :
                new ObjectParameter("image", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var publishStatusParameter = publishStatus.HasValue ?
                new ObjectParameter("publishStatus", publishStatus) :
                new ObjectParameter("publishStatus", typeof(int));
    
            var hasKoParameter = hasKo.HasValue ?
                new ObjectParameter("hasKo", hasKo) :
                new ObjectParameter("hasKo", typeof(bool));
    
            var headingKoParameter = headingKo != null ?
                new ObjectParameter("headingKo", headingKo) :
                new ObjectParameter("headingKo", typeof(string));
    
            var subHeadingKoParameter = subHeadingKo != null ?
                new ObjectParameter("subHeadingKo", subHeadingKo) :
                new ObjectParameter("subHeadingKo", typeof(string));
    
            var descriptionKoParameter = descriptionKo != null ?
                new ObjectParameter("descriptionKo", descriptionKo) :
                new ObjectParameter("descriptionKo", typeof(string));
    
            var hasViParameter = hasVi.HasValue ?
                new ObjectParameter("hasVi", hasVi) :
                new ObjectParameter("hasVi", typeof(bool));
    
            var headingViParameter = headingVi != null ?
                new ObjectParameter("headingVi", headingVi) :
                new ObjectParameter("headingVi", typeof(string));
    
            var subHeadingViParameter = subHeadingVi != null ?
                new ObjectParameter("subHeadingVi", subHeadingVi) :
                new ObjectParameter("subHeadingVi", typeof(string));
    
            var descriptionViParameter = descriptionVi != null ?
                new ObjectParameter("descriptionVi", descriptionVi) :
                new ObjectParameter("descriptionVi", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_BANNER_UPDATE", idParameter, headingParameter, subHeadingParameter, descriptionParameter, imageParameter, userCreatedParameter, statusParameter, publishStatusParameter, hasKoParameter, headingKoParameter, subHeadingKoParameter, descriptionKoParameter, hasViParameter, headingViParameter, subHeadingViParameter, descriptionViParameter);
        }
    
        public virtual ObjectResult<SP_TDSTANDARDMOTOR_GETALL_Result> SP_TDSTANDARDMOTOR_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> efficiency, ObjectParameter totalRow, Nullable<int> languageId)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var efficiencyParameter = efficiency.HasValue ?
                new ObjectParameter("efficiency", efficiency) :
                new ObjectParameter("efficiency", typeof(int));
    
            var languageIdParameter = languageId.HasValue ?
                new ObjectParameter("languageId", languageId) :
                new ObjectParameter("languageId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_TDSTANDARDMOTOR_GETALL_Result>("SP_TDSTANDARDMOTOR_GETALL", pageIndexParameter, pageSizeParameter, efficiencyParameter, totalRow, languageIdParameter);
        }
    
        public virtual ObjectResult<SP_POST_GETALL_Result> SP_POST_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, string keyword, ObjectParameter totalRow, Nullable<int> languageId)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var keywordParameter = keyword != null ?
                new ObjectParameter("keyword", keyword) :
                new ObjectParameter("keyword", typeof(string));
    
            var languageIdParameter = languageId.HasValue ?
                new ObjectParameter("languageId", languageId) :
                new ObjectParameter("languageId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_POST_GETALL_Result>("SP_POST_GETALL", pageIndexParameter, pageSizeParameter, keywordParameter, totalRow, languageIdParameter);
        }
    
        public virtual ObjectResult<SP_POST_GETTOP2_Result> SP_POST_GETTOP2(string languageCode, string userId)
        {
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("languageCode", languageCode) :
                new ObjectParameter("languageCode", typeof(string));
    
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_POST_GETTOP2_Result>("SP_POST_GETTOP2", languageCodeParameter, userIdParameter);
        }
    
        public virtual int SP_POST_INSERT(string title, string description, string content, string thumbnail, string image, string imageCaption, string userCreated, Nullable<int> status, Nullable<int> sublishStatus, string titleKor, string descriptionKor, string contentKor, string imageCaptionKor, string titleVi, string descriptionVi, string contentVi, string imageCaptionVi)
        {
            var titleParameter = title != null ?
                new ObjectParameter("title", title) :
                new ObjectParameter("title", typeof(string));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("description", description) :
                new ObjectParameter("description", typeof(string));
    
            var contentParameter = content != null ?
                new ObjectParameter("content", content) :
                new ObjectParameter("content", typeof(string));
    
            var thumbnailParameter = thumbnail != null ?
                new ObjectParameter("thumbnail", thumbnail) :
                new ObjectParameter("thumbnail", typeof(string));
    
            var imageParameter = image != null ?
                new ObjectParameter("image", image) :
                new ObjectParameter("image", typeof(string));
    
            var imageCaptionParameter = imageCaption != null ?
                new ObjectParameter("imageCaption", imageCaption) :
                new ObjectParameter("imageCaption", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var sublishStatusParameter = sublishStatus.HasValue ?
                new ObjectParameter("sublishStatus", sublishStatus) :
                new ObjectParameter("sublishStatus", typeof(int));
    
            var titleKorParameter = titleKor != null ?
                new ObjectParameter("titleKor", titleKor) :
                new ObjectParameter("titleKor", typeof(string));
    
            var descriptionKorParameter = descriptionKor != null ?
                new ObjectParameter("descriptionKor", descriptionKor) :
                new ObjectParameter("descriptionKor", typeof(string));
    
            var contentKorParameter = contentKor != null ?
                new ObjectParameter("contentKor", contentKor) :
                new ObjectParameter("contentKor", typeof(string));
    
            var imageCaptionKorParameter = imageCaptionKor != null ?
                new ObjectParameter("imageCaptionKor", imageCaptionKor) :
                new ObjectParameter("imageCaptionKor", typeof(string));
    
            var titleViParameter = titleVi != null ?
                new ObjectParameter("titleVi", titleVi) :
                new ObjectParameter("titleVi", typeof(string));
    
            var descriptionViParameter = descriptionVi != null ?
                new ObjectParameter("descriptionVi", descriptionVi) :
                new ObjectParameter("descriptionVi", typeof(string));
    
            var contentViParameter = contentVi != null ?
                new ObjectParameter("contentVi", contentVi) :
                new ObjectParameter("contentVi", typeof(string));
    
            var imageCaptionViParameter = imageCaptionVi != null ?
                new ObjectParameter("imageCaptionVi", imageCaptionVi) :
                new ObjectParameter("imageCaptionVi", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_POST_INSERT", titleParameter, descriptionParameter, contentParameter, thumbnailParameter, imageParameter, imageCaptionParameter, userCreatedParameter, statusParameter, sublishStatusParameter, titleKorParameter, descriptionKorParameter, contentKorParameter, imageCaptionKorParameter, titleViParameter, descriptionViParameter, contentViParameter, imageCaptionViParameter);
        }
    
        public virtual int SP_POST_UPDATE(Nullable<int> id, string title, string description, string content, string thumbnail, string image, string imageCaption, string userCreated, Nullable<int> status, Nullable<int> sublishStatus, string titleKor, string descriptionKor, string contentKor, string imageCaptionKor, string titleVi, string descriptionVi, string contentVi, string imageCaptionVi)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var titleParameter = title != null ?
                new ObjectParameter("title", title) :
                new ObjectParameter("title", typeof(string));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("description", description) :
                new ObjectParameter("description", typeof(string));
    
            var contentParameter = content != null ?
                new ObjectParameter("content", content) :
                new ObjectParameter("content", typeof(string));
    
            var thumbnailParameter = thumbnail != null ?
                new ObjectParameter("thumbnail", thumbnail) :
                new ObjectParameter("thumbnail", typeof(string));
    
            var imageParameter = image != null ?
                new ObjectParameter("image", image) :
                new ObjectParameter("image", typeof(string));
    
            var imageCaptionParameter = imageCaption != null ?
                new ObjectParameter("imageCaption", imageCaption) :
                new ObjectParameter("imageCaption", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var sublishStatusParameter = sublishStatus.HasValue ?
                new ObjectParameter("sublishStatus", sublishStatus) :
                new ObjectParameter("sublishStatus", typeof(int));
    
            var titleKorParameter = titleKor != null ?
                new ObjectParameter("titleKor", titleKor) :
                new ObjectParameter("titleKor", typeof(string));
    
            var descriptionKorParameter = descriptionKor != null ?
                new ObjectParameter("descriptionKor", descriptionKor) :
                new ObjectParameter("descriptionKor", typeof(string));
    
            var contentKorParameter = contentKor != null ?
                new ObjectParameter("contentKor", contentKor) :
                new ObjectParameter("contentKor", typeof(string));
    
            var imageCaptionKorParameter = imageCaptionKor != null ?
                new ObjectParameter("imageCaptionKor", imageCaptionKor) :
                new ObjectParameter("imageCaptionKor", typeof(string));
    
            var titleViParameter = titleVi != null ?
                new ObjectParameter("titleVi", titleVi) :
                new ObjectParameter("titleVi", typeof(string));
    
            var descriptionViParameter = descriptionVi != null ?
                new ObjectParameter("descriptionVi", descriptionVi) :
                new ObjectParameter("descriptionVi", typeof(string));
    
            var contentViParameter = contentVi != null ?
                new ObjectParameter("contentVi", contentVi) :
                new ObjectParameter("contentVi", typeof(string));
    
            var imageCaptionViParameter = imageCaptionVi != null ?
                new ObjectParameter("imageCaptionVi", imageCaptionVi) :
                new ObjectParameter("imageCaptionVi", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_POST_UPDATE", idParameter, titleParameter, descriptionParameter, contentParameter, thumbnailParameter, imageParameter, imageCaptionParameter, userCreatedParameter, statusParameter, sublishStatusParameter, titleKorParameter, descriptionKorParameter, contentKorParameter, imageCaptionKorParameter, titleViParameter, descriptionViParameter, contentViParameter, imageCaptionViParameter);
        }
    
        public virtual ObjectResult<SP_POST_GETTOP2_DETAIL_Result> SP_POST_GETTOP2_DETAIL(Nullable<int> id, string languageCode)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("languageCode", languageCode) :
                new ObjectParameter("languageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_POST_GETTOP2_DETAIL_Result>("SP_POST_GETTOP2_DETAIL", idParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<SP_TD60HZMOTOR_GETALL_Result> SP_TD60HZMOTOR_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> efficiency, ObjectParameter totalRow, Nullable<int> languageId)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var efficiencyParameter = efficiency.HasValue ?
                new ObjectParameter("efficiency", efficiency) :
                new ObjectParameter("efficiency", typeof(int));
    
            var languageIdParameter = languageId.HasValue ?
                new ObjectParameter("languageId", languageId) :
                new ObjectParameter("languageId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_TD60HZMOTOR_GETALL_Result>("SP_TD60HZMOTOR_GETALL", pageIndexParameter, pageSizeParameter, efficiencyParameter, totalRow, languageIdParameter);
        }
    
        public virtual ObjectResult<SP_CONTACT_GETALL_Result> SP_CONTACT_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, string keyword, ObjectParameter totalRow)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var keywordParameter = keyword != null ?
                new ObjectParameter("keyword", keyword) :
                new ObjectParameter("keyword", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_CONTACT_GETALL_Result>("SP_CONTACT_GETALL", pageIndexParameter, pageSizeParameter, keywordParameter, totalRow);
        }
    
        public virtual int SP_CONTACT_INSERT(string name, string address, string addressUrl, string email, string phoneNumber, string userCreated, Nullable<int> status, Nullable<int> publishStatus, Nullable<int> seq)
        {
            var nameParameter = name != null ?
                new ObjectParameter("name", name) :
                new ObjectParameter("name", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var addressUrlParameter = addressUrl != null ?
                new ObjectParameter("addressUrl", addressUrl) :
                new ObjectParameter("addressUrl", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var phoneNumberParameter = phoneNumber != null ?
                new ObjectParameter("phoneNumber", phoneNumber) :
                new ObjectParameter("phoneNumber", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var publishStatusParameter = publishStatus.HasValue ?
                new ObjectParameter("publishStatus", publishStatus) :
                new ObjectParameter("publishStatus", typeof(int));
    
            var seqParameter = seq.HasValue ?
                new ObjectParameter("seq", seq) :
                new ObjectParameter("seq", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_CONTACT_INSERT", nameParameter, addressParameter, addressUrlParameter, emailParameter, phoneNumberParameter, userCreatedParameter, statusParameter, publishStatusParameter, seqParameter);
        }
    
        public virtual int SP_CONTACT_UPDATE(Nullable<int> id, string name, string address, string addressUrl, string email, string phoneNumber, string userCreated, Nullable<int> status, Nullable<int> publishStatus, Nullable<int> seq)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("name", name) :
                new ObjectParameter("name", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var addressUrlParameter = addressUrl != null ?
                new ObjectParameter("addressUrl", addressUrl) :
                new ObjectParameter("addressUrl", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var phoneNumberParameter = phoneNumber != null ?
                new ObjectParameter("phoneNumber", phoneNumber) :
                new ObjectParameter("phoneNumber", typeof(string));
    
            var userCreatedParameter = userCreated != null ?
                new ObjectParameter("userCreated", userCreated) :
                new ObjectParameter("userCreated", typeof(string));
    
            var statusParameter = status.HasValue ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(int));
    
            var publishStatusParameter = publishStatus.HasValue ?
                new ObjectParameter("publishStatus", publishStatus) :
                new ObjectParameter("publishStatus", typeof(int));
    
            var seqParameter = seq.HasValue ?
                new ObjectParameter("seq", seq) :
                new ObjectParameter("seq", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_CONTACT_UPDATE", idParameter, nameParameter, addressParameter, addressUrlParameter, emailParameter, phoneNumberParameter, userCreatedParameter, statusParameter, publishStatusParameter, seqParameter);
        }
    
        public virtual ObjectResult<SP_INQUIRIES_GETALL_Result> SP_INQUIRIES_GETALL(Nullable<int> pageIndex, Nullable<int> pageSize, string keyword, ObjectParameter totalRow)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var keywordParameter = keyword != null ?
                new ObjectParameter("keyword", keyword) :
                new ObjectParameter("keyword", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_INQUIRIES_GETALL_Result>("SP_INQUIRIES_GETALL", pageIndexParameter, pageSizeParameter, keywordParameter, totalRow);
        }
    
        public virtual int SP_INQUIRIES_INSERT(string fullName, string phoneNumber, string email, string message)
        {
            var fullNameParameter = fullName != null ?
                new ObjectParameter("fullName", fullName) :
                new ObjectParameter("fullName", typeof(string));
    
            var phoneNumberParameter = phoneNumber != null ?
                new ObjectParameter("phoneNumber", phoneNumber) :
                new ObjectParameter("phoneNumber", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var messageParameter = message != null ?
                new ObjectParameter("message", message) :
                new ObjectParameter("message", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INQUIRIES_INSERT", fullNameParameter, phoneNumberParameter, emailParameter, messageParameter);
        }
    }
}
