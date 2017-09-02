USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ExistingFiles]    Script Date: 12/10/2009 13:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExistingFiles](
	[PriorityModelId] [int] NOT NULL,
	[ExistFileType] [char](1) NOT NULL,
	[OrderId] [int] NULL,
	[Priority] [int] NULL,
	[Model] [int] NULL,
	[DACId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ExistingFiles]  WITH NOCHECK ADD  CONSTRAINT [FK_ExistingFiles_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[ExistingFiles] CHECK CONSTRAINT [FK_ExistingFiles_PriorityModels]