USE [master]
GO
/****** Object:  Database [MISA.DemoAMIS]    Script Date: 12/01/2019 15:56:29 ******/
CREATE DATABASE [MISA.DemoAMIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MISA.DemoAMIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\MISA.DemoAMIS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MISA.DemoAMIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\MISA.DemoAMIS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MISA.DemoAMIS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MISA.DemoAMIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MISA.DemoAMIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MISA.DemoAMIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MISA.DemoAMIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MISA.DemoAMIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MISA.DemoAMIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET RECOVERY FULL 
GO
ALTER DATABASE [MISA.DemoAMIS] SET  MULTI_USER 
GO
ALTER DATABASE [MISA.DemoAMIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MISA.DemoAMIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MISA.DemoAMIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MISA.DemoAMIS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MISA.DemoAMIS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MISA.DemoAMIS', N'ON'
GO
USE [MISA.DemoAMIS]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NULL,
	[ClassName] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[PostID] [uniqueidentifier] NULL,
	[CommentContent] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[LikeCount] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[PostContent] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[LikeCount] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentCode] [nvarchar](20) NULL,
	[StudentName] [nvarchar](255) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[FullName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Post] ([PostID], [UserID], [PostContent], [CreatedDate], [LikeCount]) VALUES (N'290c3b05-c9a6-4cea-a549-001743b385f5', N'49759dde-2a58-4604-879a-762adeb6013a', N'Hôm nay vui quá', CAST(N'2019-01-12T09:54:46.017' AS DateTime), 0)
INSERT [dbo].[Post] ([PostID], [UserID], [PostContent], [CreatedDate], [LikeCount]) VALUES (N'8db5cb28-4a47-47bf-ab68-3fb79012e23c', N'49759dde-2a58-4604-879a-762adeb6013a', N'Hôm nay vui quá', CAST(N'2019-01-12T09:55:24.207' AS DateTime), 0)
INSERT [dbo].[Post] ([PostID], [UserID], [PostContent], [CreatedDate], [LikeCount]) VALUES (N'30fc59ed-e865-4090-bd9d-487422f23d50', N'49759dde-2a58-4604-879a-762adeb6013a', N'Hôm nay vui quá', CAST(N'2019-01-12T09:55:23.407' AS DateTime), 0)
INSERT [dbo].[Post] ([PostID], [UserID], [PostContent], [CreatedDate], [LikeCount]) VALUES (N'66f5957a-49d2-470d-a254-84c76cbe382a', N'49759dde-2a58-4604-879a-762adeb6013a', N'Hôm nay buồn quá', CAST(N'2019-01-12T09:54:37.253' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (1, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (2, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (3, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (4, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (5, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (6, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (7, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (8, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (9, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (10, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (11, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (12, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (13, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (14, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (15, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (16, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (17, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (18, N'HS0001', N'Nguyễn Văn Mạnh', 18)
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentName], [Age]) VALUES (19, N'HS0001', N'Nguyễn Văn Mạnh', 18)
SET IDENTITY_INSERT [dbo].[Student] OFF
INSERT [dbo].[User] ([UserID], [UserName], [FullName], [Password]) VALUES (N'49759dde-2a58-4604-879a-762adeb6013a', N'nvminh', N'Nguyễn Văn Minh', N'12345678')
INSERT [dbo].[User] ([UserID], [UserName], [FullName], [Password]) VALUES (N'9275f7a1-be70-4c95-a575-86d102b02176', N'admin', N'Nguyễn Văn Mạnh', N'12345678')
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
/****** Object:  StoredProcedure [dbo].[Proc_CheckLoginInfo]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_CheckLoginInfo] 
@UserName NVARCHAR(100),
@Password NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Result BIT = 0;
	IF EXISTS (SELECT * FROM dbo.[User] AS U
							WHERE U.UserName = @UserName
							AND U.Password = @Password) 
		BEGIN
			SET @Result = 1
		END
	-- Lấy giá trị trả về:
	SELECT @Result,2
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetPostList]    Script Date: 12/01/2019 15:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_GetPostList] 

AS
BEGIN
	SET NOCOUNT ON;
	SELECT P.PostID,
           P.UserID,
           P.PostContent,
           P.CreatedDate,
           P.LikeCount,
           U.UserName,
           U.FullName,
           U.Password,
           C.CommentID,
           C.UserID,
           C.CommentContent,
           C.CreatedDate
	FROM dbo.Post AS P
	INNER JOIN dbo.[User] AS U ON U.UserID = P.UserID
	LEFT JOIN dbo.Comment AS C ON C.PostID = P.PostID
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã lớp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên lớp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bài Post' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'PostID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung Commnent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'CommentContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày viết Comment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượt like' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'LikeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã bài Post' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'PostID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người dùng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung bài Post' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'PostContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượt like' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'LikeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bảng dữ liệu học sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khóa chính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ tên người dùng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
USE [master]
GO
ALTER DATABASE [MISA.DemoAMIS] SET  READ_WRITE 
GO
