USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Affiliates]    Script Date: 12/10/2009 13:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affiliates](
	[FileId] [int] NOT NULL,
	[ProviderId] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Affiliates] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[ProviderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Affiliates]  WITH NOCHECK ADD  CONSTRAINT [FK_Affiliates_FileMetaData] FOREIGN KEY([FileId])
REFERENCES [dbo].[FileMetaData] ([FileId])
GO
ALTER TABLE [dbo].[Affiliates] CHECK CONSTRAINT [FK_Affiliates_FileMetaData]
GO
ALTER TABLE [dbo].[Affiliates]  WITH NOCHECK ADD  CONSTRAINT [FK_Affiliates_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[Affiliates] CHECK CONSTRAINT [FK_Affiliates_Provider]