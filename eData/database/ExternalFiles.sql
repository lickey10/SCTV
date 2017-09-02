USE [nexa_prod]
GO
/****** Object:  Table [dbo].[ExternalFiles]    Script Date: 12/10/2009 13:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalFiles](
	[PriorityModelId] [int] NOT NULL,
	[ExternalFileType] [char](1) NOT NULL,
	[ExternalFileName] [varchar](100) NOT NULL,
	[Layout] [varchar](50) NULL,
	[ExpectedDate] [datetime] NULL,
	[Source] [char](50) NULL,
	[LoyaltyCode] [varchar](50) NULL,
	[RecordType] [varchar](50) NULL,
	[NoRecord] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[ContactEMail] [varchar](50) NULL,
	[TransferType] [varchar](50) NULL,
	[DacId] [int] NULL,
	[ClientId] [varchar](50) NULL,
	[CustType] [varchar](50) NULL,
	[ExFileNotes] [varchar](500) NULL,
 CONSTRAINT [PK_ExternalFiles] PRIMARY KEY CLUSTERED 
(
	[PriorityModelId] ASC,
	[ExternalFileType] ASC,
	[ExternalFileName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ExternalFiles]  WITH NOCHECK ADD  CONSTRAINT [FK_ExternalFiles_PriorityModels] FOREIGN KEY([PriorityModelId])
REFERENCES [dbo].[PriorityModels] ([PriorityModelId])
GO
ALTER TABLE [dbo].[ExternalFiles] CHECK CONSTRAINT [FK_ExternalFiles_PriorityModels]