USE [Asghari_Task2DB]
GO
/****** Object:  View [dbo].[view_Students]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[view_Students]
as select a.[UNIQUEID]
/*,a.[SCHOOLID]
,a.[CLASSID]
,a.[STUDENTID]
,a.[YLCHILDID]
,[PROVINCE_CODE]
,PROVINCE
,[DISTRICTCODE]
,[DISTRICT]
,[LOCALITY_CODE]--ID School Location
,[LOCALITY]
,[GENDER_CODE]
,[GENDER]
,[AGE]
,[ETHNICITY_Group_Code]
,[ETHNICITY_Group]
,[ETHNICITY_CODE]
,[ETHNICITY]
,[MOM_EDUC_CODE]
,[MOM_EDUC]
,a.[MOM_is_Educated_Code]--7-11
,a.MOM_is_Educated*/
---------------------------------------
--,[No_repeated_Grades1-5] --ST Which grades have you repeated in school? In Grades 1-5
--,[No_repeated_Grades6-9]
--,[No_repeated_Grades10]
,[No_repeated_Grades]
--,a.[ENG_RAWSCORE]
--,a.[MATH_RAWSCORE]
,a.[ENG_SCORE]
,a.[MATH_SCORE]
---------------------English------------------------
--,Start_ENG
--,Know_ENG
--,b.ENG_RAWSCORE ENG_RAWSCORE_2
--,b.MATH_RAWSCORE MATH_RAWSCORE_2
--,b.TS_RAWSCORE TS_RAWSCORE_2
,b.[ENG_SCORE][ENG_SCORE_2]
,b.[MATH_SCORE][MATH_SCORE_2]
,b.TS_SCORE TS_SCORE_2
--,((b.ENG_SCORE-a.ENG_SCORE)/b.ENG_SCORE )*100 ENG_Progress
--, ((b.Math_SCORE-a.Math_SCORE)/b.ENG_SCORE )*100 Math_Progress
,case when isnull(b.ENG_RAWSCORE,0)-isnull(a.ENG_RAWSCORE,0) >0 then 1 else 0 end  ENG_Progress
,case when isnull(b.Math_RAWSCORE,0)-isnull(a.Math_RAWSCORE,0) >0 then 1 else 0 end  Math_Progress
from [dbo].[view_Vietnam_wave_1]a
left join  view_vietnam_wave_2 b 
on a.UNIQUEID=b.UNIQUEID--8740

GO
