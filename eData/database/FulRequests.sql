USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FulRequests]    Script Date: 12/10/2009 13:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FulRequests](
	[PriorityModelId] [int] NOT NULL,
	[RequestId] [tinyint] NOT NULL,
	[RequestedDate] [datetime] NOT NULL CONSTRAINT [DF_FulRequests_RequestedDate]  DEFAULT (getdate()),
	[RequestedBy] [int] NOT NULL,
	[SubmittedDate] [datetime] NULL,
	[SubmittedBy] [int] NULL,
	[FillStart] [datetime] NULL,
	[FillEnd] [datetime] NULL,
 CONSTRAINT [PK_FulRequests] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FulRequests]  WITH CHECK ADD  CONSTRAINT [FK_FulRequests_Fulfillments] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[Fulfillments] ([PriorityModelId])
GO
ALTER TABLE [dbo].[FulRequests] CHECK CONSTRAINT [FK_FulRequests_Fulfillments]