USE [nexa_prod]
GO
/****** Object:  Table [dbo].[HF_PID_DT_Wrk]    Script Date: 12/10/2009 13:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HF_PID_DT_Wrk](
	[PROVIDER_ID] [int] NULL,
	[MAX_TXN_DT] [datetime] NULL,
	[MAX_PROD_TXN_DT] [datetime] NULL,
	[EMAIL_CK] [bit] NULL
) ON [PRIMARY]
