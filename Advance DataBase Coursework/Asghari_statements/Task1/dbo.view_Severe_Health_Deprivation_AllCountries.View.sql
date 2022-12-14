USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_Severe_Health_Deprivation_AllCountries]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[view_Severe_Health_Deprivation_AllCountries]
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
where 
(age>0 and age<5 
and ( bcg<>1 and 	measles<>1 and 	dpt<>1 and 	polio<>1 and hib<>1 ) 
)--children who had not been immunised against any diseases--445
or 
(age>=5 and chmightdie =1)--young children who had a recent illness--624
--2794
GO
