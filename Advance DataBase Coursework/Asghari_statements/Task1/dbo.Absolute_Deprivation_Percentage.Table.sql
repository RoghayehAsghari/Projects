USE [Asghari_Task1DB]
GO
/****** Object:  Table [dbo].[Absolute_Deprivation_Percentage]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absolute_Deprivation_Percentage](
	[country_flg] [int] NOT NULL,
	[country] [varchar](8) NOT NULL,
	[male_absolute_dep_cnt] [int] NULL,
	[female_absolute_dep_cnt] [int] NULL,
	[all_absolute_dep_cnt] [int] NULL,
	[male_absolute_dep_perc] [decimal](38, 2) NULL,
	[female_absolute_dep_perc] [decimal](38, 2) NULL,
	[all_absolute_dep_perc] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
