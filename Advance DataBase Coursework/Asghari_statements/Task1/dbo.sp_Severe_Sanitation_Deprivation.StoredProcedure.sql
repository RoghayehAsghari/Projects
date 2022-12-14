USE [Asghari_Task1DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Severe_Sanitation_Deprivation]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Severe_Sanitation_Deprivation]
--Exec [dbo].[sp_Severe_Sanitation_Deprivation] 
AS
BEGIN

-------------------How many children are there in each country?-----------------------------
declare @cnt_Ethiopia int =( select count(distinct childid) from [Ethiopia_constructed])--2999
declare @cnt_India int =( select count(distinct childid) from [India_constructed])--3019
declare @cnt_Peru int =( select count(distinct childid) from [Peru_constructed])--2766
declare @cnt_Vietnam int =( select count(distinct childid) from [Vietnam_constructed])--3000
/*select @cnt_Ethiopia '@cnt_Ethiopia'
,@cnt_India '@cnt_India'
,@cnt_Peru '@cnt_Peru'
,@cnt_Vietnam '@cnt_Vietnam'*/

declare @cnt_All int =( select @cnt_Ethiopia+@cnt_India+@cnt_Peru+@cnt_Vietnam)--11784
--------------------------------
if object_id ('dbo.[Severe_Sanitation_Deprivation_Percentage]') is not null 
drop table dbo.Severe_Sanitation_Deprivation_Percentage

select
country_flg
,country
,sum(male)male_cnt--count of males who suffer from malnutrition
,sum(female)female_cnt--count of females who suffer from malnutrition
,cast(0 as int) all_cnt--count of all genders

,cast(cast(sum(male)*100  as decimal(38,2))/ 
case when country_flg=1 then @cnt_Ethiopia
when country_flg=2 then @cnt_India
when country_flg=3 then @cnt_Peru
when country_flg=4 then @cnt_Vietnam
end as decimal(38,2))   male_perc--percentage of male is computed depending on the count of children in each country

,cast(cast(sum(female)*100 as decimal(38,2))/
case when country_flg=1 then @cnt_Ethiopia
when country_flg=2 then @cnt_India
when country_flg=3 then @cnt_Peru
when country_flg=4 then @cnt_Vietnam
end as decimal(38,2))  female_perc--percentage of female is computed depending on the count of children in each country

,cast(0 as decimal(38,2)) all_perc--percentage of all genders
into dbo.[Severe_Sanitation_Deprivation_Percentage]
from (
select distinct country_flg,country,childid
,case
when [chsex]=1 then 1 
else 0 end male

,case when [chsex]=2 then 1 
else 0 end female

from  [dbo].[view_Severe_Sanitation_Deprivation_AllCountries]
)k
group by country_flg,country

-------Update all_cnt and all_perc----------------
update dbo.Severe_Sanitation_Deprivation_Percentage
set all_cnt= male_cnt +female_cnt
	,all_perc = male_perc+female_perc

--------------------
select 
country
,male_cnt	
,female_cnt	
,all_cnt	
,male_perc	
,female_perc	
,all_perc
from dbo.Severe_Sanitation_Deprivation_Percentage
order by all_perc desc
end



GO
