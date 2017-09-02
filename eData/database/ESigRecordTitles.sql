USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ESigRecordTitles]    Script Date: 12/10/2009 13:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESigRecordTitles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContractIssuedTo] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ContactRole] [varchar](10) NOT NULL,
	[BadEmailFL] [bit] NOT NULL CONSTRAINT [DF_ESigRecordTitles_BadEmailFl]  DEFAULT (0)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF