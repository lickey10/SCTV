USE [nexa_prod]
GO
/****** Object:  Table [dbo].[AddInOrders]    Script Date: 12/10/2009 13:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddInOrders](
	[OrderId] [int] NOT NULL,
	[AppName] [varchar](50) NOT NULL,
	[UserContactId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL CONSTRAINT [DF_AddInOrders_StartTime]  DEFAULT (getdate()),
	[EndTime] [datetime] NULL,
	[CopyStart] [datetime] NULL,
	[CopyEnd] [datetime] NULL,
	[ErrorMessage] [varchar](50) NULL,
 CONSTRAINT [PK_AddInOrders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[AppName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AddInOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_AddInOrders_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[AddInOrders] CHECK CONSTRAINT [FK_AddInOrders_Orders]