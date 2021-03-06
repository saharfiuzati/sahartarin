/****** Object:  ForeignKey [Comments-Link]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments] DROP CONSTRAINT [Comments-Link]
GO
/****** Object:  ForeignKey [Comments-User]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments] DROP CONSTRAINT [Comments-User]
GO
/****** Object:  ForeignKey [PopularLink-User]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[PopularLink-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[PopularLink]'))
ALTER TABLE [Sahartarin].[PopularLink] DROP CONSTRAINT [PopularLink-User]
GO
/****** Object:  ForeignKey [Tag_Link-Links]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Links]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link] DROP CONSTRAINT [Tag_Link-Links]
GO
/****** Object:  ForeignKey [Tag_Link-Tags]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Tags]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link] DROP CONSTRAINT [Tag_Link-Tags]
GO
/****** Object:  ForeignKey [Vote-Link]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes] DROP CONSTRAINT [Vote-Link]
GO
/****** Object:  ForeignKey [Vote-user]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-user]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes] DROP CONSTRAINT [Vote-user]
GO
/****** Object:  Table [Sahartarin].[PopularLink]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[PopularLink]') AND type in (N'U'))
DROP TABLE [Sahartarin].[PopularLink]
GO
/****** Object:  Table [Sahartarin].[Tag_Link]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Tag_Link]
GO
/****** Object:  Table [Sahartarin].[Comments]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Comments]
GO
/****** Object:  Table [Sahartarin].[Votes]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Votes]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Votes]
GO
/****** Object:  Table [Sahartarin].[Category]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Category]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Category]
GO
/****** Object:  Table [Sahartarin].[Link]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Link]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Link]
GO
/****** Object:  Table [Sahartarin].[Tags]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tags]') AND type in (N'U'))
DROP TABLE [Sahartarin].[Tags]
GO
/****** Object:  Table [Sahartarin].[User]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[User]') AND type in (N'U'))
DROP TABLE [Sahartarin].[User]
GO
/****** Object:  Schema [Sahartarin]    Script Date: 03/07/2011 00:12:43 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sahartarin')
DROP SCHEMA [Sahartarin]
GO
/****** Object:  Schema [Sahartarin]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sahartarin')
EXEC sys.sp_executesql N'CREATE SCHEMA [Sahartarin] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [Sahartarin].[User]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebSite] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [Sahartarin].[User] ON
INSERT [Sahartarin].[User] ([ID], [WebSite], [Country], [UserName]) VALUES (1, N'www.saharfh.blogspot.com', N'iran', N'saharfh')
INSERT [Sahartarin].[User] ([ID], [WebSite], [Country], [UserName]) VALUES (4, N'www.ali.com', N'USA', N'ali')
SET IDENTITY_INSERT [Sahartarin].[User] OFF
/****** Object:  Table [Sahartarin].[Tags]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tags]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [Sahartarin].[Tags] ON
INSERT [Sahartarin].[Tags] ([ID], [TagName]) VALUES (20, N'mir hossein mousavi')
SET IDENTITY_INSERT [Sahartarin].[Tags] OFF
/****** Object:  Table [Sahartarin].[Link]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Link]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[URL] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SendingTime] [datetime] NOT NULL,
	[Popular_LinkID] [int] NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [Sahartarin].[Link] ON
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (6, N'.NET Future', N'', N'www.Microsoft.com', 1, 4, CAST(0x00009E5B00097850 AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (7, N'Green Movement', N'the Future', N'www.kaleme.com', 1, 3, CAST(0x00009E700158BE7E AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (11, N'kernel linux', N'ubuntu stuff', N'www.redhatlinux.com', 2, 4, CAST(0x00009E530167A52D AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (12, N'wikileaks', N'is it true or not?', N'www.wikileaks.org', 1, 1, CAST(0x00009E700156499A AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (15, N'julian asanoa', N'he is free now!', N'www.wikileaks.org', 1, 3, CAST(0x00009E4D0160EA9D AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (22, N'what is art', N'i dont know anything about it at all!', N'www.art.com', 1, 2, CAST(0x00009E81001CD56A AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (23, N'population', N'what should we do in tehran?', N'www.tehrankids.ir', 1, 4, CAST(0x00009E51014B3CDF AS DateTime), NULL)
INSERT [Sahartarin].[Link] ([ID], [Title], [Description], [URL], [UserID], [CategoryID], [SendingTime], [Popular_LinkID]) VALUES (29, N'MVC 3.0', N'you can download it', N'www.google.com', 4, 4, CAST(0x00009E810162F9BF AS DateTime), NULL)
SET IDENTITY_INSERT [Sahartarin].[Link] OFF
/****** Object:  Table [Sahartarin].[Category]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [Sahartarin].[Category] ON
INSERT [Sahartarin].[Category] ([ID], [CategoryName]) VALUES (1, N'ejtemaE')
INSERT [Sahartarin].[Category] ([ID], [CategoryName]) VALUES (2, N'farhangi')
INSERT [Sahartarin].[Category] ([ID], [CategoryName]) VALUES (3, N'siasat')
INSERT [Sahartarin].[Category] ([ID], [CategoryName]) VALUES (4, N'elmo technology')
SET IDENTITY_INSERT [Sahartarin].[Category] OFF
/****** Object:  Table [Sahartarin].[Votes]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Votes]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Votes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [int] NOT NULL,
	[Linkid] [int] NOT NULL,
	[IsPositive] [bit] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [IX_Votes] UNIQUE NONCLUSTERED 
(
	[Linkid] ASC,
	[Userid] ASC,
	[IsPositive] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Sahartarin', N'TABLE',N'Votes', N'CONSTRAINT',N'IX_Votes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'user cannot vote the link twice
' , @level0type=N'SCHEMA',@level0name=N'Sahartarin', @level1type=N'TABLE',@level1name=N'Votes', @level2type=N'CONSTRAINT',@level2name=N'IX_Votes'
GO
SET IDENTITY_INSERT [Sahartarin].[Votes] ON
INSERT [Sahartarin].[Votes] ([ID], [Userid], [Linkid], [IsPositive]) VALUES (1, 1, 6, 1)
SET IDENTITY_INSERT [Sahartarin].[Votes] OFF
/****** Object:  Table [Sahartarin].[Comments]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Comments](
	[ID] [int] NOT NULL,
	[Content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[userid] [int] NOT NULL,
	[linkid] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Vote'sNumber] [int] NOT NULL
)
END
GO
/****** Object:  Table [Sahartarin].[Tag_Link]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[Tag_Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tagid] [int] NOT NULL,
	[linkid] [int] NOT NULL,
 CONSTRAINT [PK_Tag_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [Sahartarin].[Tag_Link] ON
INSERT [Sahartarin].[Tag_Link] ([ID], [tagid], [linkid]) VALUES (25, 20, 65)
INSERT [Sahartarin].[Tag_Link] ([ID], [tagid], [linkid]) VALUES (26, 20, 66)
INSERT [Sahartarin].[Tag_Link] ([ID], [tagid], [linkid]) VALUES (27, 20, 67)
INSERT [Sahartarin].[Tag_Link] ([ID], [tagid], [linkid]) VALUES (28, 20, 68)
SET IDENTITY_INSERT [Sahartarin].[Tag_Link] OFF
/****** Object:  Table [Sahartarin].[PopularLink]    Script Date: 03/07/2011 00:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sahartarin].[PopularLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sahartarin].[PopularLink](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImageP] [image] NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_PopularLink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  ForeignKey [Comments-Link]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments]  WITH NOCHECK ADD  CONSTRAINT [Comments-Link] FOREIGN KEY([linkid])
REFERENCES [Sahartarin].[Link] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments] NOCHECK CONSTRAINT [Comments-Link]
GO
/****** Object:  ForeignKey [Comments-User]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments]  WITH CHECK ADD  CONSTRAINT [Comments-User] FOREIGN KEY([userid])
REFERENCES [Sahartarin].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Comments-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Comments]'))
ALTER TABLE [Sahartarin].[Comments] CHECK CONSTRAINT [Comments-User]
GO
/****** Object:  ForeignKey [PopularLink-User]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[PopularLink-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[PopularLink]'))
ALTER TABLE [Sahartarin].[PopularLink]  WITH CHECK ADD  CONSTRAINT [PopularLink-User] FOREIGN KEY([UserId])
REFERENCES [Sahartarin].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[PopularLink-User]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[PopularLink]'))
ALTER TABLE [Sahartarin].[PopularLink] CHECK CONSTRAINT [PopularLink-User]
GO
/****** Object:  ForeignKey [Tag_Link-Links]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Links]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link]  WITH NOCHECK ADD  CONSTRAINT [Tag_Link-Links] FOREIGN KEY([linkid])
REFERENCES [Sahartarin].[Link] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Links]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link] NOCHECK CONSTRAINT [Tag_Link-Links]
GO
/****** Object:  ForeignKey [Tag_Link-Tags]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Tags]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link]  WITH NOCHECK ADD  CONSTRAINT [Tag_Link-Tags] FOREIGN KEY([tagid])
REFERENCES [Sahartarin].[Tags] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link-Tags]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Tag_Link]'))
ALTER TABLE [Sahartarin].[Tag_Link] NOCHECK CONSTRAINT [Tag_Link-Tags]
GO
/****** Object:  ForeignKey [Vote-Link]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes]  WITH CHECK ADD  CONSTRAINT [Vote-Link] FOREIGN KEY([Linkid])
REFERENCES [Sahartarin].[Link] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-Link]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes] CHECK CONSTRAINT [Vote-Link]
GO
/****** Object:  ForeignKey [Vote-user]    Script Date: 03/07/2011 00:12:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-user]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes]  WITH CHECK ADD  CONSTRAINT [Vote-user] FOREIGN KEY([Userid])
REFERENCES [Sahartarin].[User] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Sahartarin].[Vote-user]') AND parent_object_id = OBJECT_ID(N'[Sahartarin].[Votes]'))
ALTER TABLE [Sahartarin].[Votes] CHECK CONSTRAINT [Vote-user]
GO
