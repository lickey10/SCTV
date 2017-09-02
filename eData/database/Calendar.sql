USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 12/10/2009 13:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calendar](
	[CalendarDate] [datetime] NOT NULL,
	[IsWeekend] [int] NOT NULL,
	[IsHoliday] [int] NOT NULL,
	[Descript] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF