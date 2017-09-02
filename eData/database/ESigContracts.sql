USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ESigContracts]    Script Date: 12/10/2009 13:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESigContracts](
	[ContractIssuedTo] [int] NOT NULL,
	[ContractKey] [uniqueidentifier] NOT NULL,
	[ContractType] [varchar](50) NULL,
	[ContractDateIssued] [datetime] NULL,
	[ContractSent] [bit] NULL CONSTRAINT [DF_ESigContracts_ContractSent]  DEFAULT (0),
	[ContractEmailRead] [datetime] NULL,
	[ContractDateRead] [datetime] NULL,
	[ContractDateAccepted] [datetime] NULL,
	[ContractDateDeclined] [datetime] NULL,
	[ESigFirstName] [varchar](100) NULL,
	[ESigLastName] [varchar](100) NULL,
	[ESigTitle] [varchar](100) NULL,
	[ESigEmail] [varchar](250) NULL,
	[ESigIP] [varchar](25) NULL,
	[ConfirmationNumber] [int] IDENTITY(5000,1) NOT NULL,
	[ConfirmationSent] [bit] NULL CONSTRAINT [DF_ESigContracts_ConfirmationSent]  DEFAULT (0),
	[OptedOut] [bit] NULL CONSTRAINT [DF_ESigContracts_OptedOut]  DEFAULT (0),
	[SnailMailSent] [datetime] NULL,
 CONSTRAINT [PK_ESigContracts] PRIMARY KEY CLUSTERED 
(
	[ContractIssuedTo] ASC,
	[ContractKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF