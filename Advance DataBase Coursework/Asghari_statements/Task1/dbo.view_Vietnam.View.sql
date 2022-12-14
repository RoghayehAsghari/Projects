USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_Vietnam]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[view_Vietnam]
as

select 4 country_flg ,
'Vietnam' country,
[childid]
,[yc]
,case 
when [yc]=0 then'Older cohort'
when [yc]=1 then'Younger cohort'
else 'unknown'
end [cohort_type]
,[round]
,[inround]
,case 
when [inround]=0 then'no'
when [inround]=1 then'yes'
else 'unknown'
end [inround_desc]
,deceased
,[panel12345]
,[typesite]
,case when [typesite]=1 then 'urban'
when [typesite]=2 then 'rural'
else 'unknown'
end [typesite_desc]
,[childloc]
,[chsex]
,case
when [chsex]=1 then 'male'
when [chsex]=2 then 'female'
else 'unknown'
end [chsex_desc]
,[agemon]--Child's age – in months
,[dbo].[Convert_agemon]([agemon])age--user defined function to convert age in month to age  in year
,[underweight]--low weight for age
,[stunting]--short height for age
,[thinness]--low BMI for age
,case when [underweight] = 0 then 'not'
when [underweight] =1 then 'moderate'
when [underweight]=2 then 'severe'
end [underweight_desc]

,case when [stunting] = 0 then'not'
when [stunting] =1 then'moderate'
when [stunting]=2 then'severe'
end [stunting_desc]

,case when [thinness] = 0 then'not'
when [thinness] =1 then'moderate'
when [thinness]=2 then'severe'
end [thinness_desc]
------Water Deprivation----------
,drwaterq
------Sanitation Facilities-----
,toiletq
/*-------------------Birth and immunisation variables*/
/*-------------------Birth and immunisation variables*/
/*-------------------Birth and immunisation variables*/
/*-------------------Birth and immunisation variables*/
,bcg	
,measles
,dpt
,polio
,hib
/*-------------------Child’s health and well-being------------------*/
/*-------------------Child’s health and well-being------------------*/
/*-------------------Child’s health and well-being------------------*/
/*-------------------Child’s health and well-being------------------*/
,chmightdie --Child has had serious injury/illness since last round when caregiver thought child might die
,chillness --Child has had serious illness since last round
,chinjury --Child has had serious injury since last round
,chhprob --Child has long-term health problem
,chdisability --Child has a permanent disability
,chdisscale --Permanent disability scale
/*chdisscale,
Value = 0.0	Label = Able to work same as others of this age
	Value = 1.0	Label = Capable of most types of full-time work but some difficulty with physical work
	Value = 2.0	Label = Able to work full-time but only work requiring no physical activity
	Value = 3.0	Label = Can only do light work on a part-time basis
	Value = 4.0	Label = Cannot work but able to care for themselves (e.g. dress themselves, etc.)
	Value = 5.0	Label = Cannot work and needs help with daily activities such as dressing, washing, etc.
	Value = 6.0	Label = Other

*/
 ,chhrel--Child's health compared to peers
 /*
Value = 1.0	Label = Same
Value = 2.0	Label = Better
Value = 3.0	Label = Worse
*/
,chhealth--Child's health in general
/*
Value = 1.0	Label = very poor
	Value = 2.0	Label = poor
	Value = 3.0	Label = average
	Value = 4.0	Label = good
	Value = 5.0	Label = very good
*/
,cladder  -- Child's subjective well-being (nine-step ladder)
/*9 represents the ‘best
possible life’ and 1 ‘the worst possible life’
*/

/*-----------------------Smoking and drinking habits and reproductive health knowledge variables*/
/*-----------------------Smoking and drinking habits and reproductive health knowledge variables*/
/*-----------------------Smoking and drinking habits and reproductive health knowledge variables*/
/*-----------------------Smoking and drinking habits and reproductive health knowledge variables*/

,chsmoke --Child's frequency of smoking
,chalcohol --Child consumes alcohol every day or at least once a week
,chrephealth1 --Child's knowledge of reproductive health
,chrephealth2 --Child knows condom can prevent disease through sex
,chrephealth3 --Child knows healthy-looking person can pass on a disease through sex
,chrephealth4 --Child's source of condom
/*-----------------------Education and skills------------*/
/*-----------------------Education and skills------------*/
/*-----------------------Education and skills------------*/
/*-----------------------Education and skills------------*/
,preprim --Child has attended pre-primary school
,agegr1 --Age at start of Grade 1
,enrol --Enrolled in formal school during survey year
,case
when enrol=0 then 'no'
when enrol=1 then 'yes'
when enrol=99 then 'missing'
when enrol= 77 then 'nk'
when enrol= 88 then 'n/a'
else ''
end enrol_desc
,engrade --Grade enrolled during survey year
,entype --Type of school enrolled during survey year
,hghgrade --Highest grade completed at time of interview
,timesch --Travel time to school (in minutes)
,levlread --Child's reading level
,case 
when levlread= 1 then 'cant read anything'
when levlread= 2 then 'reads letters'
when levlread= 3 then 'reads word'
when levlread= 4 then 'reads sentence'
else ''
end readng_skill
,levlwrit --Child's writing level
,case 
when levlwrit= 1 then 'no'
when levlwrit= 2 then 'yes with difficulty or errors'
when levlwrit= 3 then 'yes without difficulty or errors'
else ''
end writing_skill
,literate --Child can read and write a sentence without difficulty
from [Asghari_Task1DB].[dbo].[Vietnam_constructed] e 
where [inround]=1
/*union all
select * from [Asghari_Task1DB].[dbo].[Vietnam_constructed] e where [inround]=1
union all
select * from [Asghari_Task1DB].[dbo].[Peru_constructed] e where [inround]=1
union all
select * from [Asghari_Task1DB].[dbo].[vietnam_constructed] e where [inround]=1
)k*/




GO
