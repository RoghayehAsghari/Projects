USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrimeRate_By_AgeGroup]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------CrimeRate by AgeGroup -----------------------------------------
CREATE procedure [dbo].[sp_CrimeRate_By_AgeGroup](@AgeGroup as varchar(50))
--if all data are needed the parameter value have to be 'All'----------------------
--execute dbo.sp_CrimeRate_By_AgrGroup 'All'
--execute dbo.sp_CrimeRate_By_AgrGroup '10'

as 
Begin
select 
Age_Group
,Persons
,[crime_cnt_2017]
,[crime_cnt_2018]
,crime_cnt
,cast(cast([crime_cnt_2018]-[crime_cnt_2017] as decimal(38,2))*100/[crime_cnt_2018]as decimal(38,2))Crime_Rate
 from 
(select 
Age_Group
,sum(isnull(Persons,0))Persons
,sum(isnull([crime_cnt_2017],0))[crime_cnt_2017]
,sum(isnull([crime_cnt_2018],0))[crime_cnt_2018]
,sum(isnull(crime_cnt,0))crime_cnt
from [dbo].[view_LSOAcode_Crime_Rate]
where Age_Group=@AgeGroup --Displays a specific data.
or 'All'=@AgeGroup--Displays all data.
group by Age_Group
)k
order by Age_Group
end 
GO
