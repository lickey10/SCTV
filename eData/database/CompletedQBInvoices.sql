USE [nexa_prod]
GO
/****** Object:  Table [dbo].[CompletedQBInvoices]    Script Date: 12/10/2009 13:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompletedQBInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FulId] [varchar](255) NULL,
	[InvoiceNumber] [int] NOT NULL,
	[SalesOrder] [varchar](50) NULL,
	[Segment] [varchar](10) NULL,
	[KeyCode] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Rate] [money] NULL,
	[RatePercent] [varchar](50) NULL,
	[Amount] [money] NULL,
	[TxnID] [varchar](255) NULL,
	[TimeCreated] [datetime] NULL,
	[TimeModified] [datetime] NULL,
	[TxnNumber] [varchar](255) NULL,
	[ProviderID] [varchar](10) NULL,
	[ProviderName] [varchar](255) NULL,
	[TxnDate] [datetime] NULL,
	[IsPending] [varchar](255) NULL,
	[IsFinanceCharge] [varchar](255) NULL,
	[PONumber] [varchar](255) NULL,
	[Terms] [varchar](255) NULL,
	[DueDate] [datetime] NULL,
	[SalesRepInitials] [varchar](255) NULL,
	[FOB] [varchar](255) NULL,
	[ShipDate] [datetime] NULL,
	[ShipMethod] [varchar](255) NULL,
	[Subtotal] [money] NULL,
	[BalanceRemaining] [money] NULL,
	[Memo] [varchar](500) NULL,
	[IsPaid] [varchar](50) NULL,
	[IsToBePrinted] [varchar](50) NULL,
	[Broker] [varchar](100) NULL,
	[AccountManager] [varchar](50) NULL,
	[FullItemName] [varchar](100) NULL,
	[ItemNameDescription] [varchar](500) NULL,
	[Mailing] [varchar](50) NULL,
	[AppliedAmount] [money] NULL,
	[SalesTaxTotal] [money] NULL,
	[Owner] [int] NULL,
 CONSTRAINT [PK_CompletedQBInvoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF