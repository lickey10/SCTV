USE [nexa_prod]
GO
/****** Object:  Table [dbo].[GridDBVersion]    Script Date: 12/10/2009 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GridDBVersion](
	[GridName] [varchar](25) NOT NULL,
	[DBVersion] [varchar](10) NOT NULL,
	[ExtractType] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF