USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_search_By_Crime_Level]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------search Crimes by Crime_Level (from 1 to 4 ) 
CREATE procedure [dbo].[sp_search_By_Crime_Level](@Crime_Level as tinyint)
--search Crimes by Crime_Level (from 1 to 4 )
--if all data are needed the parameter value have to be 99
--execute dbo.sp_search_By_Crime_Level 4

as 
Begin
select [city]
      ,[LSOA code]
      ,[LSOA name]
      ,[Persons]
      ,[MedianAge]
      ,[crime_cnt_2017]
      ,[crime_cnt_2018]
      ,[crime_cnt]
      ,[crime_rate]
	  ,[PerCapita]
      ,[Crime_level]
      ,[Age_Group]
from [dbo].[view_LSOAcode_Crime_Rate] a
where a.Crime_level=@Crime_Level --Displays a specific data.
or 99=@Crime_Level--Displays all data.
order by Crime_level desc, PerCapita desc,city
end 
GO
