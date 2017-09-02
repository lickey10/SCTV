USE [nexa_prod]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/10/2009 13:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [numeric](18, 0) IDENTITY(826,1) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](30) NULL,
	[Title] [varchar](40) NULL,
	[Company] [varchar](40) NULL,
	[Address1] [varchar](40) NULL,
	[Address2] [varchar](40) NULL,
	[Address3] [varchar](40) NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL,
	[Zipcode] [char](5) NULL,
	[Zip4] [char](4) NULL,
	[ContactMethod] [varchar](10) NULL CONSTRAINT [DF_Contact_ContactMethod]  DEFAULT ('Phone'),
	[Email] [varchar](50) NULL,
	[OfficePhone] [PhoneNumber] NULL,
	[HomePhone] [PhoneNumber] NULL,
	[FAX] [PhoneNumber] NULL,
	[MobilePhone] [PhoneNumber] NULL,
	[Pager] [PhoneNumber] NULL,
	[NAFlag] [FlagField] NULL CONSTRAINT [DF_Contact_NAFlag]  DEFAULT ('N'),
	[SysID] [varchar](140) NULL,
	[NoteGroupID] [numeric](10, 0) NULL CONSTRAINT [DF__Contact__NoteCou__0B91BA14]  DEFAULT (0),
 CONSTRAINT [PK_CONTACT] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF