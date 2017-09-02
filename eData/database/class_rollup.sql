USE [nexa_prod]
GO
/****** Object:  Table [dbo].[class_rollup]    Script Date: 12/10/2009 13:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[class_rollup](
	[class_rollup_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [numeric](10, 0) NOT NULL,
	[Type] [char](1) NOT NULL CONSTRAINT [DF_class_rollup_Type]  DEFAULT ('-'),
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[creator] [int] NOT NULL CONSTRAINT [DF_class_rollup_creator]  DEFAULT (0),
	[create_dt] [datetime] NOT NULL CONSTRAINT [DF_class_rollup_create_dt]  DEFAULT (getdate()),
	[release_dt] [datetime] NULL,
 CONSTRAINT [class_rollup_PK] PRIMARY KEY CLUSTERED 
(
	[class_rollup_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_class_rollup] UNIQUE NONCLUSTERED 
(
	[cat_id] ASC,
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF