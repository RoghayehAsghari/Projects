USE [Asghari_Task2DB]
GO
/****** Object:  Table [dbo].[Experienced_Qualified_Teacher]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experienced_Qualified_Teacher](
	[Group_Type] [varchar](9) NOT NULL,
	[SubGroup] [varchar](9) NULL,
	[University_Education] [decimal](38, 2) NULL,
	[Teacher_Training_Qualification] [decimal](38, 2) NULL,
	[Experience] [decimal](38, 2) NULL,
	[Experienced_Qualified_Teacher] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
