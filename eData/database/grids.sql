USE [nexa_prod]
GO
/****** Object:  Table [dbo].[grids]    Script Date: 12/10/2009 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grids](
	[GridName] [varchar](25) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Description] [varchar](50) NULL,
	[MaxJobs] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Comment] [varchar](50) NULL,
	[AutoPullExtract] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF