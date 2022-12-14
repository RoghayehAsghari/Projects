USE [Asghari_Task3DB]
GO
/****** Object:  Table [dbo].[Greater_Manchester_Street_LSOA]    Script Date: 5/14/2022 11:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Greater_Manchester_Street_LSOA](
	[Id] [int] NOT NULL,
	[Month] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[GeoLocation] [geography] NULL,
	[Location] [varchar](50) NULL,
	[LSOA code] [varchar](50) NULL,
	[LSOA name] [varchar](50) NULL,
	[Crime type] [varchar](500) NULL,
	[Last outcome category] [varchar](500) NULL,
	[Persons] [float] NULL,
	[Males] [float] NULL,
	[females] [float] NULL,
	[MedianAge] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
