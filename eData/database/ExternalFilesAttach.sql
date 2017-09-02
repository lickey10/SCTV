USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ExternalFilesAttach]    Script Date: 12/10/2009 13:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalFilesAttach](
	[ExternalFileAttachId] [int] IDENTITY(1,1) NOT NULL,
	[PriorityModelId] [int] NOT NULL,
	[ExternalFileType] [char](1) NOT NULL,
	[ExternalFileName] [varchar](100) NOT NULL,
	[AttachFileName] [varchar](100) NOT NULL,
	[AttachUniqueFileName] [varchar](100) NOT NULL,
	[AttachFileDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExternalFilesAttach] PRIMARY KEY CLUSTERED 
(
	[ExternalFileAttachId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF