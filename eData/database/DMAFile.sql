USE [nexa_prod]
GO
/****** Object:  Table [dbo].[DMAFile]    Script Date: 12/10/2009 13:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMAFile](
	[DMAId] [int] NOT NULL,
	[DMAFile] [varchar](10) NOT NULL,
	[ControlDate] [datetime] NOT NULL,
	[StageVersion] [bit] NOT NULL,
	[DWVersion] [bit] NOT NULL,
	[ProdStartDate] [datetime] NULL,
	[ProdEndDate] [datetime] NULL,
	[Notes] [varchar](4000) NULL,
	[ProdVersion] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF