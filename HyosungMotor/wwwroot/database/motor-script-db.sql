USE [master]
GO
/****** Object:  Database [MotorHomepage]    Script Date: 7/12/2019 3:49:48 PM ******/
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
/****** Object:  User [motor]    Script Date: 7/12/2019 3:49:49 PM ******/
CREATE USER [motor] FOR LOGIN [motor] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [motor]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[BannerTranslations]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](30) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](300) NULL,
	[AddressURL] [varchar](200) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Code] [varchar](5) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[PublishedDate] [datetime] NULL,
	[CategoryId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[Status] [int] NOT NULL,
	[PublishStatus] [int] NOT NULL,
	[HasKo] [bit] NULL,
	[HasVi] [bit] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTranslations]    Script Date: 7/12/2019 3:49:49 PM ******/
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
	[Content] [ntext] NULL,
	[ImageCaption] [nvarchar](250) NULL,
 CONSTRAINT [PK_PostTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserDeleted] [varchar](20) NULL,
	[UserCreated] [varchar](20) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserModified] [varchar](20) NULL,
	[DateModified] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[PublishStatus] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTranslations]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](200) NULL,
	[Desc1] [nvarchar](200) NULL,
	[Desc2] [nvarchar](200) NULL,
	[Desc3] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProductTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCategories]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysCategoryValues]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysDictionnaries]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysMenus]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysRoleMapping]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysRoles]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysUser]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[SysUserRoleMapping]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  Table [dbo].[Td60HzMotor]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Td60HzMotor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kw] [varchar](50) NULL,
	[rpm] [varchar](50) NULL,
	[voltage] [varchar](50) NULL,
	[hz] [varchar](50) NULL,
	[Frame] [varchar](50) NULL,
	[Efficiency] [int] NULL,
	[DataSheet1] [varchar](50) NOT NULL,
	[DataSheet2] [varchar](50) NULL,
	[Outline1] [varchar](50) NULL,
	[OutLine2] [varchar](50) NULL,
 CONSTRAINT [PK_Td60HzMotor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TdStandardMotor]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TdStandardMotor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kw] [varchar](50) NULL,
	[rpm] [varchar](50) NULL,
	[voltage] [varchar](50) NULL,
	[hz] [varchar](50) NULL,
	[Frame] [varchar](50) NULL,
	[Efficiency] [int] NULL,
	[DataSheet1] [varchar](50) NOT NULL,
	[DataSheet2] [varchar](50) NULL,
	[Outline1] [varchar](50) NULL,
	[OutLine2] [varchar](50) NULL,
 CONSTRAINT [PK_TechnicalData] PRIMARY KEY CLUSTERED 
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
INSERT [dbo].[Languages] ([Id], [Name], [Code]) VALUES (1, N'English', N'en-US')
GO
INSERT [dbo].[Languages] ([Id], [Name], [Code]) VALUES (2, N'Korean', N'ko-KR')
GO
INSERT [dbo].[Languages] ([Id], [Name], [Code]) VALUES (3, N'Vietnamese', N'vi-VN')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 
GO
INSERT [dbo].[Posts] ([Id], [Thumbnail], [Image], [PublishedDate], [CategoryId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [HasKo], [HasVi]) VALUES (2, N'21', N'aa', CAST(N'2019-06-28T00:00:00.000' AS DateTime), NULL, 1, CAST(N'2019-07-11T14:47:20.297' AS DateTime), N'admin', N'admin', CAST(N'2019-06-28T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Posts] ([Id], [Thumbnail], [Image], [PublishedDate], [CategoryId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [HasKo], [HasVi]) VALUES (7, N'../wwwroot/Resource/Images/admin/20190711/4712245_Tinhte_Android2-144059.jpg', N'../wwwroot/Resource/Images/admin/20190711/4712244_Tinhte_Android1-144103.jpg', NULL, NULL, 1, CAST(N'2019-07-11T14:47:16.950' AS DateTime), N'admin', N'admin', CAST(N'2019-07-11T14:41:42.197' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Posts] ([Id], [Thumbnail], [Image], [PublishedDate], [CategoryId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [HasKo], [HasVi]) VALUES (8, N'../wwwroot/Resource/Images/admin/20190711/4712246_Tinhte_Android3-145109.jpg', N'../wwwroot/Resource/Images/admin/20190711/4712427_Cover-145113.jpg', NULL, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-11T14:51:16.093' AS DateTime), N'admin', CAST(N'2019-07-12T08:53:31.247' AS DateTime), 1, 2, 1, 0)
GO
INSERT [dbo].[Posts] ([Id], [Thumbnail], [Image], [PublishedDate], [CategoryId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [HasKo], [HasVi]) VALUES (9, N'../wwwroot/Resource/Images/admin/20190711/4713012_Cover_5_model_ipad_tinhte-182105.jpg', N'../wwwroot/Resource/Images/admin/20190711/4712850_Apple-New-iPads-A2068-182114.jpg', NULL, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-11T15:21:49.210' AS DateTime), N'admin', CAST(N'2019-07-11T18:21:15.803' AS DateTime), 1, 2, 0, 1)
GO
INSERT [dbo].[Posts] ([Id], [Thumbnail], [Image], [PublishedDate], [CategoryId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [PublishStatus], [HasKo], [HasVi]) VALUES (10, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-12T15:44:22.277' AS DateTime), NULL, NULL, 1, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[PostTranslations] ON 
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (1, 1, 2, N'eee', N'rrr', N'eee', N'323')
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (2, 2, 2, N'ddd', N'dd', N'dd', N'dd')
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (3, 3, 2, N'ff', N'ff', N'ff', N'ff')
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (16, 1, 7, N'as', N'as as', N'<p>as&nbsp;</p>
', N'as')
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (17, 2, 7, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (18, 3, 7, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (46, 1, 9, N'Apple will launch 5 new iPad models?', N'According to documents from the Eurasian Trade Commission (EEC), there will be five new iPad models to be released this year with code names A2068, A2198, A2230, A2197, and A2228 respectively. Since this is information sent by Apple and must be via ECC to', N'<p>According to documents from the Eurasian Trade Commission (EEC), there will be five new iPad models to be released this year with code names A2068, A2198, A2230, A2197, and A2228 respectively. Since this is information sent by Apple and must be passed through ECC to be sold in a number of countries, it will be quite important.</p>

<p>The noteworthy point is that there will be a 10.5 &quot;iPad and a 7th generation iPad with 10.2&quot; size, new design and thinner borders. Thereby all 5 iPad models run on the latest iPadOS platform, so it is likely to be released around or after September.</p>

<p><img alt="" src="/wwwroot/Resource/UploadImage/images/4712850_Apple-New-iPads-A2068.jpg" style="height:578px; width:800px" /></p>

<p style="text-align:right"><strong><em>Tham khảo<a href="https://www.macrumors.com/2019/07/10/five-new-ipad-models-ipados-eurasian/" target="_blank">&nbsp;macrumors</a></em></strong>​</p>
', NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (47, 2, 9, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (48, 3, 9, N'Apple sẽ ra mắt 5 model iPad mới?', N'Theo giấy tờ của Ủy ban thương mại Eurasian (EEC) cho thấy sẽ có 5 mẫu iPad mới sẽ được ra mắt trong năm nay có tên mã lần lượt A2068, A2198, A2230, A2197, và A2228. Vì đây là thông tin của Apple gửi và phải thông qua ECC mới được bán ra trên một số quốc', N'<p>Theo giấy tờ của Ủy ban thương mại Eurasian (EEC) cho thấy sẽ c&oacute; 5 mẫu&nbsp;<a href="https://tinhte.vn/tags/ipad-moi/" title="">iPad mới</a>&nbsp;sẽ được ra mắt trong năm nay c&oacute; t&ecirc;n m&atilde; lần lượt A2068, A2198, A2230, A2197, v&agrave; A2228. V&igrave; đ&acirc;y l&agrave; th&ocirc;ng tin của&nbsp;<a href="https://tinhte.vn/tags/apple/" title="">Apple</a>&nbsp;gửi v&agrave; phải th&ocirc;ng qua ECC mới được b&aacute;n ra tr&ecirc;n một số quốc gia n&ecirc;n sẽ kh&aacute; quan trọng.<br />
<br />
Điểm đ&aacute;ng ch&uacute; &yacute; sẽ c&oacute; một chiếc&nbsp;<a href="https://tinhte.vn/ipad/" title="">iPad</a>&nbsp;k&iacute;ch thước 10.5&quot; v&agrave; iPad thế hệ thứ 7 với k&iacute;ch thước 10.2&quot;, thiết kế mới v&agrave; viền mỏng hơn. Qua đ&oacute; cả 5 mẫu iPad đều chạy tr&ecirc;n nền tảng&nbsp;<a href="https://tinhte.vn/tags/ipados/" title="">iPadOS</a>&nbsp;mới nhất, như vậy nhiều khả năng c&oacute; thể sẽ ra mắt khoảng trong hoặc sau th&aacute;ng 9.</p>
', NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (55, 1, 8, N'25 million Android devices infected with Chinese malware', N'According to documents from the Eurasian Trade Commission (EEC), there will be five new iPad models to be released this year with code names A2068, A2198, A2230, A2197, and A2228 respectively. Since this is information sent by Apple and must be via ECC to', N'<p>According to Israel&#39;s Check Point security company, a malware called Agent Smith is affecting about 25 million smartphones running Android. This malicious code takes advantage of a security hole of Android, which makes updating the latest version of Android OS on phones a top priority. After infecting the phone, Agent Smith will automatically install fake versions of applications like WhatsApp, and show ads to the point of annoying users.</p>

<p><img alt="" src="/wwwroot/Resource/UploadImage/images/4712244_Tinhte_Android1.jpg" style="height:451px; width:800px" /></p>

<p>Most of Agent Smith&#39;s victims are Android smartphone users in India, according to Check Point estimates, about 15 million phones in this country are infected with malware. Meanwhile in the US, there are about 300 thousand Agent Smith infections, 137,000 machines in the United Kingdom. This number makes Agent Smith malware one of the most serious security risks that Android faces.</p>

<p>This malware is distributed through 9apps.com application market, which is owned by Alibaba. Typically, malicious code distributed through non-Google Play Store markets is usually targeted at developing countries. This makes hundreds of thousands of Android smartphones in the United States and the UK infected with Agent Smith, making it worrying and effective prevention.</p>

<p><img alt="" src="/wwwroot/Resource/UploadImage/images/4712245_Tinhte_Android2.jpg" style="height:451px; width:800px" /></p>

<p>At the present time, Agent Smith has only made the phone available to advertise, but it can be taken advantage of to make things worse. &quot;Because of the ability to hide application icons from the launcher and forge any popular applications on the device, there are almost a lot of ways hackers can use this malware to harm users of the device.&quot;</p>

<p>Most of the time, malware installs on the device when users install applications on 3rd party app markets. Then this application will silently install malicious code into the phone, fake the update tool. Google&#39;s software to bypass the system. Even Check Point found that hackers are intending to bring malicious code applications to Play Store to make more phones infected with malware, when they discovered 11 applications that have &quot;traces&quot; of hackers. Google has removed these applications from their Play Store.</p>

<p><img alt="" src="/wwwroot/Resource/UploadImage/images/4712246_Tinhte_Android3.jpg" style="height:450px; width:800px" /></p>

<p>Check Point tin rằng một c&ocirc;ng ty c&oacute; trụ sở tại Quảng Ch&acirc;u l&agrave; t&aacute;c giả của Agent Smith, gi&uacute;p những nh&agrave; ph&aacute;t triển ứng dụng Android tại&nbsp;<a href="https://tinhte.vn/tags/trung-quoc/" title="">Trung Quốc</a>&nbsp;quảng c&aacute;o một c&aacute;ch tr&aacute;i ph&eacute;p sản phẩm của họ tr&ecirc;n c&aacute;c smartphone.<br />
<br />
C&oacute; một c&aacute;ch tương đối đơn giản để tr&aacute;nh việc nhiễm những malware n&agrave;y trong smartphone của anh em. Đầu ti&ecirc;n h&atilde;y v&agrave;o Settings của điện thoại, t&igrave;m đến mục Apps and Notifications. Kế đến t&igrave;m kiếm trong danh s&aacute;ch những ứng dụng đ&atilde; c&agrave;i trong điện thoại v&agrave; t&igrave;m những ứng dụng c&oacute; c&aacute;i t&ecirc;n khả nghi như Google Updater, Google Installer For U, Google Powers hay Google Installer. Đ&oacute; l&agrave; giải ph&aacute;p nếu anh em v&ocirc; t&igrave;nh thấy quảng c&aacute;o hiện l&ecirc;n ở thời điểm kỳ lạ, c&ograve;n tốt nhất l&agrave; h&atilde;y tr&aacute;nh những chợ ứng dụng của c&aacute;c b&ecirc;n thứ 3, m&agrave; thay v&agrave;o đ&oacute; h&atilde;y tin tưởng Play Store khi c&agrave;i đặt ứng dụng mới.<br />
&nbsp;</p>

<p style="text-align:right"><em>Theo&nbsp;<a href="https://www.forbes.com/sites/thomasbrewster/2019/07/10/25-million-android-phones-infected-with-malware-that-hides-in-whatsapp/#77d9122a4470" target="_blank">Forbes</a></em>​</p>
', NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (56, 2, 8, N'25 triệu máy Android nhiễm malware của Trung Quốc, giả mạo nhiều ứng dụng nổi tiếng', N'Theo công ty bảo mật Check Point của Israel, một malware có tên Agent Smith đang khiến cỡ 25 triệu chiếc smartphone chạy Android bị ảnh hưởng. Mã độc này lợi dụng một lỗ hổng bảo mật của Android, vốn là tính năng giúp cho việc cập nhật phiên bản mới nhất', NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (57, 3, 8, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (58, 1, 10, N'a', N'a', N'<p>According to documents from the Eurasian Trade Commission (EEC), there will be five new iPad models to be released this year with code names A2068, A2198, A2230, A2197, and A2228 respectively. Since this is information sent by Apple and must be passed through ECC to be sold in a number of countries, it will be quite important.</p>

<p>The noteworthy point is that there will be a 10.5 &quot;iPad and a 7th generation iPad with 10.2&quot; size, new design and thinner borders. Thereby all 5 iPad models run on the latest iPadOS platform, so it is likely to be released around or after September.</p>

<p><img alt="" src="/wwwroot/Resource/UploadImage/images/4712850_Apple-New-iPads-A2068.jpg" style="height:578px; width:800px" /></p>

<p style="text-align:right"><strong><em>Tham khảo<a href="https://www.macrumors.com/2019/07/10/five-new-ipad-models-ipados-eurasian/" target="_blank">&nbsp;macrumors</a></em></strong>​</p>
', NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (59, 2, 10, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PostTranslations] ([Id], [LanguageId], [PostId], [Title], [Description], [Content], [ImageCaption]) VALUES (60, 3, 10, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PostTranslations] OFF
GO
SET IDENTITY_INSERT [dbo].[SysCategories] ON 
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (5, N'Banner', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (6, N'System', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (7, N'Module', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[SysCategories] ([Id], [Name], [Remark], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status]) VALUES (8, N'Energy Eefficiency', NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL, NULL, 1)
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
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (5, N'IE1', NULL, 8, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (6, N'IE2', NULL, 8, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[SysCategoryValues] ([Id], [Name], [DictionaryId], [CategoryId], [ParentId], [IsDeleted], [DateDeleted], [UserDeleted], [UserCreated], [DateCreated], [UserModified], [DateModified], [Status], [SortOrder]) VALUES (7, N'IE3', NULL, 8, NULL, 0, NULL, NULL, N'admin', CAST(N'2019-07-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
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
INSERT [dbo].[SysMenus] ([Id], [DictionaryId], [System], [Name], [URL], [ParentId], [IconCss], [SortOrder], [Status], [DateCreated], [UserCreated], [DateDeleted], [UserDeleted], [UserModified], [DateModified], [IsDeleted]) VALUES (N'Banner', 2, 1, N'Banner Mangement', N'/Admin/Banner/Index', N'System', N'fa fa-thumbs-up', 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysMenus] ([Id], [DictionaryId], [System], [Name], [URL], [ParentId], [IconCss], [SortOrder], [Status], [DateCreated], [UserCreated], [DateDeleted], [UserDeleted], [UserModified], [DateModified], [IsDeleted]) VALUES (N'Post', NULL, 1, N'Post Management', N'/Admin/Post/Index', N'System', N'fa fa-newspaper', 2, 0, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, 0)
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
SET IDENTITY_INSERT [dbo].[Td60HzMotor] ON 
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (1, N'0.75', N'3600(2P)', N'220-380', N'60', N'80M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (2, N'0.75', N'1800(4P)', N'220-380', N'60', N'80M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (3, N'0.75', N'1200(6P)', N'220-380', N'60', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (4, N'1.5', N'3600(2P)', N'220-380', N'60', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (5, N'1.5', N'1800(4P)', N'220-380', N'60', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (6, N'1.5', N'1200(6P)', N'220-380', N'60', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (7, N'2.2', N'3600(2P)', N'220-380', N'60', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (8, N'2.2', N'1800(4P)', N'220-380', N'60', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (9, N'2.2', N'1200(6P)', N'220-380', N'60', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (10, N'4 (3.7)', N'3600(2P)', N'380', N'60', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (11, N'4 (3.7)', N'1800(4P)', N'380', N'60', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (12, N'4 (3.7)', N'1200(6P)', N'380', N'60', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (13, N'5.5', N'3600(2P)', N'380', N'60', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (14, N'5.5', N'1800(4P)', N'380', N'60', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (15, N'5.5', N'1200(6P)', N'380', N'60', N'132M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (16, N'7.5', N'3600(2P)', N'380', N'60', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (17, N'7.5', N'1800(4P)', N'380', N'60', N'132M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (18, N'7.5', N'1200(6P)', N'380', N'60', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (19, N'11', N'3600(2P)', N'380', N'60', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (20, N'11', N'1800(4P)', N'380', N'60', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (21, N'11', N'1200(6P)', N'380', N'60', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (22, N'15', N'3600(2P)', N'380', N'60', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (23, N'15', N'1800(4P)', N'380', N'60', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (24, N'15', N'1200(6P)', N'380', N'60', N'180M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (25, N'18.5', N'3600(2P)', N'380', N'60', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (26, N'18.5', N'1800(4P)', N'380', N'60', N'180M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[Td60HzMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (27, N'18.5', N'1200(6P)', N'380', N'60', N'180L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
SET IDENTITY_INSERT [dbo].[Td60HzMotor] OFF
GO
SET IDENTITY_INSERT [dbo].[TdStandardMotor] ON 
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (1, N'0.75', N'3000(2P)', N'220-380', N'50', N'80M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (2, N'0.75', N'1500(4P)', N'220-380', N'50', N'80M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (3, N'0.75', N'1000(6P)', N'220-380', N'50', N'90S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (4, N'1.1', N'3000(2P)', N'220-380', N'50', N'80M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (5, N'1.1', N'1500(4P)', N'220-380', N'50', N'90S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (6, N'1.1', N'1000(6P)', N'220-380', N'50', N'90L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (7, N'1.5', N'3000(2P)', N'220-380', N'50', N'90S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (8, N'1.5', N'1500(4P)', N'220-380', N'50', N'90L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (9, N'1.5', N'1000(6P)', N'220-380', N'50', N'100L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (10, N'2.2', N'3000(2P)', N'220-380', N'50', N'90L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (11, N'2.2', N'1500(4P)', N'220-380', N'50', N'100L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (12, N'2.2', N'1000(6P)', N'220-380', N'50', N'112M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (13, N'3', N'3000(2P)', N'380', N'50', N'100L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (14, N'3', N'1500(4P)', N'380', N'50', N'100L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (15, N'3', N'1000(6P)', N'380', N'50', N'132S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (16, N'4', N'3000(2P)', N'380', N'50', N'112M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (17, N'4', N'1500(4P)', N'380', N'50', N'112M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (18, N'4', N'1000(6P)', N'380', N'50', N'132M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (19, N'5.5', N'3000(2P)', N'380', N'50', N'132S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (20, N'5.5', N'1500(4P)', N'380', N'50', N'132S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (21, N'5.5', N'1000(6P)', N'380', N'50', N'132M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (22, N'7.5', N'3000(2P)', N'380', N'50', N'132S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (23, N'7.5', N'1500(4P)', N'380', N'50', N'132M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (24, N'7.5', N'1000(6P)', N'380', N'50', N'160M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (25, N'11', N'3000(2P)', N'380', N'50', N'160M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (26, N'11', N'1500(4P)', N'380', N'50', N'160M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (27, N'11', N'1000(6P)', N'380', N'50', N'160L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (28, N'15', N'3000(2P)', N'380', N'50', N'160M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (29, N'15', N'1500(4P)', N'380', N'50', N'160L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (30, N'15', N'1000(6P)', N'380', N'50', N'180L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (31, N'18.5', N'3000(2P)', N'380', N'50', N'160L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (32, N'18.5', N'1500(4P)', N'380', N'50', N'180M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (33, N'18.5', N'1000(6P)', N'380', N'50', N'200L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (34, N'22', N'3000(2P)', N'380', N'50', N'180M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (35, N'22', N'1500(4P)', N'380', N'50', N'180L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (36, N'22', N'1000(6P)', N'380', N'50', N'200L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (37, N'30', N'3000(2P)', N'380', N'50', N'200L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (38, N'30', N'1500(4P)', N'380', N'50', N'200L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (39, N'30', N'1000(6P)', N'380', N'50', N'225M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (40, N'37', N'3000(2P)', N'380', N'50', N'200L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (41, N'37', N'1500(4P)', N'380', N'50', N'225S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (42, N'37', N'1000(6P)', N'380', N'50', N'250M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (43, N'45', N'3000(2P)', N'380', N'50', N'225M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (44, N'45', N'1500(4P)', N'380', N'50', N'225M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (45, N'45', N'1000(6P)', N'380', N'50', N'280S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (46, N'55', N'3000(2P)', N'380', N'50', N'250M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (47, N'55', N'1500(4P)', N'380', N'50', N'250M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (48, N'55', N'1000(6P)', N'380', N'50', N'280M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (49, N'75', N'3000(2P)', N'380', N'50', N'280S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (50, N'75', N'1500(4P)', N'380', N'50', N'280S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (51, N'75', N'1000(6P)', N'380', N'50', N'315S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (52, N'90', N'3000(2P)', N'380', N'50', N'280M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (53, N'90', N'1500(4P)', N'380', N'50', N'280M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (54, N'90', N'1000(6P)', N'380', N'50', N'315M', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (55, N'110', N'3000(2P)', N'380', N'50', N'315S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (56, N'110', N'1500(4P)', N'380', N'50', N'315S', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (57, N'110', N'1000(6P)', N'380', N'50', N'315L', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (58, N'132', N'3000(2P)', N'380', N'50', N'315M ', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (59, N'132', N'1500(4P)', N'380', N'50', N'315M ', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (60, N'132', N'1000(6P)', N'380', N'50', N'315L ', 0, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (61, N'0.75', N'3000(2P)', N'220-380', N'50', N'80M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (62, N'0.75', N'1500(4P)', N'220-380', N'50', N'80M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (63, N'0.75', N'1000(6P)', N'220-380', N'50', N'90S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (64, N'1.1', N'3000(2P)', N'220-380', N'50', N'80M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (65, N'1.1', N'1500(4P)', N'220-380', N'50', N'90S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (66, N'1.1', N'1000(6P)', N'220-380', N'50', N'90L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (67, N'1.5', N'3000(2P)', N'220-380', N'50', N'90S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (68, N'1.5', N'1500(4P)', N'220-380', N'50', N'90L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (69, N'1.5', N'1000(6P)', N'220-380', N'50', N'100L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (70, N'2.2', N'3000(2P)', N'220-380', N'50', N'90L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (71, N'2.2', N'1500(4P)', N'220-380', N'50', N'100L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (72, N'2.2', N'1000(6P)', N'220-380', N'50', N'112M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (73, N'3', N'3000(2P)', N'380', N'50', N'100L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (74, N'3', N'1500(4P)', N'380', N'50', N'100L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (75, N'3', N'1000(6P)', N'380', N'50', N'132S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (76, N'4', N'3000(2P)', N'380', N'50', N'112M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (77, N'4', N'1500(4P)', N'380', N'50', N'112M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (78, N'4', N'1000(6P)', N'380', N'50', N'132M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (79, N'5.5', N'3000(2P)', N'380', N'50', N'132S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (80, N'5.5', N'1500(4P)', N'380', N'50', N'132S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (81, N'5.5', N'1000(6P)', N'380', N'50', N'132M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (82, N'7.5', N'3000(2P)', N'380', N'50', N'132S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (83, N'7.5', N'1500(4P)', N'380', N'50', N'132M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (84, N'7.5', N'1000(6P)', N'380', N'50', N'160M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (85, N'11', N'3000(2P)', N'380', N'50', N'160M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (86, N'11', N'1500(4P)', N'380', N'50', N'160M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (87, N'11', N'1000(6P)', N'380', N'50', N'160L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (88, N'15', N'3000(2P)', N'380', N'50', N'160M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (89, N'15', N'1500(4P)', N'380', N'50', N'160L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (90, N'15', N'1000(6P)', N'380', N'50', N'180L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (91, N'18.5', N'3000(2P)', N'380', N'50', N'160L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (92, N'18.5', N'1500(4P)', N'380', N'50', N'180M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (93, N'18.5', N'1000(6P)', N'380', N'50', N'200L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (94, N'22', N'3000(2P)', N'380', N'50', N'180M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (95, N'22', N'1500(4P)', N'380', N'50', N'180L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (96, N'22', N'1000(6P)', N'380', N'50', N'200L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (97, N'30', N'3000(2P)', N'380', N'50', N'200L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (98, N'30', N'1500(4P)', N'380', N'50', N'200L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (99, N'30', N'1000(6P)', N'380', N'50', N'225M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (100, N'37', N'3000(2P)', N'380', N'50', N'200L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (101, N'37', N'1500(4P)', N'380', N'50', N'225S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (102, N'37', N'1000(6P)', N'380', N'50', N'250M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (103, N'45', N'3000(2P)', N'380', N'50', N'225M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (104, N'45', N'1500(4P)', N'380', N'50', N'225M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (105, N'45', N'1000(6P)', N'380', N'50', N'280S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (106, N'55', N'3000(2P)', N'380', N'50', N'250M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (107, N'55', N'1500(4P)', N'380', N'50', N'250M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (108, N'55', N'1000(6P)', N'380', N'50', N'280M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (109, N'75', N'3000(2P)', N'380', N'50', N'280S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (110, N'75', N'1500(4P)', N'380', N'50', N'280S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (111, N'75', N'1000(6P)', N'380', N'50', N'315S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (112, N'90', N'3000(2P)', N'380', N'50', N'280M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (113, N'90', N'1500(4P)', N'380', N'50', N'280M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (114, N'90', N'1000(6P)', N'380', N'50', N'315M', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (115, N'110', N'3000(2P)', N'380', N'50', N'315S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (116, N'110', N'1500(4P)', N'380', N'50', N'315S', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (117, N'110', N'1000(6P)', N'380', N'50', N'315L', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (118, N'132', N'3000(2P)', N'380', N'50', N'315M ', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (119, N'132', N'1500(4P)', N'380', N'50', N'315M ', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (120, N'132', N'1000(6P)', N'380', N'50', N'315L ', 1, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (121, N'0.75', N'3000(2P)', N'220-380', N'50', N'80M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (122, N'0.75', N'1500(4P)', N'220-380', N'50', N'80M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (123, N'0.75', N'1000(6P)', N'220-380', N'50', N'90S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (124, N'1.1', N'3000(2P)', N'220-380', N'50', N'80M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (125, N'1.1', N'1500(4P)', N'220-380', N'50', N'90S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (126, N'1.1', N'1000(6P)', N'220-380', N'50', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (127, N'1.5', N'3000(2P)', N'220-380', N'50', N'90S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (128, N'1.5', N'1500(4P)', N'220-380', N'50', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (129, N'1.5', N'1000(6P)', N'220-380', N'50', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (130, N'2.2', N'3000(2P)', N'220-380', N'50', N'90L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (131, N'2.2', N'1500(4P)', N'220-380', N'50', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (132, N'2.2', N'1000(6P)', N'220-380', N'50', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (133, N'3', N'3000(2P)', N'380', N'50', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (134, N'3', N'1500(4P)', N'380', N'50', N'100L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (135, N'3', N'1000(6P)', N'380', N'50', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (136, N'4', N'3000(2P)', N'380', N'50', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (137, N'4', N'1500(4P)', N'380', N'50', N'112M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (138, N'4', N'1000(6P)', N'380', N'50', N'132M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (139, N'5.5', N'3000(2P)', N'380', N'50', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (140, N'5.5', N'1500(4P)', N'380', N'50', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (141, N'5.5', N'1000(6P)', N'380', N'50', N'132M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (142, N'7.5', N'3000(2P)', N'380', N'50', N'132S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (143, N'7.5', N'1500(4P)', N'380', N'50', N'132M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (144, N'7.5', N'1000(6P)', N'380', N'50', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (145, N'11', N'3000(2P)', N'380', N'50', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (146, N'11', N'1500(4P)', N'380', N'50', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (147, N'11', N'1000(6P)', N'380', N'50', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (148, N'15', N'3000(2P)', N'380', N'50', N'160M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (149, N'15', N'1500(4P)', N'380', N'50', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (150, N'15', N'1000(6P)', N'380', N'50', N'180L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (151, N'18.5', N'3000(2P)', N'380', N'50', N'160L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (152, N'18.5', N'1500(4P)', N'380', N'50', N'180M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (153, N'18.5', N'1000(6P)', N'380', N'50', N'200L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (154, N'22', N'3000(2P)', N'380', N'50', N'180M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (155, N'22', N'1500(4P)', N'380', N'50', N'180L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (156, N'22', N'1000(6P)', N'380', N'50', N'200L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (157, N'30', N'3000(2P)', N'380', N'50', N'200L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (158, N'30', N'1500(4P)', N'380', N'50', N'200L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (159, N'30', N'1000(6P)', N'380', N'50', N'225M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (160, N'37', N'3000(2P)', N'380', N'50', N'200L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (161, N'37', N'1500(4P)', N'380', N'50', N'225S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (162, N'37', N'1000(6P)', N'380', N'50', N'250M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (163, N'45', N'3000(2P)', N'380', N'50', N'225M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (164, N'45', N'1500(4P)', N'380', N'50', N'225M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (165, N'45', N'1000(6P)', N'380', N'50', N'280S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (166, N'55', N'3000(2P)', N'380', N'50', N'250M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (167, N'55', N'1500(4P)', N'380', N'50', N'250M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (168, N'55', N'1000(6P)', N'380', N'50', N'280M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (169, N'75', N'3000(2P)', N'380', N'50', N'280S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (170, N'75', N'1500(4P)', N'380', N'50', N'280S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (171, N'75', N'1000(6P)', N'380', N'50', N'315S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (172, N'90', N'3000(2P)', N'380', N'50', N'280M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (173, N'90', N'1500(4P)', N'380', N'50', N'280M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (174, N'90', N'1000(6P)', N'380', N'50', N'315M', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (175, N'110', N'3000(2P)', N'380', N'50', N'315S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (176, N'110', N'1500(4P)', N'380', N'50', N'315S', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (177, N'110', N'1000(6P)', N'380', N'50', N'315L', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (178, N'132', N'3000(2P)', N'380', N'50', N'315M ', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (179, N'132', N'1500(4P)', N'380', N'50', N'315M ', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
INSERT [dbo].[TdStandardMotor] ([Id], [kw], [rpm], [voltage], [hz], [Frame], [Efficiency], [DataSheet1], [DataSheet2], [Outline1], [OutLine2]) VALUES (180, N'132', N'1000(6P)', N'380', N'50', N'315L ', 2, N'Foot', N'Flange', N'Foot', N'Flange')
GO
SET IDENTITY_INSERT [dbo].[TdStandardMotor] OFF
GO
ALTER TABLE [dbo].[Banners] ADD  CONSTRAINT [DF_Banners_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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
ALTER TABLE [dbo].[ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Languages]
GO
ALTER TABLE [dbo].[ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Products]
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
/****** Object:  StoredProcedure [dbo].[SP_BANNER_GETALL]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_BANNER_INSERT]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_BANNER_UPDATE]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GETMENU]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_POST_GETALL]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_POST_GETALL]
	-- Add the parameters for the stored procedure here
	-- Add the parameters for the stored procedure here
	@pageIndex int = 1,
	@pageSize int = 1,
	@keyword nvarchar(128) = NULL,
	@totalRow int = null output,
	@languageId int = NULL--en,ko,vi
AS
BEGIN
	SET NOCOUNT ON;
	IF @languageId IS NULL SET @languageId = 1
	SELECT @totalRow = COUNT(1) 
	FROM Posts P
	LEFT JOIN PostTranslations T ON P.Id = T.PostId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Id = @languageId
	WHERE 1=1
		AND P.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		AND (@keyword IS NULL OR (T.Title LIKE '%'+@keyword+'%' OR T.Description LIKE '%'+@keyword+'%'))
	-- Insert statements for procedure here
	SELECT P.Id, T.Title, T.[Description], T.Content, P.DateCreated, U.UserName UserCreate
		,P.DateModified, C.UserName UserModified, P.[Status], P.PublishStatus, HasKo, HasVi
	FROM Posts P
	LEFT JOIN PostTranslations T ON P.Id = T.PostId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Id = @languageId
	LEFT JOIN SysUser U ON U.UserId = P.UserCreated
	LEFT JOIN SysUser C ON P.UserModified = C.UserId
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	--LEFT JOIN BannerVis C ON A.Id = C.MasterId
	WHERE 1=1
		AND P.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		AND (@keyword IS NULL OR (T.Title LIKE '%'+@keyword+'%' OR T.Description LIKE '%'+@keyword+'%'))

	ORDER BY P.DateCreated DESC
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	OFFSET (@pageIndex - 1) * @pageSize rows
	FETCH NEXT @pageSize row only

END
GO
/****** Object:  StoredProcedure [dbo].[SP_POST_GETTOP2]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_POST_GETTOP2]
	-- Add the parameters for the stored procedure here
	-- Add the parameters for the stored procedure here
	@languageCode varchar(5) = 'vi-VN',--en,ko,vi
	@UserId varchar(20) = 'admin'
AS
BEGIN
	SET NOCOUNT ON;
	IF @languageCode IS NULL OR @languageCode = '' SET @languageCode = 'en-US'
	
	-- Insert statements for procedure here
	SELECT TOP 2 P.Id, ISNULL(T.Title, D.Title) Title, ISNULL(T.[Description], D.[Description]) [Description], P.DateCreated, U.UserName UserCreate, P.Thumbnail
	FROM Posts P
	--LAY LEN NGON NGU MAC DINH LA TIENG ANH
	LEFT JOIN PostTranslations D ON D.PostId = P.Id AND D.LanguageId = 1
	LEFT JOIN PostTranslations T ON P.Id = T.PostId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Code = @languageCode
	LEFT JOIN SysUser U ON U.UserId = P.UserCreated
	WHERE 1=1
		AND P.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		--NEU USER LA ADMIN THI LAY LEN NHUNG BAI POST DANG LA PENDING REVIEW
		AND ((@UserId = 'admin' AND (PublishStatus = 1 OR PublishStatus = 2)) OR (@UserId IS NULL AND PublishStatus = 2))
	ORDER BY P.DateCreated DESC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_POST_GETTOP2_DETAIL]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_POST_GETTOP2_DETAIL]
	-- Add the parameters for the stored procedure here
	-- Add the parameters for the stored procedure here
	@Id int = 8,
	@languageCode varchar(5) = 'vi-VN'--en,ko,vi
AS
BEGIN
	SET NOCOUNT ON;
	IF @languageCode IS NULL OR @languageCode = '' SET @languageCode = 'en-US'
	
	-- Insert statements for procedure here
	SELECT TOP 2 P.Id, ISNULL(T.Title, D.Title) Title, ISNULL(T.[Description], D.[Description]) [Description], 
		P.DateCreated, U.UserName UserCreate, P.Thumbnail, ISNULL(T.Content, D.Content) Content
	FROM Posts P
	--LAY LEN NGON NGU MAC DINH LA TIENG ANH
	LEFT JOIN PostTranslations D ON D.PostId = P.Id AND D.LanguageId = 1
	LEFT JOIN PostTranslations T ON P.Id = T.PostId
	INNER JOIN Languages L ON T.LanguageId = L.Id AND L.Code = @languageCode
	LEFT JOIN SysUser U ON U.UserId = P.UserCreated
	WHERE 1=1
		AND P.Status = 1 AND ISNULL(IsDeleted, 0) = 0
		AND P.Id = @Id
	ORDER BY P.DateCreated DESC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_POST_INSERT]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[SP_POST_INSERT]
	-- Add the parameters for the stored procedure here
	@title nvarchar (255),
    @description nvarchar(255),
    @content ntext,
    @thumbnail nvarchar(250),
    @image nvarchar(250),
    @imageCaption nvarchar(255),
    @userCreated varchar (20),
    @status int,
    @sublishStatus int,

	@titleKor nvarchar (255) = null,
    @descriptionKor nvarchar(255) = null,
    @contentKor ntext = null,
    @imageCaptionKor nvarchar(255) = null,

	@titleVi nvarchar (255) = null,
    @descriptionVi nvarchar(255) = null,
    @contentVi ntext = null,
    @imageCaptionVi nvarchar(255) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @HASKO BIT = 0, @HASVI BIT = 0
	IF(@titleKor IS NOT NULL OR @descriptionKor IS NOT NULL OR @contentKor IS NOT NULL OR @imageCaptionKor IS NOT NULL)
		SET @HASKO = 1

	IF(@titleVi IS NOT NULL OR @descriptionVi IS NOT NULL OR @contentVi IS NOT NULL OR @imageCaptionVi IS NOT NULL)
		SET @HASVI = 1

	DECLARE @ID INT = 0
    -- Insert statements for procedure here
	INSERT INTO Posts(Thumbnail,[Image],UserCreated, DateCreated, [Status], PublishStatus, HasKo, HasVi)
	VALUES(@thumbnail, @image, @userCreated, GETDATE(), @status, @sublishStatus, @HASKO, @HASVI)

	--LAY RA ID VUA MOI THEM
	SET @ID = SCOPE_IDENTITY()

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(1, @ID, @title, @description, @content, @imageCaption)

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(2, @ID, @titleKor, @descriptionKor, @contentKor, @imageCaptionKor)

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(3, @ID, @titleVi, @descriptionVi, @contentVi, @imageCaptionVi)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_POST_UPDATE]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_POST_UPDATE]
	-- Add the parameters for the stored procedure here
	@id int,
	@title nvarchar (255),
    @description nvarchar(255),
    @content ntext,
    @thumbnail nvarchar(250),
    @image nvarchar(250),
    @imageCaption nvarchar(255),
    @userCreated varchar (20),
    @status int,
    @sublishStatus int,

	@titleKor nvarchar (255) = null,
    @descriptionKor nvarchar(255) = null,
    @contentKor ntext = null,
    @imageCaptionKor nvarchar(255) = null,

	@titleVi nvarchar (255) = null,
    @descriptionVi nvarchar(255) = null,
    @contentVi ntext = null,
    @imageCaptionVi nvarchar(255) = null
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @HASKO BIT = 0, @HASVI BIT = 0
	IF(@titleKor IS NOT NULL OR @descriptionKor IS NOT NULL OR @contentKor IS NOT NULL OR @imageCaptionKor IS NOT NULL)
		SET @HASKO = 1

	IF(@titleVi IS NOT NULL OR @descriptionVi IS NOT NULL OR @contentVi IS NOT NULL OR @imageCaptionVi IS NOT NULL)
		SET @HASVI = 1

	UPDATE Posts
	SET [Image] = @image, 
		Thumbnail = @thumbnail, 
		[Status] = @status, 
		PublishStatus =  @sublishStatus,
		DateModified = GETDATE(), 
		UserModified = @userCreated,
		HasKo = @HASKO,
		HasVi = @HASVI
	WHERE Id = @id

	DELETE PostTranslations WHERE PostId = @id

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(1, @ID, @title, @description, @content, @imageCaption)

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(2, @ID, @titleKor, @descriptionKor, @contentKor, @imageCaptionKor)

	INSERT INTO PostTranslations (LanguageId,PostId ,Title, [Description], Content, ImageCaption)
	VALUES(3, @ID, @titleVi, @descriptionVi, @contentVi, @imageCaptionVi)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_ATTACHMENT_GET]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SYS_ATTACHMENT_INSERT]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SYS_USER_LOGIN]    Script Date: 7/12/2019 3:49:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TD60HZMOTOR_GETALL]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TD60HZMOTOR_GETALL]
	-- Add the parameters for the stored procedure here
	@pageIndex int = 1,
	@pageSize int = 1,
	@efficiency int = 0,
	@totalRow int = null output,
	@languageId int = NULL--en,ko,vi
AS
BEGIN
	SET NOCOUNT ON;
	IF @languageId IS NULL SET @languageId = 1
	SELECT @totalRow = COUNT(1) 
	FROM TdStandardMotor A
	WHERE 1=1
		AND Efficiency = @efficiency
    -- Insert statements for procedure here
	SELECT A.Id, A.kw, A.rpm, A.voltage, A.hz, A.Frame, A.Efficiency, A.DataSheet1, A.DataSheet2, A.Outline1, A.OutLine2
	FROM TdStandardMotor A
	WHERE 1=1
		AND Efficiency = @efficiency

	ORDER BY A.Id
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	OFFSET (@pageIndex - 1) * @pageSize rows
	FETCH NEXT @pageSize row only
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TDSTANDARDMOTOR_GETALL]    Script Date: 7/12/2019 3:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TDSTANDARDMOTOR_GETALL]
	-- Add the parameters for the stored procedure here
	@pageIndex int = 1,
	@pageSize int = 1,
	@efficiency int = 0,
	@totalRow int = null output,
	@languageId int = NULL--en,ko,vi
AS
BEGIN
	SET NOCOUNT ON;
	IF @languageId IS NULL SET @languageId = 1
	SELECT @totalRow = COUNT(1) 
	FROM TdStandardMotor A
	WHERE 1=1
		AND Efficiency = @efficiency
    -- Insert statements for procedure here
	SELECT A.Id, A.kw, A.rpm, A.voltage, A.hz, A.Frame, A.Efficiency, A.DataSheet1, A.DataSheet2, A.Outline1, A.OutLine2
	FROM TdStandardMotor A
	WHERE 1=1
		AND Efficiency = @efficiency

	ORDER BY A.Id
	--LEFT JOIN BannerKos B ON A.Id = B.MasterId
	OFFSET (@pageIndex - 1) * @pageSize rows
	FETCH NEXT @pageSize row only
END
GO
USE [master]
GO
ALTER DATABASE [MotorHomepage] SET  READ_WRITE 
GO
