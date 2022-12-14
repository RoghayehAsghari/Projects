USE [Asghari_Task2DB]
GO
/****** Object:  Table [dbo].[Student_Achievement]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Achievement](
	[Group_Type] [varchar](9) NOT NULL,
	[SubGroup] [varchar](9) NULL,
	[No_repeated_Grades] [decimal](38, 2) NULL,
	[Transferable_skills] [decimal](38, 2) NULL,
	[ENG_Progress] [decimal](38, 2) NULL,
	[Math_Progress] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
