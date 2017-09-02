USE [nexa_prod]
GO
/****** Object:  Table [dbo].[FulKeycodes]    Script Date: 12/10/2009 13:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FulKeycodes](
	[PriorityModelId] [int] NOT NULL,
	[RequestId] [tinyint] NOT NULL,
	[Segment] [tinyint] NOT NULL,
	[Keycode] [varchar](20) NOT NULL,
	[PriorNewFlag] [char](1) NOT NULL CONSTRAINT [DF_FulKeycodes_PriorNewFlag]  DEFAULT ('N'),
	[MatchFlag] [char](1) NOT NULL CONSTRAINT [DF_FulKeycodes_Counts]  DEFAULT ('U'),
	[KeyIndex] [tinyint] NOT NULL CONSTRAINT [DF_FulKeycodes_KeyIndex]  DEFAULT (1),
	[NameReq] [int] NOT NULL,
	[Filled] [int] NULL,
	[Male] [int] NULL,
	[Female] [int] NULL,
	[FirstName] [int] NULL,
	[LastName] [int] NULL,
	[Address1] [int] NULL,
	[Address2] [int] NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Zip] [int] NULL,
	[Zip4] [int] NULL,
	[CustomerId] [int] NULL,
	[LoyaltyCode] [int] NULL,
	[CustomerType] [int] NULL,
 CONSTRAINT [PK_FulKeycodes] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[RequestId] ASC,
	[Segment] ASC,
	[Keycode] ASC,
	[PriorNewFlag] ASC,
	[MatchFlag] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FulKeycodes]  WITH CHECK ADD  CONSTRAINT [FK_FulKeycodes_FulRequests] FOREIGN KEY([PriorityModelId], [RequestId])
REFERENCES [dbo].[FulRequests] ([PriorityModelId], [RequestId])
GO
ALTER TABLE [dbo].[FulKeycodes] CHECK CONSTRAINT [FK_FulKeycodes_FulRequests]