USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_search_By_AgeGroup]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------search Crimes by AgeGroup -----------------------------------------
CREATE procedure [dbo].[sp_search_By_AgeGroup](@AgeGroup as varchar(50))
--search Crimes by AgeGroup
--if all data are needed the parameter value have to be 'All'----------------------

--execute dbo.sp_search_By_AgrGroup 'All'

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
from [dbo].[view_LSOAcode_Crime_Rate] a --Age_Groupdbo.view_LSOAcode_Frequency a
where a.Age_Group=@AgeGroup --Displays a specific data.
or 'All'=@AgeGroup--Displays all data.
order by Crime_level desc, PerCapita desc,city
end 
GO
