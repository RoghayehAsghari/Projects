USE [Asghari_Task2DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_School_Infrastructure]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--percentage of students who have access to good School Infrastructures
CREATE procedure [dbo].[sp_School_Infrastructure](@Group_Type as varchar(100))
--exec sp_School_Infrastructure 'All'
as begin
Declare @Student_Number as int=(select count(distinct [UNIQUEID]) from [dbo].[view_Vietnam_wave_1])
--select @Student_Number

-----------percentage of student have access to good School Infrastructures -------------------------
if object_id('Schools_Infrastructures') is not null 
drop table Schools_Infrastructures
----------Percentage of student by LOCALITY------------------------
select 
'LOCALITY' Group_Type,
a.[LOCALITY] SubGroup
--,a.[GENDER],a.[ETHNICITY_Group]
,cast(cast(sum( b.[electricity]) as decimal(38,2))*100 /@Student_Number as decimal(38,2))  [electricity]
,cast(cast(sum(b.[water]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [water]
,cast(cast(sum(b.[library_]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [library_]
,cast(cast(sum(b.[internet]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [internet]
,cast(cast(sum(b.[computers]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [computers]
,cast(cast(sum(b.[NoNeed_major_repairs]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [NoNeed_major_repairs]
,cast(cast(sum(b.[Schools_Infrastructures]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Schools_Infrastructures]
into Schools_Infrastructures
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Schools] b
on a.SCHOOLID=b.SCHOOLID
group by a.[LOCALITY]
union all
----------Percentage of [GENDER]--------------------
select 
'GENDER' Group_Type,
a.[GENDER]
--,a.[ETHNICITY_Group]
,cast(cast(sum( b.[electricity]) as decimal(38,2))*100 /@Student_Number as decimal(38,2))  [electricity]
,cast(cast(sum(b.[water]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [water]
,cast(cast(sum(b.[library_]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [library_]
,cast(cast(sum(b.[internet]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [internet]
,cast(cast(sum(b.[computers]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [computers]
,cast(cast(sum(b.[NoNeed_major_repairs]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [NoNeed_major_repairs]
,cast(cast(sum(b.[Schools_Infrastructures]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Schools_Infrastructures]
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Schools] b
on a.SCHOOLID=b.SCHOOLID
group by a.[GENDER]
union all
---------Percentage of ETHNICITY----------------
select 
'ETHNICITY' Group_Type,
a.[ETHNICITY_Group]
,cast(cast(sum( b.[electricity]) as decimal(38,2))*100 /@Student_Number as decimal(38,2))  [electricity]
,cast(cast(sum(b.[water]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [water]
,cast(cast(sum(b.[library_]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [library_]
,cast(cast(sum(b.[internet]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [internet]
,cast(cast(sum(b.[computers]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [computers]
,cast(cast(sum(b.[NoNeed_major_repairs]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [NoNeed_major_repairs]
,cast(cast(sum(b.[Schools_Infrastructures]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Schools_Infrastructures]
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Schools] b
on a.SCHOOLID=b.SCHOOLID
group by a.[ETHNICITY_Group]
-----------------------------------

select * from Schools_Infrastructures
where Group_Type=@Group_Type 
or 'All'=@Group_Type
order by [Schools_Infrastructures] desc
end

GO
