USE [master]
GO
/****** Object:  Database [community]    Script Date: 2019/6/18 18:20:01 ******/
CREATE DATABASE [community]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'community', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VITAN\MSSQL\DATA\community.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'community_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VITAN\MSSQL\DATA\community_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [community] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [community].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [community] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [community] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [community] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [community] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [community] SET ARITHABORT OFF 
GO
ALTER DATABASE [community] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [community] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [community] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [community] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [community] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [community] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [community] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [community] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [community] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [community] SET  DISABLE_BROKER 
GO
ALTER DATABASE [community] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [community] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [community] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [community] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [community] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [community] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [community] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [community] SET RECOVERY FULL 
GO
ALTER DATABASE [community] SET  MULTI_USER 
GO
ALTER DATABASE [community] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [community] SET DB_CHAINING OFF 
GO
ALTER DATABASE [community] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [community] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [community] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'community', N'ON'
GO
ALTER DATABASE [community] SET QUERY_STORE = OFF
GO
USE [community]
GO
/****** Object:  Table [dbo].[baoming]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[baoming](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dh] [varchar](255) NOT NULL,
	[who] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
 CONSTRAINT [PK_baoming] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[canji]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[canji](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [varchar](255) NOT NULL,
	[民族] [varchar](255) NOT NULL,
	[性别] [varchar](255) NOT NULL,
	[婚否] [varchar](255) NOT NULL,
	[身份证号] [varchar](255) NOT NULL,
	[残疾证号] [varchar](255) NOT NULL,
	[残疾类型] [varchar](255) NOT NULL,
	[残疾等级] [varchar](255) NOT NULL,
	[是否建立档案] [varchar](255) NOT NULL,
	[联系方式] [varchar](255) NOT NULL,
	[备注] [varchar](255) NULL,
 CONSTRAINT [PK_canji] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dibao]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dibao](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[户主姓名] [varchar](255) NOT NULL,
	[性别] [varchar](255) NOT NULL,
	[家庭人口] [varchar](255) NOT NULL,
	[享受低保人口] [varchar](255) NOT NULL,
	[身份证号码] [varchar](255) NOT NULL,
	[主要致贫原因] [varchar](255) NOT NULL,
	[联系方式] [varchar](255) NOT NULL,
	[备注] [varchar](255) NULL,
 CONSTRAINT [PK_dibao] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[health]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[health](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[sex] [varchar](255) NOT NULL,
	[age] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[health] [varchar](255) NOT NULL,
	[img] [varchar](max) NULL,
 CONSTRAINT [PK_health_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jiufen]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jiufen](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[时间] [varchar](255) NOT NULL,
	[地点] [varchar](255) NOT NULL,
	[纠纷经过] [varchar](255) NOT NULL,
	[调处情况] [varchar](255) NOT NULL,
	[调解人] [varchar](255) NOT NULL,
	[负责人] [varchar](255) NULL,
 CONSTRAINT [PK_jiufen] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jumin]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jumin](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [varchar](255) NOT NULL,
	[性别] [varchar](255) NOT NULL,
	[年龄] [varchar](255) NOT NULL,
	[身份证号码] [varchar](255) NOT NULL,
	[联系方式] [varchar](255) NOT NULL,
	[家庭住址] [varchar](255) NOT NULL,
	[是否签约] [varchar](255) NOT NULL,
	[是否贫困] [varchar](255) NULL,
 CONSTRAINT [PK_jumin] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peixun]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peixun](
	[序号] [int] NULL,
	[姓名] [varchar](255) NOT NULL,
	[培训记录] [nchar](10) NULL,
	[入职岗位] [varchar](255) NULL,
	[入职时间] [varchar](255) NULL,
	[辅导老师意见] [varchar](255) NULL,
	[部门负责人意见] [varchar](255) NULL,
	[人力资源部意见] [varchar](255) NULL,
	[总经理意见] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[photos]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photos](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](max) NULL,
 CONSTRAINT [PK_phots] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tongzhi]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tongzhi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time] [date] NULL,
	[title] [nchar](10) NULL,
	[from] [varchar](max) NULL,
	[content] [varchar](max) NULL,
 CONSTRAINT [PK_tongzhi\] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tousu]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tousu](
	[序号] [int] NOT NULL,
	[投诉时间] [varchar](255) NOT NULL,
	[投诉人姓名] [varchar](255) NULL,
	[投诉人联系方式] [varchar](255) NOT NULL,
	[投诉/建议事宜] [varchar](255) NOT NULL,
	[处理时间] [varchar](255) NULL,
	[处理情况] [varchar](255) NOT NULL,
	[备注] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[register_time] [datetime] NOT NULL,
	[img] [varchar](max) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wenti]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wenti](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[获得名称] [varchar](255) NULL,
	[主题] [varchar](255) NULL,
	[活动时间] [varchar](255) NULL,
	[活动地点] [varchar](255) NULL,
	[面向对象] [varchar](255) NULL,
	[活动内容] [varchar](255) NULL,
	[备注] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xiagang]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xiagang](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [varchar](255) NOT NULL,
	[性别] [varchar](255) NOT NULL,
	[出生年月] [varchar](255) NOT NULL,
	[籍贯] [varchar](255) NOT NULL,
	[保障金] [nchar](10) NULL,
	[学历] [varchar](255) NOT NULL,
	[婚姻状况] [varchar](255) NOT NULL,
	[政治面貌] [varchar](255) NOT NULL,
	[健康状况] [varchar](255) NOT NULL,
	[联系电话] [varchar](255) NOT NULL,
	[邮箱] [varchar](255) NULL,
 CONSTRAINT [PK_xiagang] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zhian]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zhian](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[地点] [nchar](10) NULL,
	[负责人] [nchar](10) NULL,
	[是否有监控] [nchar](10) NULL,
 CONSTRAINT [PK_zhian] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zhiyuan]    Script Date: 2019/6/18 18:20:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zhiyuan](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [varchar](255) NOT NULL,
	[性别] [varchar](255) NOT NULL,
	[出生年月] [varchar](255) NOT NULL,
	[籍贯] [varchar](255) NOT NULL,
	[学历] [varchar](255) NOT NULL,
	[婚姻状况] [varchar](255) NOT NULL,
	[政治面貌] [varchar](255) NOT NULL,
	[健康状况] [varchar](255) NOT NULL,
	[联系电话] [varchar](255) NOT NULL,
	[邮箱] [varchar](255) NULL,
 CONSTRAINT [PK_zhiyuan] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_register_time]  DEFAULT (getdate()) FOR [register_time]
GO
USE [master]
GO
ALTER DATABASE [community] SET  READ_WRITE 
GO
