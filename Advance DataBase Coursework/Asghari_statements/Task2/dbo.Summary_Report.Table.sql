USE [Asghari_Task2DB]
GO
/****** Object:  Table [dbo].[Summary_Report]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary_Report](
	[Group_Type] [varchar](9) NOT NULL,
	[SubGroup] [varchar](9) NULL,
	[Schools_Infrastructures] [decimal](38, 2) NULL,
	[Experienced_Qualified_Teacher] [decimal](38, 2) NULL,
	[ENG_Progress] [decimal](38, 2) NULL,
	[Math_Progress] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
