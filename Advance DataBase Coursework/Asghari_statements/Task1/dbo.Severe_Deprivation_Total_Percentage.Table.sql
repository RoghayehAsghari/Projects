USE [Asghari_Task1DB]
GO
/****** Object:  Table [dbo].[Severe_Deprivation_Total_Percentage]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severe_Deprivation_Total_Percentage](
	[Deprivation] [varchar](28) NOT NULL,
	[Deprivation_percentage] [decimal](38, 2) NULL
) ON [PRIMARY]
GO
