USE [nexa_prod]
GO
/****** Object:  Table [dbo].[GroupAccess]    Script Date: 12/10/2009 13:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupAccess](
	[GroupName] [varchar](50) NOT NULL,
	[Member] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF