USE [nexa_prod]
GO
/****** Object:  Table [dbo].[JCS_DAC_File]    Script Date: 12/10/2009 14:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JCS_DAC_File](
	[FileID] [numeric](6, 0) IDENTITY(100,1) NOT NULL,
	[FileName] [varchar](250) NOT NULL,
	[CustomerID] [numeric](6, 0) NOT NULL,
	[OuterReceivedDate] [datetime] NOT NULL,
	[CurrentState] [char](50) NULL,
	[InnerReceivedDate] [datetime] NULL,
	[ReleaseDate] [datetime] NULL,
	[FileSize] [char](20) NULL,
	[FileAquisitionNotes] [numeric](6, 0) NULL,
	[VerifyStart] [datetime] NULL,
	[VerifyEnd] [datetime] NULL,
 CONSTRAINT [PK_JCSFileAquisition] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC,
	[FileName] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF