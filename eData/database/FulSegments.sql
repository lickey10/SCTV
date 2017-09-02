USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FulSegments]    Script Date: 12/10/2009 13:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FulSegments](
	[PriorityModelId] [int] NOT NULL,
	[Segment] [tinyint] NOT NULL,
	[TotalAvailable] [int] NOT NULL CONSTRAINT [DF_FulSegments_TotalAvailable]  DEFAULT (0),
	[NewAvailable]  AS ([TotalAvailable] - [PUAvailable]),
	[PUAvailable] [int] NOT NULL CONSTRAINT [DF_FulSegments_PUAvailable]  DEFAULT (0),
	[NewMatchCounts] [int] NOT NULL CONSTRAINT [DF_FulSegments_MatchlCounts]  DEFAULT (0),
	[PUMatchCounts] [int] NOT NULL CONSTRAINT [DF_FulSegments_UnmatchCounts]  DEFAULT (0),
	[MatchSegment] [bit] NULL,
 CONSTRAINT [PK_FulSegments] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[Segment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FulSegments]  WITH CHECK ADD  CONSTRAINT [FK_FulSegments_Fulfillments] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[Fulfillments] ([PriorityModelId])
GO
ALTER TABLE [dbo].[FulSegments] CHECK CONSTRAINT [FK_FulSegments_Fulfillments]