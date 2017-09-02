USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Errorlog]    Script Date: 12/10/2009 13:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Errorlog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorDate] [datetime] NULL,
	[JobId] [int] NULL,
	[SelectorId] [int] NULL,
	[LoggingHost] [varchar](100) NULL,
	[Arguments] [varchar](500) NULL,
	[Message] [varchar](500) NULL,
	[StackTrace] [varchar](2000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF