USE [nexa_prod]
GO
/****** Object:  Table [dbo].[InternalFilesToOutput]    Script Date: 12/10/2009 14:00:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalFilesToOutput](
	[InternalFilesID] [int] NOT NULL,
	[InternalFilesOutputID] [int] NOT NULL,
 CONSTRAINT [PK_InternalFilesToOutput] PRIMARY KEY CLUSTERED 
(
	[InternalFilesID] ASC,
	[InternalFilesOutputID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[InternalFilesToOutput]  WITH CHECK ADD  CONSTRAINT [FK_InternalFilesToOutput_InternalFiles] FOREIGN KEY([InternalFilesID])
REFERENCES [dbo].[InternalFiles] ([InternalFilesID])
GO
ALTER TABLE [dbo].[InternalFilesToOutput] CHECK CONSTRAINT [FK_InternalFilesToOutput_InternalFiles]
GO
ALTER TABLE [dbo].[InternalFilesToOutput]  WITH CHECK ADD  CONSTRAINT [FK_InternalFilesToOutput_InternalFilesOutput] FOREIGN KEY([InternalFilesOutputID])
REFERENCES [dbo].[InternalFilesOutput] ([InternalFilesOutputID])
GO
ALTER TABLE [dbo].[InternalFilesToOutput] CHECK CONSTRAINT [FK_InternalFilesToOutput_InternalFilesOutput]