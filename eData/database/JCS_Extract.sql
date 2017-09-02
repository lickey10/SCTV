USE [nexa_prod]
GO
/****** Object:  Table [dbo].[JCS_Extract]    Script Date: 12/10/2009 14:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JCS_Extract](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [int] NULL,
	[NewDbVersion] [char](10) NULL,
	[OldDbVersion] [char](10) NULL,
	[DateKey] [varchar](8) NULL,
	[TxnAnalStart] [datetime] NULL,
	[TxnAnalEnd] [varchar](50) NULL,
	[fcivStart] [varchar](50) NULL,
	[fcivEnd] [varchar](50) NULL,
	[loadProviderAffinityStart] [varchar](50) NULL,
	[loadProviderAffinityEnd] [varchar](50) NULL,
	[dbAffinityStart] [varchar](50) NULL,
	[dbAffinityEnd] [varchar](50) NULL,
	[maxPID] [numeric](18, 0) NULL,
	[affinityCount] [int] NULL,
	[Message] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF