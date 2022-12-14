USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_Severe_Education_Deprivation_AllCountries]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[view_Severe_Education_Deprivation_AllCountries]
as 

select distinct country_flg
,country
,childid
,yc
,cohort_type
,chsex
,chsex_desc from
(select country_flg
,country
,childid
,yc
,cohort_type
,chsex
,chsex_desc
,max(enrol)enrol
,max(hghgrade)hghgrade--the highest grade achieved
from [dbo].[view_AllCountries] b
where
age between 7 and 18
group by country_flg
,country
,childid
,yc
,cohort_type
,chsex
,chsex_desc)k
where enrol<>1--Child is currently enrolled=> who had never been to school
and hghgrade=0--Highest grade achieved at time of interview=>no professional education of any kind
--ethiopia:54
--India:30
--peru:52
--vietnam:61


GO
