USE [Asghari_Task1DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Severe_Deprivation]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----The number and percentage of severe deprivation in each country can be seen by gender.------------------------

CREATE procedure [dbo].[sp_Severe_Deprivation]
as
begin
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

----------Children who experience in one or more severe deprivation ---------------
if object_id('tempdb..#severely_deprived') is not null drop table #severely_deprived
select country_flg
,country
,male_severe_dep_cnt
,female_severe_dep_cnt
,(male_severe_dep_cnt+female_severe_dep_cnt) all_severe_dep_cnt 
into #severely_deprived
from
(select 
country_flg
,country
,sum(male_severe_dep_cnt)male_severe_dep_cnt
,sum(female_severe_dep_cnt)female_severe_dep_cnt
from 
(select country_flg
,country
,case when chsex_desc = 'male'   then  count(*) else 0 end male_severe_dep_cnt
,case when chsex_desc = 'female' then  count(*) else 0 end female_severe_dep_cnt
from  [dbo].[view_Severe_Deprivations_AllCountries]
where all_dep>1
--and country_flg=1
--and chsex=1--1155
--and chsex=2--1045
group by country_flg
,country
,chsex_desc)k
group by country_flg
,country)k1
-----The number and percentage of severe deprivation in each country can be seen by gender.------------------------
if object_id('Severe_Deprivation_Percentage') is not null drop table Severe_Deprivation_Percentage
select *
, cast (cast(male_severe_dep_cnt as decimal(38,2)) *100 / 
case when country_flg=1 then @cnt_Ethiopia
when country_flg=2 then @cnt_India
when country_flg=3 then @cnt_Peru
when country_flg=4 then @cnt_Vietnam
end as decimal(38,2)) male_severe_dep_perc
, cast (cast(female_severe_dep_cnt as decimal(38,2)) *100 / 
case when country_flg=1 then @cnt_Ethiopia
when country_flg=2 then @cnt_India
when country_flg=3 then @cnt_Peru
when country_flg=4 then @cnt_Vietnam
end as decimal(38,2)) female_severe_dep_perc
, cast (cast(all_severe_dep_cnt as decimal(38,2)) *100 / 
case when country_flg=1 then @cnt_Ethiopia
when country_flg=2 then @cnt_India
when country_flg=3 then @cnt_Peru
when country_flg=4 then @cnt_Vietnam
end as decimal(38,2)) all_severe_dep_perc
into [dbo].[Severe_Deprivation_Percentage]
from #severely_deprived
------------------------------------------

select * from [dbo].[Severe_Deprivation_Percentage]
order by all_severe_dep_perc desc
end
 
GO
