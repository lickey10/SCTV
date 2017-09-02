USE [nexa_prod]
GO
/****** Object:  Table [dbo].[DynamicAffinity]    Script Date: 12/10/2009 13:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DynamicAffinity](
	[PriorityModelId] [int] NOT NULL,
	[Revision] [tinyint] NOT NULL,
	[Type] [char](1) NOT NULL,
	[TargetID] [smallint] NOT NULL,
	[AffinityValue] [decimal](10, 8) NOT NULL,
 CONSTRAINT [PK_DynamicAffinity] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[Revision] ASC,
	[Type] ASC,
	[TargetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF