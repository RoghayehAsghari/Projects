USE [Asghari_Task3DB]
GO
/****** Object:  Table [dbo].[Mid_2020_All_Ages]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mid_2020_All_Ages](
	[LSOA Code] [nvarchar](255) NULL,
	[LSOA Name] [nvarchar](255) NULL,
	[LA Code (2018 boundaries)] [nvarchar](255) NULL,
	[LA name (2018 boundaries)] [nvarchar](255) NULL,
	[LA Code (2021 boundaries)] [nvarchar](255) NULL,
	[LA name (2021 boundaries)] [nvarchar](255) NULL,
	[Persons] [float] NULL,
	[Males] [float] NULL,
	[females] [float] NULL,
	[MedianAge] [float] NULL
) ON [PRIMARY]
GO
