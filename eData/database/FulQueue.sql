USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FulQueue]    Script Date: 12/10/2009 13:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FulQueue](
	[PriorityModelId] [int] NOT NULL,
	[RequestType] [varchar](50) NOT NULL,
	[QueueDate] [datetime] NOT NULL CONSTRAINT [DF_FulQueue_QueueDate]  DEFAULT (getdate()),
	[ScheduledDate] [datetime] NOT NULL CONSTRAINT [DF_FulQueue_ScheduledDate]  DEFAULT (getdate()),
	[Running] [bit] NOT NULL CONSTRAINT [DF_FulQueue_Running]  DEFAULT (0),
	[Done] [bit] NOT NULL CONSTRAINT [DF_FulQueue_Done]  DEFAULT (0),
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[JobId] [int] NULL,
	[ScoreFileName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FulQueue]  WITH NOCHECK ADD  CONSTRAINT [FK_FulQueue_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[FulQueue] CHECK CONSTRAINT [FK_FulQueue_PriorityModels]