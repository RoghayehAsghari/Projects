USE [Asghari_Task3DB]
GO
/****** Object:  Table [dbo].[Greater_Manchester_Street]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Greater_Manchester_Street](
	[Crime ID] [varchar](500) NULL,
	[Month] [varchar](50) NULL,
	[Reported by] [varchar](500) NULL,
	[Falls within] [varchar](500) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[LSOA code] [varchar](50) NULL,
	[LSOA name] [varchar](50) NULL,
	[Crime type] [varchar](500) NULL,
	[Last outcome category] [varchar](500) NULL,
	[Context] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GeoLocation] [geography] NULL,
 CONSTRAINT [PK_Id] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
