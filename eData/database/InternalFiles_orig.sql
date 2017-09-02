USE [nexa_prod]
GO
/****** Object:  Table [dbo].[InternalFiles_orig]    Script Date: 12/10/2009 14:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InternalFiles_orig](
	[PriorityModelId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[InternalFileType] [char](1) NOT NULL,
	[SequenceId] [tinyint] NOT NULL,
	[AllRecords] [bit] NOT NULL,
	[MinDate] [datetime] NULL,
	[MaxDate] [datetime] NULL,
	[TxnTypes] [varchar](50) NULL,
	[ChannelCodes] [varchar](50) NULL,
	[PayTypes] [varchar](50) NULL,
	[CCTypes] [varchar](50) NULL,
 CONSTRAINT [PK_InternalFiles] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[ProviderId] ASC,
	[InternalFileType] ASC,
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[InternalFiles_orig]  WITH NOCHECK ADD  CONSTRAINT [FK_InternalFiles_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[InternalFiles_orig] CHECK CONSTRAINT [FK_InternalFiles_PriorityModels]