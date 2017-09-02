USE [nexa_prod]
GO
/****** Object:  Table [dbo].[AddInModels]    Script Date: 12/10/2009 13:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddInModels](
	[OrderId] [int] NOT NULL,
	[FromPriorityModelId] [int] NOT NULL,
	[AppName] [varchar](50) NOT NULL,
	[ErrorCode] [int] NULL,
 CONSTRAINT [PK_AddInModels] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[FromPriorityModelId] ASC,
	[AppName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AddInModels]  WITH NOCHECK ADD  CONSTRAINT [FK_AddInModels_AddInOrders_OrderId] FOREIGN KEY([OrderId], [AppName])
REFERENCES [dbo].[AddInOrders] ([OrderId], [AppName])
GO
ALTER TABLE [dbo].[AddInModels] CHECK CONSTRAINT [FK_AddInModels_AddInOrders_OrderId]
GO
ALTER TABLE [dbo].[AddInModels]  WITH NOCHECK ADD  CONSTRAINT [FK_AddInModels_PriorityModels] FOREIGN KEY([FromPriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[AddInModels] CHECK CONSTRAINT [FK_AddInModels_PriorityModels]