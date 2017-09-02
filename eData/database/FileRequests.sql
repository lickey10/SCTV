USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FileRequests]    Script Date: 12/10/2009 13:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileRequests](
	[PriorityModelId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NOT NULL,
	[SubmittedDate] [datetime] NULL,
	[SubmittedBy] [int] NULL,
	[CompletedDate] [datetime] NULL,
 CONSTRAINT [PK_FileRequests] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FileRequests]  WITH NOCHECK ADD  CONSTRAINT [FK_FileRequests_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[FileRequests] CHECK CONSTRAINT [FK_FileRequests_PriorityModels]