USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_search_By_LSOAcode]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------Search crimes byLSOAcode---------------------------------------
CREATE procedure [dbo].[sp_search_By_LSOAcode](@LSOAcode as varchar(50))
--Search crimes byLSOAcode
--if all data are needed the parameter value have to be 'All'

--execute dbo.sp_search_By_LSOAcode 'E01005147'

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
where a.[LSOA code]=@LSOAcode  --Displays a specific data.
or 'All'=@LSOAcode--Displays all data.
order by Crime_level desc, PerCapita desc,city
end 
GO
