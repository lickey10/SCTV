USE [nexa_prod]
GO
/****** Object:  Table [dbo].[GridJob]    Script Date: 12/10/2009 13:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GridJob](
	[GridName] [varchar](50) NOT NULL,
	[JobType] [int] NOT NULL,
	[JobName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF