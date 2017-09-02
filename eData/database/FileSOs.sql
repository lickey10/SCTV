USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FileSOs]    Script Date: 12/10/2009 13:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileSOs](
	[OrderId] [int] NOT NULL,
	[FileId] [int] NOT NULL,
 CONSTRAINT [PK_FileSOs] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FileSOs]  WITH NOCHECK ADD  CONSTRAINT [FK_FileSOs_FileMetaData] FOREIGN KEY([FileId])
REFERENCES [dbo].[FileMetaData] ([FileId])
GO
ALTER TABLE [dbo].[FileSOs] CHECK CONSTRAINT [FK_FileSOs_FileMetaData]
GO
ALTER TABLE [dbo].[FileSOs]  WITH NOCHECK ADD  CONSTRAINT [FK_FileSOs_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[FileSOs] CHECK CONSTRAINT [FK_FileSOs_Orders]