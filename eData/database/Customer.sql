USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/10/2009 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [numeric](6, 0) IDENTITY(421,1) NOT NULL,
	[CustomerName] [varchar](40) NOT NULL,
	[NoteGroupID] [numeric](18, 0) NULL,
	[ApprovedDate] [datetime] NULL,
	[ApprovedBy] [int] NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF