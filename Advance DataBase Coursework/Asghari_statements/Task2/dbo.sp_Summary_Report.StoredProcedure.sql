USE [Asghari_Task2DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Summary_Report]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[sp_Summary_Report] (@min_perc as int)
--exec dbo.sp_Summary_Report 20
as 
Begin
if object_id('Summary_Report') is not null drop table Summary_Report
select 
sc.Group_Type
,sc.SubGroup
,sc.Schools_Infrastructures
,t.Experienced_Qualified_Teacher
--,st.No_repeated_Grades
--,st.Transferable_skills
,st.ENG_Progress
,st.Math_Progress
into Summary_Report
from  [dbo].[Schools_Infrastructures] Sc 
left join [dbo].[Experienced_Qualified_Teacher] T
on sc.Group_Type=t.Group_Type
and sc.SubGroup=t.SubGroup
left join [dbo].[Student_Achievement]st
on sc.Group_Type=st.Group_Type
and sc.SubGroup=st.SubGroup
----------------------------
select * from Summary_Report
where
--Schools_Infrastructures <=@min_perc
--or Experienced_Qualified_Teacher<=@min_perc
--or Transferable_skills <=@min_perc
ENG_Progress<=@min_perc
or Math_Progress<=@min_perc
order by 
--Schools_Infrastructures desc
--,Experienced_Qualified_Teacher desc
--,No_repeated_Grades desc
--,Transferable_skills desc
ENG_Progress desc
,Math_Progress desc
end 
 

GO
