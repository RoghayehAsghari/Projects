USE [Asghari_Task3DB]
GO
/****** Object:  View [dbo].[view_Vehicle_crime_Greater_Manchester]    Script Date: 5/14/2022 11:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LSOA code GeoLocation for Vehicle crime in Greater Manchester to show in the map
CREATE view [dbo].[view_Vehicle_crime_Greater_Manchester]
WITH SCHEMABINDING
as

select  Id
,[Longitude]
,[Latitude]
,[GeoLocation]
,[LSOA code]
,[LSOA name]
,Location
,[Crime type]
from [dbo].[Greater_Manchester_Street_LSOA]
where [Crime type]='Vehicle crime'
GO
