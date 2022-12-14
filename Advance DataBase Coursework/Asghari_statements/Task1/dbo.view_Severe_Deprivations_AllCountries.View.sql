USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_Severe_Deprivations_AllCountries]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_Severe_Deprivations_AllCountries]
as
select 
country_flg,country,childid,yc,cohort_type,chsex
,chsex_desc,Education,Food,Health,sanitation,Water
,Education+Food+Health+sanitation+Water All_Dep
from
(select country_flg,country,childid,yc,cohort_type,chsex,chsex_desc
,sum(case when dep_flg = 'E' then 1 else 0 end) Education
,sum(case when dep_flg = 'F' then 1 else 0 end) Food
,sum(case when dep_flg = 'H' then 1 else 0 end) Health
,sum(case when dep_flg = 'S' then 1 else 0 end) Sanitation
,sum(case when dep_flg = 'W' then 1 else 0 end) Water
from (
select 'E'Dep_flg,* from [dbo].[view_Severe_Education_Deprivation_AllCountries]
union all
select 'F'Dep_flg,* from [dbo].[view_Severe_Food_Deprivation_AllCountries]
union all
select 'H'Dep_flg,* from [dbo].[view_Severe_Health_Deprivation_AllCountries]
union all
select 'S'Dep_flg,* from [dbo].[view_Severe_Sanitation_Deprivation_AllCountries]
union all
select 'W'Dep_flg,* from [dbo].[view_Severe_Water_Deprivation_AllCountries]
)k
group by country_flg
,country,childid,yc,cohort_type,chsex,chsex_desc)k
GO
