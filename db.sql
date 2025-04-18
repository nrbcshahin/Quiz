USE [Quiz]
GO
/****** Object:  Table [dbo].[AppConfigs]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfigs](
	[ConfigKey] [nvarchar](100) NOT NULL,
	[ConfigValue] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AppSettings_ConfigKey] PRIMARY KEY CLUSTERED 
(
	[ConfigKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carousels]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousels](
	[CarouselId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AppId] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
 CONSTRAINT [PK_Carousels_CarouselId] PRIMARY KEY CLUSTERED 
(
	[CarouselId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapters]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapters](
	[ChapterId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[SerialNo] [int] NULL,
 CONSTRAINT [PK_Chapters] PRIMARY KEY CLUSTERED 
(
	[ChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseFacilities]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseFacilities](
	[FacilityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_CourseFacilities] PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[SerialNo] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[PriceId] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[IsRandom] [bit] NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[PassScore] [int] NULL,
	[IsActive] [bit] NULL,
	[SerialNo] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsLogin] [bit] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[LogoutDate] [datetime] NULL,
	[DeviceInfo] [nvarchar](max) NOT NULL,
	[LoginIp] [nvarchar](20) NOT NULL,
	[MachineName] [nvarchar](100) NULL,
	[MachineInfo] [nvarchar](500) NULL,
	[Attempt] [int] NOT NULL,
	[Signature] [nvarchar](500) NULL,
 CONSTRAINT [PK__Login__4DDA28188B9CBD87] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SerialNo] [int] NULL,
 CONSTRAINT [PK_Menus_1] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus_Old]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus_Old](
	[MenuId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SerialNo] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[IsCorrect] [bit] NULL,
	[QuestionId] [int] NULL,
 CONSTRAINT [PK_Options_OptionId] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[EnrollmentId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Method] [nvarchar](10) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceId] [int] NOT NULL,
	[CourseId] [int] NULL,
	[Price] [decimal](5, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
	[Amount] [decimal](5, 2) NULL,
	[ValidFrom] [date] NULL,
	[ValidTo] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED 
(
	[PriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prizes]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prizes](
	[PrizeId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED 
(
	[PrizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[ProgramId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SerialNo] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionMaps]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionMaps](
	[MapId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[Total] [int] NULL,
	[Correct] [int] NULL,
	[Incorrect] [int] NULL,
	[Score] [decimal](5, 2) NULL,
	[Passed] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Part] [nvarchar](20) NULL,
	[Code] [nvarchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SerialNo] [int] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[UserAnswerId] [int] NOT NULL,
	[UserId] [int] NULL,
	[UserExamId] [int] NULL,
	[QuestionId] [int] NULL,
	[OptionId] [int] NULL,
	[TimeTaken] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Abswers] PRIMARY KEY CLUSTERED 
(
	[UserAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserExams]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExams](
	[UserExamId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ExamId] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Score] [decimal](5, 2) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserExams] PRIMARY KEY CLUSTERED 
(
	[UserExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrizes]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrizes](
	[UpId] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [int] NOT NULL,
	[PrizeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserPrizes] PRIMARY KEY CLUSTERED 
(
	[UpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/25/2025 12:00:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](20) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[JoinDate] [datetime2](7) NOT NULL,
	[Gender] [char](1) NULL,
	[Role] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AppConfigs] ([ConfigKey], [ConfigValue]) VALUES (N'Name', N'QUIZ')
GO
SET IDENTITY_INSERT [dbo].[Carousels] ON 

INSERT [dbo].[Carousels] ([CarouselId], [Title], [Image], [IsActive], [AppId], [SerialNo]) VALUES (1, N'1', N'1.jpg', 1, 3, 1)
INSERT [dbo].[Carousels] ([CarouselId], [Title], [Image], [IsActive], [AppId], [SerialNo]) VALUES (2, N'2', N'2.jpg', 1, 3, 2)
INSERT [dbo].[Carousels] ([CarouselId], [Title], [Image], [IsActive], [AppId], [SerialNo]) VALUES (3, N'3', N'3.jpg', 1, 3, 3)
INSERT [dbo].[Carousels] ([CarouselId], [Title], [Image], [IsActive], [AppId], [SerialNo]) VALUES (4, N'4', N'4.jpg', 1, 3, 4)
SET IDENTITY_INSERT [dbo].[Carousels] OFF
GO
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([LoginId], [UserId], [IsLogin], [LoginDate], [LogoutDate], [DeviceInfo], [LoginIp], [MachineName], [MachineInfo], [Attempt], [Signature]) VALUES (1, 1, 1, CAST(N'2025-03-20T11:48:12.813' AS DateTime), CAST(N'2025-03-20T11:48:12.663' AS DateTime), N'PostmanRuntime/7.43.2', N'localhost:5229', N'SHAHIN-ICT', N'{"MachineName":"SHAHIN-ICT","UserDomainName":"NRBCBANKPLC","UserName":"shahin.khalifa","ProcessorCount":16,"Is64BitProcess":true,"Is64BitOperatingSystem":true,"OSVersion":{"Platform":2,"ServicePack":"","Version":"10.0.19045.0","VersionString":"Microsoft Windows NT 10.0.19045.0"}}', 0, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE3NDI0NDk2OTIsImV4cCI6MTc0MjQ2MTY5MiwiaXNzIjoiaHR0cHM6Ly93d3cub3Zyb3NvZnQuY29tIiwiYXVkIjoiT1ZST1NPRlQifQ.or0KclafM4xtksuIXn8pQjKVEmDSsRXgO3yNp3YbQvI')
SET IDENTITY_INSERT [dbo].[Logins] OFF
GO
INSERT [dbo].[Menus] ([MenuId], [Name], [Image], [IsActive], [SerialNo]) VALUES (1, N'ক্লাস ৬-১২', N'1', 1, 1)
INSERT [dbo].[Menus] ([MenuId], [Name], [Image], [IsActive], [SerialNo]) VALUES (2, N'ভর্তি পরীক্ষা', N'2', 1, 2)
INSERT [dbo].[Menus] ([MenuId], [Name], [Image], [IsActive], [SerialNo]) VALUES (3, N'জব প্রস্তুতি', N'3', 1, 3)
INSERT [dbo].[Menus] ([MenuId], [Name], [Image], [IsActive], [SerialNo]) VALUES (4, N'স্কিলস', N'4', 1, 4)
GO
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (1, 0, N'ক্লাস ৬-১২', N'1.jpg', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (2, 0, N'ভর্তি পরীক্ষা', N'2.jpg', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (3, 0, N'জব প্রস্তুতি', N'3.jpg', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (4, 0, N'স্কিলস', N'4.jpg', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (5, 1, N'এইচএসসি', N'5.jpg', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (6, 1, N'এসএসসি', N'8.jpg', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (7, 1, N'অষ্টম শ্রেণি', N'11.jpg', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (8, 1, N'সপ্তম শ্রেণি', N'12.jpg', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (9, 1, N'ষষ্ঠ শ্রেণি', N'13.jpg', 1, 5)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (10, 5, N'বিজ্ঞান বিভাগ', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (11, 5, N'ব্যবসায় শিক্ষা', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (12, 5, N'মানবিক বিভাগ', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (13, 10, N'বাংলা - ১ম পত্র', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (14, 10, N'বাংলা - ২য় পত্র', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (15, 10, N'তথ্য ও যোগাযোগ প্রযুক্তি', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (16, 10, N'ইংরেজি - ১ম পত্র', N'1', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (17, 10, N'ইংরেজি - ২য় পত্র', N'1', 1, 5)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (18, 10, N'পদার্থবিজ্ঞান ১ম পত্র', N'1', 1, 6)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (19, 10, N'পদার্থবিজ্ঞান ২য় পত্র', N'1', 1, 7)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (20, 10, N'জীব বিজ্ঞান ১ম পত্র', N'1', 1, 8)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (21, 10, N'জীব বিজ্ঞান ২য় পত্র', N'1', 1, 9)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (22, 10, N'রসায়ন ১ম পত্র', N'1', 1, 10)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (23, 10, N'রসায়ন ২য় পত্র', N'1', 1, 11)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (24, 10, N'উচ্চতর গণিত ১ম পত্র', N'1', 1, 12)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (25, 10, N'উচ্চতর গণিত ২য় পত্র', N'1', 1, 13)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (26, 11, N'ব্যবসায় সংগঠন ও ব্যবস্থাপনা ১ম পত্র', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (27, 11, N'ব্যবসায় সংগঠন ও ব্যবস্থাপনা ২য় পত্র', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (28, 11, N'হিসাব বিজ্ঞান ১ম পত্র', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (29, 11, N'হিসাব বিজ্ঞান ২য় পত্র', N'1', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (30, 11, N'ফিন্যান্স ব্যাংকিং ও বীমা ১ম পত্র', N'1', 1, 5)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (31, 11, N'ফিন্যান্স ব্যাংকিং ও বিমা ২য় পত্র', N'1', 1, 6)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (32, 11, N'উৎপাদন ব্যবস্থাপনা ও বিপণন ১ম পত্র', N'1', 1, 7)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (33, 11, N'উৎপাদন ব্যবস্থাপনা ও বিপণন ২য় পত্র', N'1', 1, 8)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (34, 12, N'ইতিহাস ১ম পত্র', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (35, 12, N'ইতিহাস ২য় পত্র', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (36, 12, N'ইসলামের ইতিহাস ও সংস্কৃতি ১ম পত্র', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (37, 12, N'ইসলামের ইতিহাস ও সংস্কৃতি ২য় পত্র', N'1', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (38, 12, N'পৌরনীতি ও সুশাসন ১ম পত্র', N'1', 1, 5)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (39, 12, N'পৌরনীতি ও সুশাসন ২য় পত্র', N'1', 1, 6)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (40, 12, N'অর্থনীতি ১ম পত্র', N'1', 1, 7)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (41, 12, N'অর্থনীতি ২য় পত্র', N'1', 1, 8)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (42, 12, N'যুক্তিবিদ্যা ১ম পত্র', N'1', 1, 9)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (43, 12, N'সমাজ বিজ্ঞান ১ম পত্র', N'1', 1, 10)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (44, 12, N'সমাজ বিজ্ঞান ২য় পত্র', N'1', 1, 11)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (45, 12, N'সমাজকর্ম ১ম পত্র', N'1', 1, 12)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (46, 12, N'সমাজকর্ম ২য় পত্র', N'1', 1, 13)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (47, 12, N'ভূগোল ১ম পত্র', N'1', 1, 14)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (48, 12, N'ভূগোল ২য় পত্র', N'1', 1, 15)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (49, 6, N'বিজ্ঞান বিভাগ', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (50, 6, N'ব্যবসায় শিক্ষা', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (51, 6, N'মানবিক বিভাগ', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (52, 49, N'বাংলা - ১ম পত্র', N'1', 1, 1)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (53, 49, N'বাংলা - ২য় পত্র', N'1', 1, 2)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (54, 49, N'ইংরেজি - ১ম পত্র', N'1', 1, 3)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (55, 49, N'ইংরেজি - ২য় পত্র', N'1', 1, 4)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (56, 49, N'তথ্য ও যোগাযোগ প্রযুক্তি', N'1', 1, 5)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (57, 49, N'গণিত', N'1', 1, 6)
INSERT [dbo].[Menus_Old] ([MenuId], [ParentId], [Name], [Image], [IsActive], [SerialNo]) VALUES (58, 49, N'5', N'1', 1, 7)
GO
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (1, N'Very delicious', 1, 1, 1)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (2, N'Not bad', 1, 0, 1)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (3, N'Also normal', 1, 0, 1)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (4, N'Not to my taste', 1, 0, 1)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (5, N'1995', 1, 1, 2)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (6, N'1996', 1, 0, 2)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (7, N'1997', 1, 0, 2)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (8, N'1998', 1, 0, 2)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (9, N'php format', 1, 1, 3)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (10, N'Xml formate', 1, 0, 3)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (11, N'Javascript', 1, 0, 3)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (12, N'Text formate', 1, 0, 3)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (13, N'JavaScript Object Normalization', 1, 1, 4)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (14, N'JavaScript Object-Oriented Notation', 1, 0, 4)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (15, N'JavaScript Object Notation', 1, 0, 4)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (16, N'Java Object Notation', 1, 0, 4)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (17, N'Colons', 1, 1, 5)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (18, N'Commas', 1, 0, 5)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (19, N'Hyper', 1, 0, 5)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (20, N'Semicolons', 1, 0, 5)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (21, N'Rasmus Lerdorf', 1, 1, 6)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (22, N'Jesse James Garrett', 1, 0, 6)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (23, N'Alvin Alexander', 1, 0, 6)
INSERT [dbo].[Options] ([OptionId], [Title], [IsActive], [IsCorrect], [QuestionId]) VALUES (24, N'Douglas Crockford', 1, 0, 6)
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Prizes] ON 

INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (1, 1, N'First Prize', CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (2, 1, N'Second Prize', CAST(50 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (3, 1, N'Third Prize', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (4, 2, N'First Prize', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (5, 2, N'Second Prize', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (6, 2, N'Third Prize', CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (7, 3, N'First Prize', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (8, 3, N'Second Prize', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Prizes] ([PrizeId], [EntityId], [Name], [Amount]) VALUES (9, 3, N'Third Prize', CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Prizes] OFF
GO
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (1, N'এইচএসসি', 1, 1)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (2, N'এসএসসি', 1, 2)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (3, N'অষ্টম শ্রেণি', 1, 3)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (4, N'সপ্তম শ্রেণি', 1, 4)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (5, N'ষষ্ঠ শ্রেণি', 1, 5)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (6, N'বিসিএস', 1, 6)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (7, N'শিক্ষক নিবন্ধন', 1, 7)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (8, N'প্রাথমিক সহকারী শিক্ষক নিয়োগ', 1, 8)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (9, N'বাংলাদেশ রেলওয়ে', 1, 9)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (10, N'অফিস সহকারী', 1, 10)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (11, N'পেট্রোবাংলা', 1, 11)
INSERT [dbo].[Programs] ([ProgramId], [Name], [IsActive], [SerialNo]) VALUES (12, N'ব্যাংক নিয়োগ', 1, 12)
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (1, N'For example, what do you think about the restaurant’s special dish today?', 1, NULL, 1, NULL, CAST(N'2023-06-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (2, N'Harry Potter and the Philosopher’s Stone was first published by Bloomsbury in the UK in _____', 1, NULL, 1, 1, CAST(N'2023-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (3, N' JSON is a _____ for storing and transporting data.', 1, NULL, 1, 1, CAST(N'2023-06-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (4, N'JSON stands for _______', 1, NULL, 1, 1, CAST(N'2023-06-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (5, N'In the JSON syntax, data is separated by _____', 1, NULL, 1, 1, CAST(N'2023-06-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Questions] ([QuestionId], [Title], [IsActive], [Description], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (6, N'Who is the creator of JSON?', 1, NULL, 1, 1, CAST(N'2023-06-25T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (1, 1, N'বাংলা', N'১ম পত্র', N'122', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (2, 1, N'বাংলা', N'২য় পত্র', N'1221', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (3, 1, N'তথ্য ও যোগাযোগ প্রযুক্তি', NULL, N'45', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (4, 1, N'ইংরেজি', N'১ম পত্র', N'87', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (5, 1, N'ইংরেজি', N'২য় পত্র', N'988', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (6, 1, N'পদার্থবিজ্ঞান', N'১ম পত্র', N'985', 1, 1)
INSERT [dbo].[Subjects] ([SubjectId], [ProgramId], [Name], [Part], [Code], [IsActive], [SerialNo]) VALUES (7, 1, N'পদার্থবিজ্ঞান', N'২য় পত্র', N'254', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[UserPrizes] ON 

INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (2, 1, 2, 2)
INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (3, 1, 3, 3)
INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (4, 2, 1, 1)
INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (5, 2, 2, 2)
INSERT [dbo].[UserPrizes] ([UpId], [EntityId], [PrizeId], [UserId]) VALUES (6, 2, 3, 3)
SET IDENTITY_INSERT [dbo].[UserPrizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (1, N'Ononna Islam', N'0ZY3PNOD5TETPZE.jpeg', N'01711519594', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T20:17:22.1774287' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (2, N'Eva Sultana', N'66HGFDQRUSD7KN3.jpeg', N'01717698091', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T21:15:29.3379087' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (3, N'Sharmin Akter', N'ZCKRISSNS42PDA9.jpeg', N'01710156437', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T14:15:38.1598618' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (4, N'Nazneen Zahan', N'932S74S1R8FD2ZI.jpeg', N'01776662279', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T14:29:40.9742843' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (5, N'Razia Sultana Shova', N'SO7CD9FPE74F243.jpg', N'01780098076', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T14:36:52.0143477' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (6, N'Zerin khan', N'BMTVXACSOSQPF79.jpeg', N'01916892206', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-05T15:05:02.1776433' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (7, N'Farhana Yesmin', N'1KLYNFC22H0IEZD.jpeg', N'01749518772', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-06T09:03:21.4024201' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (8, N'Kakoly Islam', N'RVQSBSYX0RYTVC9.jpeg', N'01912762533', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-06T10:34:48.8424686' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (9, N'Tania Akter', N'AAYUW56K9T3IY0Z.jpeg', N'01711519595', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T03:58:29.8914179' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (10, N'Kohely Islam', N'M709RCDJT6ZX9CP.jpeg', N'01711519596', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T04:33:45.9326748' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (11, N'Kajoly Islam', N'OUCDUEPW7E4ULEY.jpeg', N'01711519597', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T04:50:45.8291304' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (12, N'Sara khan', N'PXGDP378G4M42EG.jpg', N'01709958998', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T06:10:17.8853388' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (13, N'Fahmida Yesmin', N'C4AWI8F71G0W7A5.jpg', N'01915953291', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T10:18:24.3869614' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (14, N'Shohel Ahmed', N'default.png', N'01679485649', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-07T11:01:07.1886495' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (15, N'Tanha Islam', N'73ML9L25ZGU6724.jpg', N'01743081349', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-08T04:46:37.6958361' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (16, N'Shaimom Israt', N'default.png', N'01778509183', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-10T04:53:57.3289781' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (17, N'Srijani Mondal', N'S7W2M2H4D5FC5TE.jpg', N'8910014748', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-25T02:31:11.8607390' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (18, N'Shaimom.Israt', N'GP7E6RM4E36MPC8.jpg', N'01768901617', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-05-25T09:42:23.3279810' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (19, N'Anupama Verma', N'B8HH0I2CAXT33FA.jpg', N'8777546054', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-06-06T02:05:19.3003838' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (20, N'rabbi', N'default.png', N'01864548404', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-06-07T07:05:53.5501164' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (21, N'casaho', N'UVSJOMAUJBU70M6.png', N'616489113', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2020-06-10T03:10:21.1716762' AS DateTime2), N'F', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [Image], [Mobile], [Email], [Password], [IsActive], [JoinDate], [Gender], [Role], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate]) VALUES (23, N'Admin', N's', N'017', NULL, N'$2a$11$sE9WFdNb0/kkvvYC6uzR6O4WoV2Q86k30eftEEsx0lngbcqSbNaVi', 1, CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), N'M', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Menus_Old] ADD  CONSTRAINT [DF_Menus_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Programs] ADD  CONSTRAINT [DF_Programs_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
