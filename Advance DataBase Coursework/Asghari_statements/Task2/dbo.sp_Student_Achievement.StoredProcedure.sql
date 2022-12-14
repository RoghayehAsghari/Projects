USE [Asghari_Task2DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Student_Achievement]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE procedure [dbo].[sp_Student_Achievement](@Group_Type varchar(100))
--exec sp_Student_Achievement 'All'
as begin
Declare @Student_Number as int=(select count(distinct [UNIQUEID]) from [dbo].[view_Vietnam_wave_1])
--select @Student_Number
----------Student Achievement by LOCALITY--------------------
if object_id('Student_Achievement') is not null drop table Student_Achievement
select 
'LOCALITY' Group_Type
,[LOCALITY] SubGroup
,cast(cast(sum(b.[No_repeated_Grades])as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [No_repeated_Grades]
,cast(cast(sum(TS_SCORE_2)as decimal(38,2))*100/@Student_Number as decimal(38,2))Transferable_skills
,cast(cast(sum(ENG_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))ENG_Progress
,cast(cast(sum(Math_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))Math_Progress
--,cast(cast(sum([MATH_SCORE])as decimal(38,2))*100/@Student_Number as decimal(38,2))[MATH_SCORE]
--,cast(cast(sum(MATH_SCORE_2)as decimal(38,2))*100/@Student_Number as decimal(38,2))MATH_SCORE_2
--,cast(cast(sum([Know_ENG])as decimal(38,2))*100/@Student_Number as decimal(38,2))[Know_ENG]
into Student_Achievement
from [dbo].[view_Vietnam_wave_1]b
left join [Asghari_Task2DB].[dbo].[view_Students] a
on a.UNIQUEID=b.UNIQUEID
group by
      [LOCALITY]
--------By GENDER-----------------
union all
select 
'GENDER' Group_Type
,[GENDER]
[LOCALITY]
,cast(cast(sum(b.[No_repeated_Grades])as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [No_repeated_Grades]
,cast(cast(sum(TS_SCORE_2)as decimal(38,2))*100/@Student_Number as decimal(38,2))Transferable_skills
,cast(cast(sum(ENG_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))ENG_Progress
,cast(cast(sum(Math_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))Math_Progress
from  [dbo].[view_Vietnam_wave_1]b
left join [Asghari_Task2DB].[dbo].[view_Students] a
on a.UNIQUEID=b.UNIQUEID

  group by 
[GENDER]
----------BY ETHNICITY_Group ---------------------
union all
select 
'ETHNICITY' Group_Type
,[ETHNICITY_Group]
[LOCALITY]
,cast(cast(sum(b.[No_repeated_Grades])as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [No_repeated_Grades]
,cast(cast(sum(TS_SCORE_2)as decimal(38,2))*100/@Student_Number as decimal(38,2))Transferable_skills
,cast(cast(sum(ENG_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))ENG_Progress
,cast(cast(sum(Math_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))Math_Progress
from [dbo].[view_Vietnam_wave_1]b
left join [Asghari_Task2DB].[dbo].[view_Students] a
on a.UNIQUEID=b.UNIQUEID

  group by [ETHNICITY_Group]
  /*-----------BY MOM Education----------------
union all
select 
'MOM_Education' Group_Type
,MOM_is_Educated
[LOCALITY]
,cast(cast(sum(b.[No_repeated_Grades])as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [No_repeated_Grades]
,cast(cast(sum(TS_SCORE_2)as decimal(38,2))*100/@Student_Number as decimal(38,2))TS_SCORE_2
,cast(cast(sum(ENG_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))ENG_Progress
,cast(cast(sum(Math_Progress)as decimal(38,2))*100/@Student_Number as decimal(38,2))Math_Progress
from [dbo].[view_Vietnam_wave_1]b
left join [Asghari_Task2DB].[dbo].[view_Students] a
on a.UNIQUEID=b.UNIQUEID
group by MOM_is_Educated*/
------------------------
select * from Student_Achievement
where Group_Type=@Group_Type --Shows specific Group_Type
or 'All'=@Group_Type--All the data
order by  [No_repeated_Grades] desc
,Transferable_skills desc
,ENG_Progress desc
,Math_Progress desc
  end

  


GO
