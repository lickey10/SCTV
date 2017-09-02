USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ContactCatalog]    Script Date: 12/10/2009 13:31:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactCatalog](
	[ParentID] [numeric](18, 0) NOT NULL,
	[ParentType] [Type] NOT NULL,
	[ContactID] [numeric](18, 0) NOT NULL,
	[ContactRole] [varchar](10) NOT NULL,
	[BeginDate] [datetime] NULL CONSTRAINT [DF__ContactCa__Begin__0E6E26BF]  DEFAULT (getdate()),
	[EndDate] [datetime] NULL,
	[NAPrimaryContact] [bit] NULL CONSTRAINT [DF_ContactCatalog_NAPrimaryContact]  DEFAULT (0),
 CONSTRAINT [PK_ContactCatalog] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC,
	[ParentType] ASC,
	[ContactID] ASC,
	[ContactRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF