USE [Asghari_Task2DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Experienced_Qualified_Teacher]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Experienced_Qualified_Teacher](@Group_Type as varchar(100))
--exec sp_Experienced_Qualified_Teacher 'All'
as begin
Declare @Student_Number as int=(select count(distinct [UNIQUEID]) from [dbo].[view_Vietnam_wave_1])
--select @Student_Number

-----------percentage of Experienced_Qualified_Teacher by [LOCALITY] -------------------------
if object_id('Experienced_Qualified_Teacher') is not null 
drop table Experienced_Qualified_Teacher
select 
'LOCALITY' Group_Type
,[LOCALITY] SubGroup
,cast(cast(sum([University_Education]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [University_Education]
,cast(cast(sum([Teacher_Training_Qualification]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Teacher_Training_Qualification]
,cast(cast(sum([Experience]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experience]
,cast(cast(sum([Experienced_Qualified_Teacher]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experienced_Qualified_Teacher]
into Experienced_Qualified_Teacher
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Teachers] b
on a.UNIQUEID=b.UNIQUEID
group by [LOCALITY]
union all
-----------percentage of [GENDER]---------------
select
'GENDER' Group_Type
,[GENDER]
,cast(cast(sum([University_Education]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [University_Education]
,cast(cast(sum([Teacher_Training_Qualification]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Teacher_Training_Qualification]
,cast(cast(sum([Experience]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experience]
,cast(cast(sum([Experienced_Qualified_Teacher]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experienced_Qualified_Teacher]
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Teachers] b
on a.UNIQUEID=b.UNIQUEID
group by [GENDER]
union all
-------------percentage of [ETHNICITY_Group]------------------------
select
'ETHNICITY' Group_Type
,[ETHNICITY_Group]
,cast(cast(sum([University_Education]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [University_Education]
,cast(cast(sum([Teacher_Training_Qualification]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Teacher_Training_Qualification]
,cast(cast(sum([Experience]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experience]
,cast(cast(sum([Experienced_Qualified_Teacher]) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) [Experienced_Qualified_Teacher]
from [dbo].[view_Vietnam_wave_1] a
left join [dbo].[view_Teachers] b
on a.UNIQUEID=b.UNIQUEID
group by [ETHNICITY_Group]
--------------------
select * from Experienced_Qualified_Teacher
where Group_Type=@Group_Type -- Shows the specific Group_Type
or 'All'=@Group_Type--Shows all the Group_Type
order by [Experienced_Qualified_Teacher] desc
end

GO
