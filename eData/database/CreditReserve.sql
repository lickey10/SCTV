USE [nexa_prod]
GO
/****** Object:  Table [dbo].[CreditReserve]    Script Date: 12/10/2009 13:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditReserve](
	[ContactId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[CreditReserve] [int] NOT NULL,
 CONSTRAINT [PK_CreditReserve] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
