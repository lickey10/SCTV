USE [nexa_prod]
GO
/****** Object:  Table [dbo].[InternalFilesOutput]    Script Date: 12/10/2009 14:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InternalFilesOutput](
	[InternalFilesOutputID] [int] IDENTITY(1,1) NOT NULL,
	[OutputFileName] [varchar](256) NOT NULL,
	[FilePath] [varchar](256) NOT NULL,
	[UsageTypeID] [int] NOT NULL,
	[PriorityModelID] [int] NOT NULL,
	[InternalFileTypeID] [int] NOT NULL,
	[FileApplicationLevel] [int] NOT NULL,
	[SubmittedDate] [datetime] NULL,
	[SubmittedBy] [int] NULL,
	[StartedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[JobID] [int] NULL,
	[OutputFileStatusID] [int] NULL,
	[LastJobMessage] [varchar](1024) NULL,
	[AddToOverlayTiming] [bit] NOT NULL CONSTRAINT [DF_InternalFilesOutput_AddToOverlayTiming]  DEFAULT (1),
	[IsRecActive] [bit] NOT NULL,
 CONSTRAINT [PK_InternalFilesOutput] PRIMARY KEY CLUSTERED 
(
	[InternalFilesOutputID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF