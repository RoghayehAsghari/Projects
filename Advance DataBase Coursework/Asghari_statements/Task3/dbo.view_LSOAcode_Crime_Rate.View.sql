USE [Asghari_Task3DB]
GO
/****** Object:  View [dbo].[view_LSOAcode_Crime_Rate]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[view_LSOAcode_Crime_Rate]
as
select city,[LSOA code],[LSOA name],Persons,MedianAge,crime_cnt_2017,crime_cnt_2018,crime_cnt,PerCapita
,case when isnull(crime_cnt_2018,0)<>0 then 
cast(cast(isnull(crime_cnt_2018,0)-isnull(crime_cnt_2017,0) as decimal(38,2))*100/isnull(crime_cnt_2018,0)as decimal(38,2))
else 0 end [crime_rate] --the crime growth rate in 2018 compared to 2017 
,case when PerCapita < 0.01 then 0 
when PerCapita  >= 0.01 and PerCapita <1.00 then 1
when PerCapita >= 1.00 and PerCapita <2.00 then 2
when PerCapita >= 2.00 and PerCapita <3.00 then 3
when PerCapita >= 3.00  then 4
end Crime_level----Level of of number of crime per person between  2017 and 2018
,case when MedianAge <20 then '10'
when MedianAge >=20 and MedianAge <30 then '20'
when MedianAge >=30 and MedianAge <40 then '30'
when MedianAge >=40 and MedianAge <50 then '40'
when MedianAge >=50 and MedianAge <60 then '50'
when MedianAge >=60 and MedianAge <70 then '60'
when MedianAge >=70 then '70'
end Age_Group--Age groups based on MedianAge in each SLOA Code
from(select left([LSOA name],charindex(' 0', [LSOA name])-1) city--The city name 
,a.[LSOA code],a.[LSOA name],Persons,MedianAge
,sum(crime_cnt_2017)crime_cnt_2017--The number of crime in 2017
,sum(crime_cnt_2018)crime_cnt_2018--The number of crime in 2018
,sum(crime_cnt)crime_cnt --The number of crime between 2017 and 2018
,cast(cast(sum(crime_cnt) as decimal(38,2))/Persons as decimal(38,2)) PerCapita--the number of crime per person between  2017 and 2018
from (select  a.[LSOA code]
,a.[LSOA name]
,Persons--All popolation
,Males--The number of Males in each SLOA Code
,females--The number of Males in each SLOA Code	
,MedianAge--The median age in each SLOA Code	
,case when left(Month,4)='2017' then count([crime type]) else 0 end crime_cnt_2017--The number of crime in 2017
,case when left(Month,4)='2018' then count([crime type]) else 0 end crime_cnt_2018--The number of crime in 2018
,count([crime type])crime_cnt--The number of crime between 2017 and 2018
  from [dbo].[Greater_Manchester_Street_LSOA] a
  group by a.[LSOA code],a.[LSOA name]
,Persons
,Males
,females	
,MedianAge,Month)a
group by left([LSOA name],charindex(' 0', [LSOA name])-1) 
,a.[LSOA code],a.[LSOA name],Persons,MedianAge)k
GO
