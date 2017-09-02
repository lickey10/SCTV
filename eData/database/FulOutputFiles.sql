USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FulOutputFiles]    Script Date: 12/10/2009 13:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FulOutputFiles](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[OutputFileName] [varchar](200) NOT NULL,
	[TotalRecords] [int] NOT NULL DEFAULT (0),
	[FileCreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ShippedDate] [datetime] NULL,
	[ShippedBy] [int] NULL,
 CONSTRAINT [PK_FulOutputFiles] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF