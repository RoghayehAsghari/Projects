USE [Asghari_Task3DB]
GO
/****** Object:  Table [dbo].[view_LSOAcode_Crime_Rate_City]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view_LSOAcode_Crime_Rate_City](
	[city] [varchar](50) NULL,
	[Persons] [float] NULL,
	[crime_cnt_2017] [int] NULL,
	[crime_cnt_2018] [int] NULL,
	[crime_cnt] [int] NULL,
	[Crime_Rate] [decimal](38, 2) NULL,
	[Crime_perc] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
