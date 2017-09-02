USE [nexa_prod]
GO
/****** Object:  Table [dbo].[HistoricalJobs]    Script Date: 12/10/2009 13:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[HistoricalJobs](
	[DACID] [int] NOT NULL,
	[ProviderID] [numeric](6, 0) NOT NULL,
	[TKY] [varchar](8) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[HistoricalJobs] ADD [CustDataType] [char](1) NULL
ALTER TABLE [dbo].[HistoricalJobs] ADD [JobCatagroy] [int] NULL

GO
SET ANSI_PADDING OFF