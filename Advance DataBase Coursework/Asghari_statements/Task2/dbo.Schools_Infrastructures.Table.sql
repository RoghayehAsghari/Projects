USE [Asghari_Task2DB]
GO
/****** Object:  Table [dbo].[Schools_Infrastructures]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools_Infrastructures](
	[Group_Type] [varchar](9) NOT NULL,
	[SubGroup] [varchar](9) NULL,
	[electricity] [decimal](38, 2) NULL,
	[water] [decimal](38, 2) NULL,
	[library_] [decimal](38, 2) NULL,
	[internet] [decimal](38, 2) NULL,
	[computers] [decimal](38, 2) NULL,
	[NoNeed_major_repairs] [decimal](38, 2) NULL,
	[Schools_Infrastructures] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
