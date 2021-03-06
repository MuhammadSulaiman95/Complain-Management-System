USE [master]
GO
/****** Object:  Database [ManTechTest]    Script Date: 11/18/2017 12:45:24 PM ******/
CREATE DATABASE [ManTechTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MainTechTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MainTechTest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MainTechTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MainTechTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManTechTest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManTechTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManTechTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManTechTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManTechTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManTechTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManTechTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManTechTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManTechTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ManTechTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManTechTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManTechTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManTechTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManTechTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManTechTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManTechTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManTechTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManTechTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManTechTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManTechTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManTechTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManTechTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManTechTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManTechTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManTechTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManTechTest] SET RECOVERY FULL 
GO
ALTER DATABASE [ManTechTest] SET  MULTI_USER 
GO
ALTER DATABASE [ManTechTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManTechTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManTechTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManTechTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManTechTest', N'ON'
GO
USE [ManTechTest]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 11/18/2017 12:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTitle] [nvarchar](100) NULL,
	[ArticleBody] [nvarchar](max) NULL,
	[ArticleFor] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Complaints]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Complaints](
	[ComplainId] [int] IDENTITY(1,1) NOT NULL,
	[ComplainCategoryId] [int] NULL,
	[ComplainTypeId] [int] NULL,
	[ComplainTitle] [varchar](100) NULL,
	[ComplainDetail] [varchar](250) NULL,
	[ComplainAttachment] [varbinary](max) NULL,
	[ComplainDate] [datetime] NULL,
	[AssignDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[FromComplainDate] [varchar](100) NULL,
	[FromAssignDate] [varchar](100) NULL,
	[Comment] [varchar](250) NULL,
	[StatusId] [int] NULL,
	[AssignTo] [int] NULL,
	[EmployeeId] [int] NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Complaints] PRIMARY KEY CLUSTERED 
(
	[ComplainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComplaintsCategories]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComplaintsCategories](
	[ComplainCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ComplainCategory] [varchar](50) NULL,
 CONSTRAINT [PK_ComplaintsCategories] PRIMARY KEY CLUSTERED 
(
	[ComplainCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComplaintsTypes]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComplaintsTypes](
	[ComplainTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ComplainType] [varchar](50) NULL,
	[ComplainCategoryId] [int] NULL,
	[PriorityId] [int] NULL,
 CONSTRAINT [PK_ComplaintsTypes] PRIMARY KEY CLUSTERED 
(
	[ComplainTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleId] [int] NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Priorities](
	[PriorityId] [int] IDENTITY(1,1) NOT NULL,
	[PriorityIs] [varchar](50) NULL,
	[PriorityLevel] [tinyint] NULL,
 CONSTRAINT [PK_Priorities] PRIMARY KEY CLUSTERED 
(
	[PriorityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[RatingIs] [int] NULL,
	[Date] [datetime] NULL,
	[ArticleId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleIs] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusIs] [varchar](50) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ComplainId] [int] NULL,
	[ChangeDate] [datetime] NULL,
	[StatusId] [int] NULL,
	[AssignTo] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ComplainView]    Script Date: 11/18/2017 12:45:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ComplainView]
AS
SELECT        dbo.Complaints.ComplainId, dbo.Complaints.ComplainCategoryId, dbo.Complaints.ComplainTypeId, dbo.Complaints.ComplainTitle, dbo.Complaints.ComplainDetail, dbo.Complaints.ComplainAttachment, 
                         dbo.Complaints.ComplainDate, dbo.Complaints.AssignDate, dbo.Complaints.CloseDate, dbo.Complaints.FromComplainDate, dbo.Complaints.FromAssignDate, dbo.Complaints.Comment, dbo.Complaints.StatusId, 
                         dbo.Complaints.AssignTo, dbo.Complaints.EmployeeId, dbo.Complaints.DepartmentId, dbo.ComplaintsCategories.ComplainCategory, dbo.ComplaintsTypes.ComplainType, dbo.Departments.DepartmentName, 
                         dbo.Employees.EmployeeName, dbo.Statuses.StatusIs, Employee1.EmployeeName AS TechnicianName, dbo.Priorities.PriorityId, dbo.Priorities.PriorityIs, dbo.Priorities.PriorityLevel
FROM            dbo.Complaints INNER JOIN
                         dbo.ComplaintsCategories ON dbo.Complaints.ComplainCategoryId = dbo.ComplaintsCategories.ComplainCategoryId INNER JOIN
                         dbo.ComplaintsTypes ON dbo.Complaints.ComplainTypeId = dbo.ComplaintsTypes.ComplainTypeId AND dbo.ComplaintsCategories.ComplainCategoryId = dbo.ComplaintsTypes.ComplainCategoryId INNER JOIN
                         dbo.Departments ON dbo.Complaints.DepartmentId = dbo.Departments.DepartmentId INNER JOIN
                         dbo.Statuses ON dbo.Complaints.StatusId = dbo.Statuses.StatusId INNER JOIN
                         dbo.Employees ON dbo.Complaints.EmployeeId = dbo.Employees.EmployeeId INNER JOIN
                         dbo.Employees AS Employee1 ON dbo.Complaints.AssignTo = Employee1.EmployeeId INNER JOIN
                         dbo.Priorities ON dbo.ComplaintsTypes.PriorityId = dbo.Priorities.PriorityId

GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleId], [ArticleTitle], [ArticleBody], [ArticleFor], [Date]) VALUES (1, N'Tips For Login', N'Articles in the two magazines offer new ways to examine the debate over globalization. In "The American Prospect," Benjamin R. Barber writes that discussions about globalization have focused on businesses and governments -- excluding the role of citizen-led groups. Mr. Barber, a professor of political science at Rutgers University, cites numerous examples in which citizens have reshaped public debate worldwide, including the campaign against land mines, efforts to protect dolphins from the tuna industry, and the "microcredit" movement in which small loans are made to women in developing nations to help them start businesses. ', N'Login System', CAST(0x0000A82C010E7584 AS DateTime))
INSERT [dbo].[Articles] ([ArticleId], [ArticleTitle], [ArticleBody], [ArticleFor], [Date]) VALUES (2, N'Tips For Employee', N'Articles in the two magazines offer new ways to examine the debate over globalization. In "The American Prospect," Benjamin R. Barber writes that discussions about globalization have focused on businesses and governments -- excluding the role of citizen-led groups. Mr. Barber, a professor of political science at Rutgers University, cites numerous examples in which citizens have reshaped public debate worldwide, including the campaign against land mines, efforts to protect dolphins from the tuna industry, and the "microcredit" movement in which small loans are made to women in developing nations to help them start businesses. ', N'Employee Record', CAST(0x0000A82C010E7584 AS DateTime))
INSERT [dbo].[Articles] ([ArticleId], [ArticleTitle], [ArticleBody], [ArticleFor], [Date]) VALUES (3, N'Navigation System', N'A paragraph consists of several sentences that are grouped together. This group of sentences together discuss one main subject. In U.S. formal academic English, paragraphs have three principal parts. These three parts are the topic sentence, body sentences, and the concluding sentence', N'Nav Bar', CAST(0x0000A82D0034F0D5 AS DateTime))
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[Complaints] ON 

INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (6, 1, 2, N'Hard Drive is not working', N'Dead', NULL, CAST(0x0000A824002C3724 AS DateTime), CAST(0x0000A8240174826D AS DateTime), CAST(0x0000A82500DCDC66 AS DateTime), N'1Days , 10Hours , 43Minutes , 8Seconds.', N'0Days , 14Hours , 47Minutes , 51Seconds.', N'File Closed', 3, 1, 3, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (8, 1, 1, N'Motherboard is dead', N'do not show the Display', NULL, CAST(0x0000A82401507980 AS DateTime), CAST(0x0000A8240175DEA0 AS DateTime), NULL, NULL, NULL, NULL, 2, 2, 4, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (9, 1, 3, N'Keyboard is not working', N'Some Keyboard Keys is not working', NULL, CAST(0x0000A8240152CCD0 AS DateTime), CAST(0x0000A82500003E57 AS DateTime), NULL, NULL, NULL, NULL, 2, 1, 4, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (10, 2, 4, N'OS is Crashed', N'Windows is Not Working Properly', NULL, CAST(0x0000A8240167CE8C AS DateTime), CAST(0x0000A82500C25199 AS DateTime), NULL, NULL, NULL, NULL, 2, 2, 3, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (11, 1, 1, N'Motherboard is dead', N'chips in not working', NULL, CAST(0x0000A82B00E202FC AS DateTime), CAST(0x0000A82C010E7584 AS DateTime), NULL, NULL, NULL, NULL, 2, 1, 3, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (12, 1, 2, N'Hard drive is doing clicking sound', N'not working properlly', NULL, CAST(0x0000A82C00213AA4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (13, 1, 3, N'keyboard keys are stuck', N'soo much problems in keyboard', NULL, CAST(0x0000A82C00232350 AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 4, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (14, 2, 5, N'Not working', N'Corrupted', NULL, CAST(0x0000A82E00D2981C AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 4, 1)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (15, 2, 5, N'Not working', N'Corrupted', NULL, CAST(0x0000A82F0015FEDC AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 15, 4)
INSERT [dbo].[Complaints] ([ComplainId], [ComplainCategoryId], [ComplainTypeId], [ComplainTitle], [ComplainDetail], [ComplainAttachment], [ComplainDate], [AssignDate], [CloseDate], [FromComplainDate], [FromAssignDate], [Comment], [StatusId], [AssignTo], [EmployeeId], [DepartmentId]) VALUES (16, 2, 4, N'OS is Hang', N'OS is Not working properly', NULL, CAST(0x0000A82F0016AFD0 AS DateTime), CAST(0x0000A82F00C60B66 AS DateTime), NULL, NULL, NULL, NULL, 2, 2, 15, 4)
SET IDENTITY_INSERT [dbo].[Complaints] OFF
SET IDENTITY_INSERT [dbo].[ComplaintsCategories] ON 

INSERT [dbo].[ComplaintsCategories] ([ComplainCategoryId], [ComplainCategory]) VALUES (1, N'Hardware')
INSERT [dbo].[ComplaintsCategories] ([ComplainCategoryId], [ComplainCategory]) VALUES (2, N'Software')
SET IDENTITY_INSERT [dbo].[ComplaintsCategories] OFF
SET IDENTITY_INSERT [dbo].[ComplaintsTypes] ON 

INSERT [dbo].[ComplaintsTypes] ([ComplainTypeId], [ComplainType], [ComplainCategoryId], [PriorityId]) VALUES (1, N'Motherboard', 1, 1)
INSERT [dbo].[ComplaintsTypes] ([ComplainTypeId], [ComplainType], [ComplainCategoryId], [PriorityId]) VALUES (2, N'Hard Drive', 1, 1)
INSERT [dbo].[ComplaintsTypes] ([ComplainTypeId], [ComplainType], [ComplainCategoryId], [PriorityId]) VALUES (3, N'Keyboard', 1, 3)
INSERT [dbo].[ComplaintsTypes] ([ComplainTypeId], [ComplainType], [ComplainCategoryId], [PriorityId]) VALUES (4, N'Operating System', 2, 1)
INSERT [dbo].[ComplaintsTypes] ([ComplainTypeId], [ComplainType], [ComplainCategoryId], [PriorityId]) VALUES (5, N'MSOffice', 2, 2)
SET IDENTITY_INSERT [dbo].[ComplaintsTypes] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (1, N'Managment')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (2, N'IT Support')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (3, N'Educational')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4, N'Marketing')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (5, N'HR')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (8, N'Human')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Designation], [Phone], [Email], [Password], [RoleId], [DepartmentId]) VALUES (1, N'Saleh', N'Developer', 3232323233, N'saleh@gmail.com', N'123', 2, 2)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Designation], [Phone], [Email], [Password], [RoleId], [DepartmentId]) VALUES (2, N'Ahmed', N'Developer', 3238028221, N'ahmed@gmail.com', N'123', 2, 2)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Designation], [Phone], [Email], [Password], [RoleId], [DepartmentId]) VALUES (3, N'Farooq', N'Marketing Manager', 3232312121, N'farooq@gmail.com', N'123', 3, 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Designation], [Phone], [Email], [Password], [RoleId], [DepartmentId]) VALUES (4, N'Mehboob', N'Sales Officer', 3452323232, N'mehboob@gmail.com', N'123', 3, 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Designation], [Phone], [Email], [Password], [RoleId], [DepartmentId]) VALUES (15, N'Suleman Khan', N'General Manager', 1234567890, N'Suleman@gmail.com', N'123', 3, 4)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Priorities] ON 

INSERT [dbo].[Priorities] ([PriorityId], [PriorityIs], [PriorityLevel]) VALUES (1, N'High', 1)
INSERT [dbo].[Priorities] ([PriorityId], [PriorityIs], [PriorityLevel]) VALUES (2, N'Medium', 2)
INSERT [dbo].[Priorities] ([PriorityId], [PriorityIs], [PriorityLevel]) VALUES (3, N'Low', 3)
SET IDENTITY_INSERT [dbo].[Priorities] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingId], [RatingIs], [Date], [ArticleId], [UserName]) VALUES (1, 5, CAST(0x0000A82D0100DE0A AS DateTime), 1, N'farooq@gmail.com')
INSERT [dbo].[Ratings] ([RatingId], [RatingIs], [Date], [ArticleId], [UserName]) VALUES (2, 2, CAST(0x0000A82D00D7EAEC AS DateTime), 1, N'mehboob@gmail.com')
INSERT [dbo].[Ratings] ([RatingId], [RatingIs], [Date], [ArticleId], [UserName]) VALUES (3, 3, CAST(0x0000A82D00D7CC7F AS DateTime), 2, N'mehboob@gmail.com')
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleIs]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleIs]) VALUES (2, N'Technician')
INSERT [dbo].[Roles] ([RoleId], [RoleIs]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusId], [StatusIs]) VALUES (1, N'Open')
INSERT [dbo].[Statuses] ([StatusId], [StatusIs]) VALUES (2, N'Pending')
INSERT [dbo].[Statuses] ([StatusId], [StatusIs]) VALUES (3, N'Closed')
INSERT [dbo].[Statuses] ([StatusId], [StatusIs]) VALUES (4, N'Resend')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (10, 6, CAST(0x0000A82C00064662 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (11, 6, CAST(0x0000A8240174826D AS DateTime), 2, 1)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (12, 8, CAST(0x0000A82401507980 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (13, 8, CAST(0x0000A8240175DEA0 AS DateTime), 2, 2)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (14, 9, CAST(0x0000A8240152CCD0 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (15, 9, CAST(0x0000A82500003E57 AS DateTime), 2, 1)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (16, 10, CAST(0x0000A8240167CE8C AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (17, 10, CAST(0x0000A82500C25199 AS DateTime), 2, 2)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (18, 6, CAST(0x0000A82500DCDC66 AS DateTime), 3, 1)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (19, 11, CAST(0x0000A82B00E202FC AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (20, 8, CAST(0x0000A82C00160D68 AS DateTime), 4, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (23, 12, CAST(0x0000A82C00213AA4 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (24, 13, CAST(0x0000A82C00232350 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (25, 11, CAST(0x0000A82C010E7584 AS DateTime), 2, 1)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (26, 14, CAST(0x0000A82E00D2981C AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (27, 15, CAST(0x0000A82F0015FEDC AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (28, 16, CAST(0x0000A82F0016AFD0 AS DateTime), 1, NULL)
INSERT [dbo].[Tasks] ([TaskId], [ComplainId], [ChangeDate], [StatusId], [AssignTo]) VALUES (29, 16, CAST(0x0000A82F00C60B66 AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'aa@gmail.com', N'123', NULL)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'aaada@gmail.com', N'123', NULL)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'admin', N'123', 1)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'admin@gmail.com', N'123', 3)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'ahmed@gmail.com', N'123', 2)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'ddddd', NULL, 2)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'farooq@gmail.com', N'123', 3)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'junaid@gmail.com', N'123', 2)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'mazhar@helpdesk.com', N'123', 3)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'mehboob@gmail.com', N'123', 3)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'saleh@gmail.com', N'123', 2)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'salman', NULL, 2)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'Suleman@gmail.com', N'123', 3)
INSERT [dbo].[Users] ([UserName], [Password], [RoleId]) VALUES (N'suleman@helpdesk.com', N'123', 3)
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_ComplaintsCategories] FOREIGN KEY([ComplainCategoryId])
REFERENCES [dbo].[ComplaintsCategories] ([ComplainCategoryId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_ComplaintsCategories]
GO
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_ComplaintsTypes1] FOREIGN KEY([ComplainTypeId])
REFERENCES [dbo].[ComplaintsTypes] ([ComplainTypeId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_ComplaintsTypes1]
GO
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_Departments]
GO
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_Employees]
GO
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_Employees1] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_Employees1]
GO
ALTER TABLE [dbo].[Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Complaints_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([StatusId])
GO
ALTER TABLE [dbo].[Complaints] CHECK CONSTRAINT [FK_Complaints_Statuses]
GO
ALTER TABLE [dbo].[ComplaintsTypes]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintsTypes_ComplaintsCategories] FOREIGN KEY([ComplainCategoryId])
REFERENCES [dbo].[ComplaintsCategories] ([ComplainCategoryId])
GO
ALTER TABLE [dbo].[ComplaintsTypes] CHECK CONSTRAINT [FK_ComplaintsTypes_ComplaintsCategories]
GO
ALTER TABLE [dbo].[ComplaintsTypes]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintsTypes_Priorities] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priorities] ([PriorityId])
GO
ALTER TABLE [dbo].[ComplaintsTypes] CHECK CONSTRAINT [FK_ComplaintsTypes_Priorities]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Articles] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([ArticleId])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Articles]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Complaints] FOREIGN KEY([ComplainId])
REFERENCES [dbo].[Complaints] ([ComplainId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Complaints]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Employees] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Employees]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([StatusId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Statuses]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[16] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complaints"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "ComplaintsCategories"
            Begin Extent = 
               Top = 0
               Left = 334
               Bottom = 96
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplaintsTypes"
            Begin Extent = 
               Top = 0
               Left = 752
               Bottom = 130
               Right = 951
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departments"
            Begin Extent = 
               Top = 94
               Left = 318
               Bottom = 190
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Statuses"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 103
               Left = 570
               Bottom = 233
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee1"
            Begin Extent = 
               Top = 192
               Left = 246
               Bottom = 322
               Right = 419
            En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplainView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Priorities"
            Begin Extent = 
               Top = 234
               Left = 38
               Bottom = 347
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 35
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplainView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ComplainView'
GO
USE [master]
GO
ALTER DATABASE [ManTechTest] SET  READ_WRITE 
GO
