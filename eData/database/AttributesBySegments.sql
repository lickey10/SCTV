USE [nexa_prod]
GO
/****** Object:  Table [dbo].[AttributesBySegments]    Script Date: 12/10/2009 13:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributesBySegments](
	[JobID] [int] NOT NULL,
	[Segment] [int] NOT NULL,
	[RspRate] [float] NULL,
	[CumRspRate] [float] NULL,
	[AvgRecency] [int] NULL,
	[AvgNumTxn] [int] NULL,
	[AvgDollars] [int] NULL,
	[AvgItems] [int] NULL,
 CONSTRAINT [PK_AttributesBySegments] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[Segment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AttributesBySegments]  WITH CHECK ADD  CONSTRAINT [FK_AttributesBySegments_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[AttributesBySegments] CHECK CONSTRAINT [FK_AttributesBySegments_Jobs]