USE [Asghari_Task2DB]
GO
/****** Object:  View [dbo].[view_Schools]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[view_Schools]
as
select *
,case 
when [NoNeed_major_repairs]=1and
Water=1and
[electricity]=1and
[library_]=1and
[internet]=1and
[Computers]=1
--and[sports_area]=1 
--and[Enough_Toilets_Number]=1
--[Enough_Classrooms_Number]=1and   
then 1
else 0 end Schools_Infrastructures

--case when [internet]=1
--      and[Computers]=1 then 1
--	  else 0 end Technology
 /*,case when [separated_toilets]=1 then 1 
	  else 0 end  Good_Conditions--Define good conditions
	  ,case when --[Enough_Classrooms_Number]=1and
       [electricity]=1
      and [library_]=1
      and[internet]=1
      --and[Enough_Computers_Number]=1
      and[sports_area]=1
      and[swimming_pool]=1
      and[gymnasium]=1
      --and[Enough_Toilets_Number]=1
      and[separated_toilets]=1
      and[source_of_water]=1
      and[NoNeed_major_repairs]=1 then 1 else 0 
	  end VeryGood_conditions/* not only the school is in good conditions, But also it has a swimming_pool  and gymnasium*/
*/
	 from (select 
	 [SCHOOLID]
	 ,[PROVINCE_CODE]
	 ,[PROVINCE]
	 ,[DISTRICTCODE]
	 ,[DISTRICT]
      ,[LOCALITY_CODE]
      ,[LOCALITY]
	  --,Student_num
	  --,Classrooms_num
	  --,case when Classrooms_per_student>=@Avg_Classrooms_per_student then 1 else 0 end Enough_Classrooms_Number
	  --,[separate_classroom]
	  ,[electricity]
	  ,case when [source_of_water_code] in (1,8) then 1 else 0 end water
      ,[library_]
      ,[internet]
	  --,Computers
	  ,case when computers>=20 --Computers_per_student>=@Avg_Computers_per_student 
	  then 1 else 0 end computers
	  --,case when Computers>=10 then 1 else 0 end Enough_Computers_Number

	  --,[sports_area]
      --,[swimming_pool]
      --,[gymnasium]
	  --,toilets
	  --,case when toilets_per_student>=@Avg_toilets_per_student then 1 else 0 end Enough_Toilets_Number
	  --,case when toilets>=10 then 1 else 0 end Enough_Toilets_Number

      --,[separated_toilets]
	  /*
	  8=Bottled water provided to school
	  1=School's own tap
	  */
	   ,NoNeed_major_repairs
	  	  from 
	  (select distinct a.[SCHOOLID]
	  ,[PROVINCE_CODE]
	 ,[PROVINCE]
	 ,[DISTRICTCODE]
	 ,[DISTRICT]
      ,[LOCALITY_CODE]
      ,[LOCALITY]
      ,[Classrooms_num]
      ,[Laboratories_num]
      ,[separate_classroom]
	  ,Student_num
--,cast((cast(Classrooms_num as decimal(38,2))/Student_num ) as  decimal(38,2))Classrooms_per_student
--,cast((cast([computers] as decimal(38,2))/Student_num ) as  decimal(38,2))computers_per_student
--,cast((cast([toilets] as decimal(38,2))/Student_num ) as  decimal(38,2))toilets_per_student

      ,[electricity]
      ,[library_]
      ,[internet]
      ,[computers]
      ,[sports_area]
      ,[swimming_pool]
      ,[gymnasium]
      ,[toilets]
      ,[separated_toilets]
      ,[source_of_water_code]
	  ,[source_of_water]
      ,NoNeed_major_repairs	
	  from [dbo].[view_Vietnam_wave_1]a
left join (select SCHOOLID,count(*) Student_num from [Asghari_Task2DB].[dbo].[view_Vietnam_wave_1]
group by SCHOOLID)b
on a.SCHOOLID=b.SCHOOLID
	  )k)k
GO
