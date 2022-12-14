USE [Asghari_Task3DB]
GO
/****** Object:  View [dbo].[view_Anti_social_behaviour_Salford]    Script Date: 5/14/2022 11:05:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----LSOA code GeoLocation for Anti-social behaviour in Salford to show in the map
CREATE view [dbo].[view_Anti_social_behaviour_Salford]
WITH SCHEMABINDING
as

select  Id
,[Longitude]
,[Latitude]
,[GeoLocation]
,[LSOA code]
,[LSOA name]
,[Crime type]
,[Persons]
,[MedianAge] 
from [dbo].[Greater_Manchester_Street_LSOA]
where [Crime type]='Anti-social behaviour'
and left([LSOA name],charindex(' 0', [LSOA name])-1) ='Salford'
GO
