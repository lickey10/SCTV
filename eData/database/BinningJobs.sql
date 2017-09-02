USE [nexa_prod]
GO
/****** Object:  Table [dbo].[BinningJobs]    Script Date: 12/10/2009 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BinningJobs](
	[JCSJobId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[Model] [tinyint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_BinningJobs_CreatedDate]  DEFAULT (getdate()),
	[ProspectRevision] [tinyint] NULL,
	[MailedRevision] [tinyint] NULL,
	[OverlayRevision] [tinyint] NULL,
	[RunModeling] [char](1) NULL,
	[RootDir] [varchar](150) NULL,
	[ModelingSubDir] [varchar](150) NULL,
	[ScoringSubDir] [varchar](150) NULL,
	[TargetedMailingName] [varchar](150) NULL,
	[MailTapeFileName] [varchar](150) NULL,
	[ResponderFileName] [varchar](150) NULL,
	[OverlayFileName] [varchar](150) NOT NULL DEFAULT ('Dummy.csv'),
	[ModelingSimDateKey] [varchar](50) NULL,
	[ScoringSimDateKey] [varchar](50) NULL,
 CONSTRAINT [PK_BinningJobs] PRIMARY KEY CLUSTERED 
(
	[JCSJobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BinningJobs]  WITH NOCHECK ADD  CONSTRAINT [FK_BinningJobs_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[BinningJobs] CHECK CONSTRAINT [FK_BinningJobs_Orders]