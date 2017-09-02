USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ClientDataLookup]    Script Date: 12/10/2009 13:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientDataLookup](
	[GroupName] [varchar](50) NOT NULL,
	[ID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[ShortCode] [varchar](50) NULL,
	[Used] [bit] NOT NULL CONSTRAINT [DF_ClientDataLookup_Used]  DEFAULT (1),
	[CanCreateSO] [bit] NOT NULL CONSTRAINT [DF_CanCreateSO]  DEFAULT (0)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF