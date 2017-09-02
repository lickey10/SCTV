USE [nexa_prod]
GO
/****** Object:  Table [dbo].[CustomReports]    Script Date: 12/10/2009 13:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomReports](
	[ReportId] [int] NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Instruction] [varchar](500) NOT NULL,
	[Parm] [bit] NOT NULL,
	[Statement] [varchar](5000) NOT NULL,
	[Parse] [char](1) NOT NULL,
	[NeedQuote] [char](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF