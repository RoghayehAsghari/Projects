USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrimeRate_By_City]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------CrimeRate by city name----------------------------------
CREATE procedure [dbo].[sp_CrimeRate_By_City](@City as varchar(50))
--if all data are needed the parameter value have to be 'All'
--execute dbo.sp_CrimeRate_By_City 'Salford'
--execute dbo.sp_CrimeRate_By_City 'All'
as 
Begin
declare @sum_cnt_greater_Manchester as decimal(38,2) =(select sum(crime_cnt) from [dbo].[view_LSOAcode_Crime_Rate])
if OBJECT_ID('[dbo].[view_LSOAcode_Crime_Rate_City]') is not null
drop table [dbo].[view_LSOAcode_Crime_Rate_City]
select city
,Persons
,[crime_cnt_2017]
,[crime_cnt_2018]
,crime_cnt
,cast(cast([crime_cnt_2018]-[crime_cnt_2017] as decimal(38,2))*100/[crime_cnt_2018]as decimal(38,2))Crime_Rate
,cast(cast(crime_cnt as decimal(38,2))*100/@sum_cnt_greater_Manchester as decimal(38,2))Crime_perc--percentage of crime
 into [dbo].[view_LSOAcode_Crime_Rate_City]
from 
(select 
city
,sum(isnull(Persons,0))Persons
,sum(isnull([crime_cnt_2017],0))[crime_cnt_2017]
,sum(isnull([crime_cnt_2018],0))[crime_cnt_2018]
,sum(isnull(crime_cnt,0))crime_cnt
from [dbo].[view_LSOAcode_Crime_Rate]
where city=@City --Displays a specific data.
or 'All'=@City--Displays all data.
group by  city
)k
order by cast(cast([crime_cnt_2018]-[crime_cnt_2017] as decimal(38,2))*100/[crime_cnt_2018]as decimal(38,2)) desc

select * from [dbo].[view_LSOAcode_Crime_Rate_City]
order by Crime_perc desc
end 
GO
