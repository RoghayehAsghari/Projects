USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_Severe_Sanitation_Deprivation_AllCountries]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[view_Severe_Sanitation_Deprivation_AllCountries]
as 

select distinct  
country_flg
,country
,childid
,yc
,cohort_type
,chsex
,chsex_desc
from [dbo].[view_AllCountries]
where toiletq=0---toiletq=1=>-Access to sanitation



GO
