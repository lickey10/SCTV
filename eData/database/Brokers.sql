USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Brokers]    Script Date: 12/10/2009 13:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brokers](
	[PID] [int] NULL,
	[Partner] [varchar](255) NULL,
	[Agreement] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF