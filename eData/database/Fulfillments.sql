USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Fulfillments]    Script Date: 12/10/2009 13:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fulfillments](
	[PriorityModelId] [int] NOT NULL,
	[FinalRevision] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Fulfillments_CreatedDate]  DEFAULT (getdate()),
	[InitStart] [datetime] NULL,
	[InitEnd] [datetime] NULL,
	[CountStart] [datetime] NULL,
	[CountEnd] [datetime] NULL,
	[TableName] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Seeded] [bit] NOT NULL CONSTRAINT [DF_Fulfillments_Seeded]  DEFAULT (0),
	[MatchType] [varchar](50) NULL,
	[NCOATime] [datetime] NOT NULL CONSTRAINT [NCOATime_Default]  DEFAULT (getdate()),
	[Score] [char](1) NULL,
 CONSTRAINT [PK_Fulfillments] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Fulfillments]  WITH NOCHECK ADD  CONSTRAINT [FK_Fulfillments_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[Fulfillments] CHECK CONSTRAINT [FK_Fulfillments_PriorityModels]