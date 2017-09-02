USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FileLibraryFiles]    Script Date: 12/10/2009 13:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileLibraryFiles](
	[CustomerId] [numeric](6, 0) NOT NULL,
	[FileLibraryFileId] [int] IDENTITY(1,1) NOT NULL,
	[FileFolder] [varchar](50) NOT NULL,
	[FileSubPath] [varchar](500) NOT NULL,
	[FileCreatedDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_FileLibraryFiles_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_FileLibraryFiles] PRIMARY KEY CLUSTERED 
(
	[FileLibraryFileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FileLibraryFiles]  WITH NOCHECK ADD  CONSTRAINT [FK_FileLibraryFiles_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[FileLibraryFiles] CHECK CONSTRAINT [FK_FileLibraryFiles_Customer]