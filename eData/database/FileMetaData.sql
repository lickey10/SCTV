USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FileMetaData]    Script Date: 12/10/2009 13:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileMetaData](
	[FileLibraryFileId] [int] NOT NULL,
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_FileMetaData_CreatedDate]  DEFAULT (getdate()),
	[LastUpdatedBy] [int] NOT NULL,
	[RecordCount] [int] NULL,
	[FileType] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[HasLayout] [bit] NOT NULL CONSTRAINT [DF_FileMetaData_HasLayout]  DEFAULT (1),
	[DacId] [varchar](250) NULL,
	[MailingYear] [int] NULL,
	[MailingName] [varchar](250) NULL,
	[DateRange] [varchar](250) NULL,
	[Keycodes] [varchar](250) NULL,
	[Notes] [varchar](1000) NULL,
 CONSTRAINT [PK_FileMetaData] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FileMetaData]  WITH NOCHECK ADD  CONSTRAINT [FK_FileMetaData_FileLibraryFiles] FOREIGN KEY([FileLibraryFileId])
REFERENCES [dbo].[FileLibraryFiles] ([FileLibraryFileId])
GO
ALTER TABLE [dbo].[FileMetaData] CHECK CONSTRAINT [FK_FileMetaData_FileLibraryFiles]