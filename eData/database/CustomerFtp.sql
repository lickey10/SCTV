USE [nexa_prod]
GO
/****** Object:  Table [dbo].[CustomerFtp]    Script Date: 12/10/2009 13:32:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerFtp](
	[CustomerID] [numeric](6, 0) NOT NULL,
	[ProviderID] [numeric](4, 0) NULL,
	[BeginDate] [datetime] NULL CONSTRAINT [DF__CustomerF__Begin__56B3DD81]  DEFAULT (getdate()),
	[EndDate] [datetime] NULL,
	[ftpDirectoryName] [varchar](40) NOT NULL,
	[Username] [varchar](40) NOT NULL,
	[AccessCode] [varchar](40) NOT NULL,
 CONSTRAINT [PK_CustomerFtp] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CustomerFtp]  WITH NOCHECK ADD  CONSTRAINT [FK_CUSTOMER_CUSTOMERH_CUSTOMER] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerFtp] CHECK CONSTRAINT [FK_CUSTOMER_CUSTOMERH_CUSTOMER]