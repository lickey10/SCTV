USE [nexa_prod]
GO
/****** Object:  Table [dbo].[GlobalConfig]    Script Date: 12/10/2009 13:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GlobalConfig](
	[Key] [varchar](200) NOT NULL,
	[Value] [varchar](400) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF