USE [nexa_prod]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 12/10/2009 14:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTypes](
	[JobType] [int] NOT NULL,
	[JobExecutionType] [varchar](50) NOT NULL,
	[JobDescription] [varchar](100) NULL,
	[JobShortDescription] [varchar](15) NULL,
	[JobPriority] [int] NOT NULL DEFAULT (100),
 CONSTRAINT [PK_JobType] PRIMARY KEY CLUSTERED 
(
	[JobType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF