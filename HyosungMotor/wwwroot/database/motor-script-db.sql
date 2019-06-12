USE [master]
GO
/****** Object:  Database [MotorHomepage]    Script Date: 6/12/2019 5:09:58 PM ******/
CREATE DATABASE [MotorHomepage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MotorHomepage', FILENAME = N'D:\DATABASE\MotorHompage\MotorHomepage.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MotorHomepage_log', FILENAME = N'D:\DATABASE\MotorHompage\MotorHomepage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MotorHomepage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MotorHomepage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MotorHomepage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MotorHomepage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MotorHomepage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MotorHomepage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MotorHomepage] SET ARITHABORT OFF 
GO
ALTER DATABASE [MotorHomepage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MotorHomepage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MotorHomepage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MotorHomepage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MotorHomepage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MotorHomepage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MotorHomepage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MotorHomepage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MotorHomepage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MotorHomepage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MotorHomepage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MotorHomepage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MotorHomepage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MotorHomepage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MotorHomepage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MotorHomepage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MotorHomepage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MotorHomepage] SET RECOVERY FULL 
GO
ALTER DATABASE [MotorHomepage] SET  MULTI_USER 
GO
ALTER DATABASE [MotorHomepage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MotorHomepage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MotorHomepage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MotorHomepage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MotorHomepage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MotorHomepage]
GO
/****** Object:  User [motor]    Script Date: 6/12/2019 5:09:58 PM ******/
CREATE USER [motor] FOR LOGIN [motor] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [motor]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 6/12/2019 5:09:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[MasterId] [int] NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[FilePath] [nvarchar](500) NOT NULL,
	[FileType] [nvarchar](max) NULL,
	[FileSize] [int] NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
	[PublishStatus] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[HasKo] [bit] NULL,
	[HasVi] [bit] NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerTranslations]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[BannerId] [int] NOT NULL,
	[Heading] [nvarchar](2550) NULL,
	[SubHeading] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_BannerTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Content] [nvarchar](max) NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[ImageCaption] [nvarchar](250) NULL,
	[PublishedDate] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
	[PublishStatus] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTranslations]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](1000) NULL,
	[Content] [nvarchar](max) NULL,
	[ImageCaption] [nvarchar](250) NULL,
 CONSTRAINT [PK_PostTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCategories]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Remark] [nvarchar](1000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_SysCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCategoryValues]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCategoryValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DictionaryId] [int] NULL,
	[CategoryId] [int] NULL,
	[ParentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_SysCategoryValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysDictionnaries]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDictionnaries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Language1] [nvarchar](1000) NULL,
	[Language2] [nvarchar](1000) NULL,
	[Language3] [nvarchar](1000) NULL,
	[Language4] [nvarchar](1000) NULL,
	[Language5] [nvarchar](1000) NULL,
	[MasterId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_SysDictionnary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysMenus]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMenus](
	[Id] [nvarchar](450) NOT NULL,
	[DictionaryId] [int] NULL,
	[System] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
	[ParentId] [nvarchar](128) NULL,
	[IconCss] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UserCreated] [uniqueidentifier] NOT NULL,
	[DateDeleted] [datetime2](7) NULL,
	[UserDeleted] [uniqueidentifier] NULL,
	[UserModified] [uniqueidentifier] NULL,
	[DateModified] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SysMenus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysRoleMapping]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoleMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [varchar](20) NOT NULL,
	[ControllerId] [varchar](200) NOT NULL,
	[ActionId] [varchar](200) NOT NULL,
	[ActionName] [varchar](500) NOT NULL,
	[IsAllow] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SysRoleMapping_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysRoles]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoles](
	[RoleId] [varchar](20) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[SystemId] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [varchar](20) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUser] [varchar](20) NULL,
	[DeleteDate] [datetime] NULL,
	[DeleteUser] [varchar](20) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_SysRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUser](
	[UserId] [varchar](20) NOT NULL,
	[UserName] [nvarchar](500) NOT NULL,
	[Email] [varchar](500) NULL,
	[Mobile] [varchar](20) NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Image] [varchar](200) NULL,
	[Status] [int] NULL,
	[CreateUid] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUid] [varchar](20) NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteUid] [varchar](20) NULL,
	[Deleted] [bit] NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_SysUser_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUserRoleMapping]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserRoleMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](20) NULL,
	[RoleId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_SysUserRoleMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (4, N'ooo', N'admin', CAST(N'2019-01-10T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, 1, CAST(N'2019-06-11T14:44:08.357' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (6, N'../wwwroot/Resource/Images/admin/20190611/motor-1-114251.jpg', N'admin', CAST(N'2019-06-11T11:42:55.320' AS DateTime), N'admin', CAST(N'2019-06-12T16:25:31.290' AS DateTime), 1, 1, 0, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (7, N'../wwwroot/Resource/Images/admin/20190611/motor-2-nhan-nghia-114513.jpg', N'admin', CAST(N'2019-06-11T11:45:35.423' AS DateTime), N'admin', CAST(N'2019-06-11T13:58:01.307' AS DateTime), 1, 0, 0, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (9, N'../wwwroot/Resource/Images/admin/20190611/motor-1-134121.jpg', N'admin', CAST(N'2019-06-11T13:42:02.777' AS DateTime), NULL, NULL, 1, 2, 0, NULL, NULL, 1, 0)
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (11, N'../wwwroot/Resource/Images/admin/20190612/motor-2-nhan-nghia-162848.jpg', N'admin', CAST(N'2019-06-12T16:28:56.650' AS DateTime), NULL, NULL, 1, 0, 0, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Banners] ([Id], [Image], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [IsDeleted], [DateDeleted], [UserDeleted], [HasKo], [HasVi]) VALUES (13, N'../wwwroot/Resource/Images/admin/20190612/motor-1-163143.jpg', N'admin', CAST(N'2019-06-12T16:31:49.470' AS DateTime), N'admin', CAST(N'2019-06-12T16:31:59.373' AS DateTime), 1, 0, 0, NULL, NULL, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[BannerTranslations] ON 
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (7, 1, 6, N'update 123', N'ahihi 12', N'aaaa 3333')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (8, 2, 6, N'tiềng hàn', N'tiềng hàn', N'tiềng hàn')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (9, 3, 6, N'tiếng việt', N'tiếng việt', N'3tiếng 3')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (13, 1, 11, N'ngôn ngữ', N'12', N'12 12 1')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (14, 2, 11, N'tiềng hàn 2', N'tiềng hàn 2', N'tiềng hàn3')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (15, 3, 11, N'tiếng việt 2', N'tiếng việt 1', N'3tiếng 3')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (22, 1, 13, N'121 2', N'1 2', N'12 12 12')
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (23, 2, 13, NULL, NULL, NULL)
GO
INSERT [dbo].[BannerTranslations] ([Id], [LanguageId], [BannerId], [Heading], [SubHeading], [Description]) VALUES (24, 3, 13, N'1', N'1', N'1')
GO
SET IDENTITY_INSERT [dbo].[BannerTranslations] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1, N'English')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (2, N'Korean')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (3, N'Vietnamese')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[SysCategories] ON 
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (5, N'Banner', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (6, N'System', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (7, N'Module', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SysCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[SysCategoryValues] ON 
GO
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (1, N'Admin', NULL, 6, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (2, N'Application', NULL, 6, NULL, 0, NULL, NULL, N'admin', CAST(N'2016-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (4, N'Menu', NULL, 7, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[SysCategoryValues] OFF
GO
SET IDENTITY_INSERT [dbo].[SysDictionnaries] ON 
GO
INSERT [dbo].[SysDictionnaries] ([Id], [Language1], [Language2], [Language3], [Language4], [Language5], [MasterId], [ModuleId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (2, N'System', N'체계', N'Hệ thống', NULL, NULL, 1, 7, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysDictionnaries] ([Id], [Language1], [Language2], [Language3], [Language4], [Language5], [MasterId], [ModuleId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (6, N'Banner', N'기치', N'Tiêu đề', NULL, NULL, 2, 7, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SysDictionnaries] OFF
GO
INSERT [dbo].[SysMenus] ([Id], [DictionaryId], [System], [Name], [URL], [ParentId], [IconCss], [SortOrder], [Status], [DateCreated], [UserCreated], [DateDeleted], [UserDeleted], [UserModified], [DateModified], [IsDeleted]) VALUES (N'Banner', 2, 1, N'Banner Mangement', N'/admin/banner/index', N'System', N'fa fa-thumbs-up', 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysMenus] ([Id], [DictionaryId], [System], [Name], [URL], [ParentId], [IconCss], [SortOrder], [Status], [DateCreated], [UserCreated], [DateDeleted], [UserDeleted], [UserModified], [DateModified], [IsDeleted]) VALUES (N'System', 6, 1, N'System', N'javascript:void(0);', NULL, N'glyphicon glyphicon-cog', 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysRoles] ([RoleId], [RoleName], [SystemId], [Description], [Status], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [DeleteDate], [DeleteUser], [IsDelete]) VALUES (N'AD01', N'Administrator', NULL, NULL, NULL, CAST(N'2019-06-10T11:40:38.303' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([UserId], [UserName], [Email], [Mobile], [Password], [Image], [Status], [CreateUid], [CreateDate], [UpdateUid], [UpdateDate], [DeleteUid], [Deleted], [DeleteDate]) VALUES (N'admin', N'ADMINISTRATOR', N'admin@hyosungmotor.com', NULL, N'Yc802gRUeM8=', NULL, NULL, NULL, CAST(N'2019-06-10T10:11:17.837' AS DateTime), NULL, CAST(N'2019-06-10T10:11:17.837' AS DateTime), NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[SysUserRoleMapping] ON 
GO
INSERT [dbo].[SysUserRoleMapping] ([Id], [UserId], [RoleId], [CreateDate]) VALUES (1, N'admin', N'AD01', NULL)
GO
SET IDENTITY_INSERT [dbo].[SysUserRoleMapping] OFF
GO
ALTER TABLE [dbo].[Banners] ADD  CONSTRAINT [DF_Banners_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[BannerTranslations]  WITH CHECK ADD  CONSTRAINT [FK_BannerTranslations_Banners] FOREIGN KEY([BannerId])
REFERENCES [dbo].[Banners] ([Id])
GO
ALTER TABLE [dbo].[BannerTranslations] CHECK CONSTRAINT [FK_BannerTranslations_Banners]
GO
ALTER TABLE [dbo].[BannerTranslations]  WITH CHECK ADD  CONSTRAINT [FK_BannerTranslations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[BannerTranslations] CHECK CONSTRAINT [FK_BannerTranslations_Languages]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_SysCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[SysCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_SysCategories_CategoryId]
GO
ALTER TABLE [dbo].[PostTranslations]  WITH CHECK ADD  CONSTRAINT [FK_PostTranslations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[PostTranslations] CHECK CONSTRAINT [FK_PostTranslations_Languages]
GO
ALTER TABLE [dbo].[PostTranslations]  WITH CHECK ADD  CONSTRAINT [FK_PostTranslations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostTranslations] CHECK CONSTRAINT [FK_PostTranslations_Posts]
GO
ALTER TABLE [dbo].[SysCategoryValues]  WITH CHECK ADD  CONSTRAINT [FK_SysCategoryValues_SysCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[SysCategories] ([Id])
GO
ALTER TABLE [dbo].[SysCategoryValues] CHECK CONSTRAINT [FK_SysCategoryValues_SysCategories_CategoryId]
GO
ALTER TABLE [dbo].[SysCategoryValues]  WITH CHECK ADD  CONSTRAINT [FK_SysCategoryValues_SysDictionnary_DictionaryId] FOREIGN KEY([DictionaryId])
REFERENCES [dbo].[SysDictionnaries] ([Id])
GO
ALTER TABLE [dbo].[SysCategoryValues] CHECK CONSTRAINT [FK_SysCategoryValues_SysDictionnary_DictionaryId]
GO
ALTER TABLE [dbo].[SysMenus]  WITH CHECK ADD  CONSTRAINT [FK_SysMenus_SysDictionnaries] FOREIGN KEY([DictionaryId])
REFERENCES [dbo].[SysDictionnaries] ([Id])
GO
ALTER TABLE [dbo].[SysMenus] CHECK CONSTRAINT [FK_SysMenus_SysDictionnaries]
GO
ALTER TABLE [dbo].[SysRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_SysRoleMapping_SysRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[SysRoles] ([RoleId])
GO
ALTER TABLE [dbo].[SysRoleMapping] CHECK CONSTRAINT [FK_SysRoleMapping_SysRoles]
GO
ALTER TABLE [dbo].[SysUserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_SysUserRoleMapping_SysRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[SysRoles] ([RoleId])
GO
ALTER TABLE [dbo].[SysUserRoleMapping] CHECK CONSTRAINT [FK_SysUserRoleMapping_SysRoles]
GO
ALTER TABLE [dbo].[SysUserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_SysUserRoleMapping_SysUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[SysUser] ([UserId])
GO
ALTER TABLE [dbo].[SysUserRoleMapping] CHECK CONSTRAINT [FK_SysUserRoleMapping_SysUser]
GO
/****** Object:  StoredProcedure [dbo].[SP_BANNER_GETALL]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<NGUYEN NHAN NGHIA>
-- Create date: <2019.06.10>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BANNER_GETALL]
	-- Add the parameters for the stored procedure here
	@pageIndex int = 1,
	@pageSize int = 1,
	@keyword nvarchar(128) = NULL,
	@totalRow int = null output,
	@languageId int = NULL--en,ko,vi
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @languageId IS NULL SET @languageId = 1
	SELECT @totalRow = COUNT(1) 
	FROM Banners A
	LEFT JOIN BannerTranslations T ON A.Id = T.BannerId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Id = @languageId
	WHERE 1=1
		AND A.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		AND (@keyword IS NULL OR (T.Heading LIKE '%'+@keyword+'%' OR T.SubHeading LIKE '%'+@keyword+'%'))
    -- Insert statements for procedure here
	SELECT A.Id, T.Heading, T.SubHeading, A.HasKo, A.HasVi, A.DateCreated, B.UserName UserCreated, A.DateModified, C.UserName UserModified, A.[Status], A.PublishStatus
	FROM Banners A
	LEFT JOIN BannerTranslations T ON A.Id = T.BannerId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Id = @languageId
	LEFT JOIN SysUser B ON A.UserCreated = B.UserId
	LEFT JOIN SysUser C ON A.UserModified = C.UserId
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	--LEFT JOIN BannerVis C ON A.Id = C.MasterId
	WHERE 1=1
		AND A.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		AND (@keyword IS NULL OR (T.Heading LIKE '%'+@keyword+'%' OR T.SubHeading LIKE '%'+@keyword+'%'))

	ORDER BY A.DateCreated DESC
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	OFFSET (@pageIndex - 1) * @pageSize rows
	FETCH NEXT @pageSize row only

END
GO
/****** Object:  StoredProcedure [dbo].[SP_BANNER_INSERT]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NGUYEN NHAN NGHIA
-- Create date: 2019.06.11
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BANNER_INSERT]
	-- Add the parameters for the stored procedure here
	
	@heading nvarchar(255),
	@subHeading nvarchar(255),
	@description nvarchar(1000),
	@image nvarchar(250),
	@userCreated varchar(20),
	@status int,
	@publishStatus int,

	@hasKo bit,
	@headingKo nvarchar(255) = null,
	@subHeadingKo nvarchar(255) = null,
	@descriptionKo nvarchar(1000) = null,

	@hasVi bit,
	@headingVi nvarchar(255) = null,
	@subHeadingVi nvarchar(255) = null,
	@descriptionVi nvarchar(1000) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ID INT = 0
    -- Insert statements for procedure here
	
	INSERT INTO Banners([Image],UserCreated, DateCreated, [Status], PublishStatus, HasKo, HasVi)
	VALUES(@image, @userCreated, GETDATE(), @status, @publishStatus, @hasKo, @hasVi)
	
	--LAY RA ID VUA MOI THEM
	SET @ID = SCOPE_IDENTITY()

	--THEM NGON NGU TIENG ANH
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(1, @ID, @heading, @subHeading, @description)

	--THEM NGON NGU TIENG HAN
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(2, @ID, @headingKo, @subHeadingKo, @descriptionKo)

	--THEM NGON NGU TIENG VIET
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(3, @ID, @headingVi, @subHeadingVi, @descriptionVi)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_BANNER_UPDATE]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NGUYEN NHAN NGHIA
-- Create date: 2019.06.11
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BANNER_UPDATE]
	-- Add the parameters for the stored procedure here
	@id int,
	@heading nvarchar(255),
	@subHeading nvarchar(255),
	@description nvarchar(1000),
	@image nvarchar(250),
	@userCreated varchar(20),
	@status int,
	@publishStatus int,

	@hasKo bit,
	@headingKo nvarchar(255) = null,
	@subHeadingKo nvarchar(255) = null,
	@descriptionKo nvarchar(1000) = null,

	@hasVi bit,
	@headingVi nvarchar(255) = null,
	@subHeadingVi nvarchar(255) = null,
	@descriptionVi nvarchar(1000) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Banners
	SET [Image] = @image, [Status] = @status, PublishStatus = @publishStatus, HasKo = @hasKo, HasVi = @hasVi, DateModified = GETDATE(), UserModified = @userCreated
	WHERE Id = @id
	
	DELETE BannerTranslations WHERE BannerId = @id

	--THEM NGON NGU TIENG ANH
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(1, @ID, @heading, @subHeading, @description)

	--THEM NGON NGU TIENG HAN
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(2, @ID, @headingKo, @subHeadingKo, @descriptionKo)

	--THEM NGON NGU TIENG VIET
	INSERT INTO BannerTranslations(LanguageId, BannerId, Heading, SubHeading, [Description])
	VALUES(3, @ID, @headingVi, @subHeadingVi, @descriptionVi)

	--IF @hasKo = 1
	--BEGIN
	INSERT INTO BannerKos(Heading, SubHeading, [Description], MasterId)
	VALUES(@headingKo, @subHeadingKo, @descriptionKo, @id)
	--END
	--IF @hasVi = 1
	--BEGIN
	INSERT INTO BannerVis(Heading, SubHeading, [Description], MasterId)
	VALUES(@headingVi, @subHeadingVi, @descriptionVi, @id)
	--END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETMENU]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GETMENU] 
	-- Add the parameters for the stored procedure here
	@User varchar(36) = 'ad01'
AS
BEGIN

	DECLARE @TBTEMP TABLE (ID NVARCHAR(450), [NAME] NVARCHAR(128), PARENTID NVARCHAR(450)
							, SEQUENCE TINYINT, [URL] VARCHAR(100), ICON VARCHAR(100))
	SELECT * FROM SysMenus
	;WITH TEMP(Id, [NAME], PARENTID, SORTORDER , [URL], IconCss)
	AS (
			SELECT Id, [NAME], PARENTID, SORTORDER , [URL], IconCss
			FROM SysMenus
			WHERE PARENTID IS NULL
			UNION ALL
			SELECT B.Id, B.NAME, B.PARENTID, B.SORTORDER , B.[URL], B.IconCss
			FROM TEMP AS A, SYSMENUS AS B
			WHERE A.ID = B.PARENTID
	)

	INSERT INTO @TBTEMP
	SELECT DISTINCT T.ID, T.NAME, T.PARENTID, T.SORTORDER , T.[URL], T.IconCss
	FROM TEMP T
	--LEFT JOIN SYSROLEMAPPING S ON T.CONTROLLER + 'CONTROLLER' = S.CONTROLLERID AND S.ACTIONID = 'INDEX' AND S.ROLEID = @USER
	--WHERE (S.ISALLOW = 1 AND PARENTID IS NOT NULL) OR PARENTID IS NULL
	
	SELECT A.ID, A.NAME, A.PARENTID, A.[SEQUENCE] , A.[URL], A.ICON
	FROM @TBTEMP A
	LEFT JOIN(
		SELECT PARENTID, COUNT(ID) NUM
		FROM @TBTEMP
		WHERE PARENTID IS NOT NULL
		GROUP BY PARENTID 
	) B ON A.ID = B.PARENTID
	--WHERE A.ISALLOW = 1 OR (A.PARENTID IS NULL AND NUM IS NOT NULL)
	ORDER BY A.PARENTID, A.[SEQUENCE]
	--[SP_GETMENU_VIA_MASTERMENU_USER]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_ATTACHMENT_GET]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NGUYEN NHAN NGHIA
-- Create date: 2017.12.24
-- Description:	LẤY LÊN DANH SÁCH FILE ĐÍNH KÈM
-- =============================================
create PROCEDURE [dbo].[SP_SYS_ATTACHMENT_GET]
	-- Add the parameters for the stored procedure here
	@MODULEID int = 1,
	@MASTERID INT = 8
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AttachId, ModuleId, MasterId, [FileName], FilePath, FileType, FileSize 
	FROM Attachment
	WHERE ModuleId = @MODULEID AND MasterId = @MASTERID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_ATTACHMENT_INSERT]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NGUYEN NHAN NGHIA
-- Create date: 2017.12.24
-- Description:	INSERT ATTACHMENT FILE
-- =============================================
CREATE PROCEDURE [dbo].[SP_SYS_ATTACHMENT_INSERT]
	-- Add the parameters for the stored procedure here
	@MODULEID int = '234DD956-CD7F-4870-A1D4-865857432084',
	@MASTERID INT = 12 ,
	@FILENAME NVARCHAR(500) = 'aa728f0a-525a-4a0a-8a44-e13da661d1e4.jpg',
	@FILEPATH NVARCHAR(500) = '../Resource/Application/Violation/aa728f0a-525a-4a0a-8a44-e13da661d1e4-20171224 114254.jpg',
	@FILETYPE VARCHAR(50) = 'image/jpeg',
	@FILESIZE INT = 2331438
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Attachments
	VALUES(@MODULEID, @MASTERID, @FILENAME, @FILEPATH, @FILETYPE, @FILESIZE)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_USER_LOGIN]    Script Date: 6/12/2019 5:09:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		NGUYEN NHAN NGHIA
-- Create date: 2017.11.01
-- Description:	KIỂM TRA THÔNG TIN KHI LOGIN
-- =============================================
CREATE PROCEDURE [dbo].[SP_SYS_USER_LOGIN]
	-- Add the parameters for the stored procedure here
	@USERID VARCHAR(20) = 'admin',
	@PASSWORD NVARCHAR(500) = 'Yc802gRUeM8=',
	@SYSTEM INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	
	SELECT E.UserId, E.UserName, ISNULL(E.Email, '') Email, E.[Image]
		, ISNULL(M.RoleId, '') RoleId, ISNULL(R.RoleName, '') RoleName, E.[Password]
		
	FROM SysUser E
	LEFT JOIN SysUserRoleMapping M ON E.UserId = M.UserId
	LEFT JOIN SysRoles R ON M.RoleId = R.RoleId
	WHERE 1=1
		AND E.UserId = @USERID AND E.Password = @PASSWORD

END
GO
USE [master]
GO
ALTER DATABASE [MotorHomepage] SET  READ_WRITE 
GO
