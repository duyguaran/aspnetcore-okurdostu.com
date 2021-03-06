USE [okurdostu]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Message] [nvarchar](2000) NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Need]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Need](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Title] [nvarchar](75) NOT NULL,
	[FriendlyTitle] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TotalCollectedMoney] [money] NULL,
	[TotalCharge] [money] NULL,
	[IsRemoved] [bit] NOT NULL,
	[IsSentForConfirmation] [bit] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[StartedOn] [smalldatetime] NULL,
	[FinishedOn] [smalldatetime] NULL,
	[IsWrong] [bit] NOT NULL,
 CONSTRAINT [PK_Need] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Key_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NeedComment]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeedComment](
	[Id] [uniqueidentifier] NOT NULL,
	[Comment] [nvarchar](100) NOT NULL,
	[RelatedCommentId] [uniqueidentifier] NULL,
	[NeedId] [bigint] NOT NULL,
	[UserId] [bigint] NULL,
	[IsRemoved] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_NeedComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NeedItem]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeedItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NeedId] [bigint] NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[Picture] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[PlatformName] [nvarchar](max) NULL,
	[IsRemoved] [bit] NOT NULL,
	[IsWrong] [bit] NOT NULL,
 CONSTRAINT [PK_NeedItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NeedLike]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeedLike](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NeedId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[isCurrentLiked] [bit] NOT NULL,
 CONSTRAINT [PK_NeedLike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Biography] [nvarchar](256) NULL,
	[Telephone] [nvarchar](50) NULL,
	[PictureUrl] [nvarchar](max) NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [date] NULL,
	[Twitter] [nvarchar](15) NULL,
	[Github] [nvarchar](39) NULL,
	[ContactEmail] [nvarchar](50) NULL,
	[LastChangedOn] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Key_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Key_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEducation]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEducation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[UniversityId] [smallint] NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[ActivitiesSocieties] [nvarchar](200) NULL,
	[StartYear] [nvarchar](4) NULL,
	[EndYear] [nvarchar](4) NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[IsRemoved] [bit] NOT NULL,
	[IsSentToConfirmation] [bit] NOT NULL,
	[IsActiveEducation] [bit] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_UserEducation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEducationDoc]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEducationDoc](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserEducationId] [bigint] NOT NULL,
	[PathAfterRoot] [nvarchar](max) NOT NULL,
	[FullPath] [nvarchar](max) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UserEducationDoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEmailConfirmation]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEmailConfirmation](
	[GUID] [uniqueidentifier] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[NewEmail] [nvarchar](100) NULL,
	[IsUsed] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[UsedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_UserEmailConfirmation] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPasswordReset]    Script Date: 7/15/2020 1:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPasswordReset](
	[GUID] [uniqueidentifier] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[UsedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_UserPasswordReset] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Need] ADD  CONSTRAINT [DF_Need_isRemoved]  DEFAULT ((0)) FOR [IsRemoved]
GO
ALTER TABLE [dbo].[Need] ADD  CONSTRAINT [DF_Need_isSentForConfirmation]  DEFAULT ((0)) FOR [IsSentForConfirmation]
GO
ALTER TABLE [dbo].[Need] ADD  CONSTRAINT [DF_Need_isConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Need] ADD  CONSTRAINT [DF_Need_isCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Need] ADD  CONSTRAINT [DF_Need_isWrong]  DEFAULT ((0)) FOR [IsWrong]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Kullanici_onay]  DEFAULT ((0)) FOR [IsEmailConfirmed]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsEmailConfirmed1]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserEducation] ADD  CONSTRAINT [DF_UserEducation_IsConfirmed1]  DEFAULT ((0)) FOR [IsActiveEducation]
GO
ALTER TABLE [dbo].[UserEducation] ADD  CONSTRAINT [DF_kullaniciEgitim_onay]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[UserEducationDoc] ADD  CONSTRAINT [DF_UserEducationDoc_UserEducationId]  DEFAULT ((0)) FOR [UserEducationId]
GO
ALTER TABLE [dbo].[Need]  WITH CHECK ADD  CONSTRAINT [FK_Need_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Need] CHECK CONSTRAINT [FK_Need_User]
GO
ALTER TABLE [dbo].[NeedComment]  WITH CHECK ADD  CONSTRAINT [FK_NeedComment_Need] FOREIGN KEY([NeedId])
REFERENCES [dbo].[Need] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeedComment] CHECK CONSTRAINT [FK_NeedComment_Need]
GO
ALTER TABLE [dbo].[NeedComment]  WITH CHECK ADD  CONSTRAINT [FK_NeedComment_NeedComment] FOREIGN KEY([RelatedCommentId])
REFERENCES [dbo].[NeedComment] ([Id])
GO
ALTER TABLE [dbo].[NeedComment] CHECK CONSTRAINT [FK_NeedComment_NeedComment]
GO
ALTER TABLE [dbo].[NeedComment]  WITH CHECK ADD  CONSTRAINT [FK_NeedComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[NeedComment] CHECK CONSTRAINT [FK_NeedComment_User]
GO
ALTER TABLE [dbo].[NeedItem]  WITH CHECK ADD  CONSTRAINT [FK_NeedItem_Need] FOREIGN KEY([NeedId])
REFERENCES [dbo].[Need] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeedItem] CHECK CONSTRAINT [FK_NeedItem_Need]
GO
ALTER TABLE [dbo].[NeedLike]  WITH CHECK ADD  CONSTRAINT [FK_NeedLike_Need] FOREIGN KEY([NeedId])
REFERENCES [dbo].[Need] ([Id])
GO
ALTER TABLE [dbo].[NeedLike] CHECK CONSTRAINT [FK_NeedLike_Need]
GO
ALTER TABLE [dbo].[NeedLike]  WITH CHECK ADD  CONSTRAINT [FK_NeedLike_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeedLike] CHECK CONSTRAINT [FK_NeedLike_User]
GO
ALTER TABLE [dbo].[UserEducation]  WITH CHECK ADD  CONSTRAINT [FK_UserEducation_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserEducation] CHECK CONSTRAINT [FK_UserEducation_University]
GO
ALTER TABLE [dbo].[UserEducation]  WITH CHECK ADD  CONSTRAINT [FK_UserEducation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserEducation] CHECK CONSTRAINT [FK_UserEducation_User]
GO
ALTER TABLE [dbo].[UserEducationDoc]  WITH CHECK ADD  CONSTRAINT [FK_UserEducationDoc_UserEducation] FOREIGN KEY([UserEducationId])
REFERENCES [dbo].[UserEducation] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserEducationDoc] CHECK CONSTRAINT [FK_UserEducationDoc_UserEducation]
GO
ALTER TABLE [dbo].[UserEmailConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_UserEmailConfirmation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserEmailConfirmation] CHECK CONSTRAINT [FK_UserEmailConfirmation_User]
GO
ALTER TABLE [dbo].[UserPasswordReset]  WITH CHECK ADD  CONSTRAINT [FK_UserPasswordReset_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPasswordReset] CHECK CONSTRAINT [FK_UserPasswordReset_User]
GO
