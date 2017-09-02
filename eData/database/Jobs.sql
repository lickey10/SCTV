USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/10/2009 14:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[PriorityModelId] [int] NOT NULL,
	[Revision] [tinyint] NOT NULL,
	[JobType] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ScheduledDate] [datetime] NULL,
	[Canceled] [bit] NOT NULL DEFAULT (0),
	[GridServerName] [varchar](8) NULL,
	[ExtractVersion] [varchar](10) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ErrorCode] [int] NULL,
	[SelectorStart] [datetime] NULL,
	[SelectorEnd] [datetime] NULL,
	[Responders] [int] NULL,
	[NonResponders] [int] NULL,
	[ExpResponders] [int] NULL,
	[ExpNonResponders] [int] NULL,
	[NthorStart] [datetime] NULL,
	[NthorEnd] [datetime] NULL,
	[ModelStart] [datetime] NULL,
	[ModelEnd] [datetime] NULL,
	[ScorerStart] [datetime] NULL,
	[ScorerEnd] [datetime] NULL,
	[RespondersBackEnd] [int] NULL DEFAULT (0),
	[NonRespondersBackEnd] [int] NULL DEFAULT (0),
	[GridType]  AS ([dbo].[getGridType]([PriorityModelId])),
	[JCS_JOB_ID] [int] NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_jobs_JobTypes] FOREIGN KEY([JobType])
REFERENCES [dbo].[JobTypes] ([JobType])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_jobs_JobTypes]
GO
ALTER TABLE [dbo].[Jobs]  WITH NOCHECK ADD  CONSTRAINT [FK_jobs_Revisions] FOREIGN KEY([PriorityModelId], [Revision])
REFERENCES [dbo].[Revisions] ([PriorityModelId], [Revision])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_jobs_Revisions]