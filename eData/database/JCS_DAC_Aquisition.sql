USE [nexa_prod]
GO
/****** Object:  Table [dbo].[JCS_DAC_Aquisition]    Script Date: 12/10/2009 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JCS_DAC_Aquisition](
	[DAID] [numeric](6, 0) IDENTITY(1,1) NOT NULL,
	[FileID] [numeric](6, 0) NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[FileType] [varchar](50) NOT NULL,
	[ProviderID] [numeric](6, 0) NOT NULL,
	[FileSize] [char](20) NULL CONSTRAINT [DF_JCS_DAC_Aquisition_FileSize]  DEFAULT (0),
	[CurrentState] [char](50) NULL,
	[DataAquisitionFile] [varchar](100) NULL,
	[DataAquisitionNotes] [numeric](6, 0) NULL,
 CONSTRAINT [PK_JCSDataAquisition] PRIMARY KEY CLUSTERED 
(
	[DAID] ASC,
	[FileID] ASC,
	[FileName] ASC,
	[FileType] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF