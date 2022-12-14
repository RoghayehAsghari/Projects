USE [Asghari_Task2DB]
GO
/****** Object:  View [dbo].[view_Vietnam_wave_1]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[view_Vietnam_wave_1]
as 
select [UNIQUEID]
,[SCHOOLID]
,[CLASSID]
,[STUDENTID]
,[YLCHILDID]
,[PROVINCE][PROVINCE_CODE]
,case 
when[PROVINCE]=1 then 'Ben Tre'--Mekong Delta
when[PROVINCE]=2 then 'Da Nang'--South Central Coast
when[PROVINCE]=3 then 'Hung Yen'--Red River Delta
when[PROVINCE]=4 then 'Lao Cai'--Northwest
when[PROVINCE]=5 then 'Phu Yen'--South Central Coast
else 'Unknown'
end PROVINCE
,[DISTRICTCODE]
,case 
when [DISTRICTCODE]=  1	Then 'PY1'
when [DISTRICTCODE]=  2	Then 'PY2'
when [DISTRICTCODE]=  3	Then 'PY3'
when [DISTRICTCODE]=  4	Then 'PY4'
when [DISTRICTCODE]=  5	Then 'BT1'
when [DISTRICTCODE]=  6	Then 'BT2'
when [DISTRICTCODE]=  7	Then 'LC1'
when [DISTRICTCODE]=  8	Then 'LC2'
when [DISTRICTCODE]=  9	Then 'LC3'
when [DISTRICTCODE]=  10 Then 'HY1'
when [DISTRICTCODE]=  11 Then 'HY2'
when [DISTRICTCODE]=  12	Then 'DN1'
when [DISTRICTCODE]=  13	Then 'DN2'
when [DISTRICTCODE]=  14	Then 'DN3'
end [DISTRICT]
,[LOCALITY][LOCALITY_CODE]--ID School Location
,case 
when [LOCALITY]=1 then 'Rural'
when [LOCALITY]=2 then 'Urban'
else 'Unknown'
end [LOCALITY]
,[GENDER][GENDER_CODE]
,case 
when [GENDER]=1 then 'Male'
when [GENDER]=2 then  'Female'
else 'Unknown'
end [GENDER]
,[AGE]
,case when [ETHNICITY] =1 then 1
when [ETHNICITY] <>1 then  0 end [ETHNICITY_Group_Code]
,case when [ETHNICITY] =1 then 'Miajority'
when [ETHNICITY] <>1 then  'Minority'end [ETHNICITY_Group]
,[ETHNICITY][ETHNICITY_CODE]
,case 
when [ETHNICITY] =1 then 'Kinh'
when [ETHNICITY] =2 then 'H’Mong'
when [ETHNICITY] =3 then 'Cham-HRoi'
when [ETHNICITY] =4 then 'Ede'
when [ETHNICITY] =5 then 'Ba Na'
when [ETHNICITY] =6 then 'Nung'
when [ETHNICITY] =7 then 'Tay'
when [ETHNICITY] =8 then 'Dao'
when [ETHNICITY] =9 then 'Giay'
when [ETHNICITY] =10 then 'Other'
when [ETHNICITY] ='' then 'Unknown'
else 'Unknown'
end [ETHNICITY]

,[MOM_EDUC][MOM_EDUC_CODE]
,case
when [MOM_EDUC]=0 and [MOM_EDUC]<>'' then 'Never been to school'
when [MOM_EDUC]=1 then 'Primary school (Grades 1-5)'--7-11
when [MOM_EDUC]=2 then 'Lower secondary school (Grades 6-9)'--12-15
when [MOM_EDUC]=3 then 'Intermediate vocational training'
when [MOM_EDUC]=4 then 'Upper secondary school (Grades 10)'--16
when [MOM_EDUC]=5 then 'Higher education (e.g. university/college)'
when [MOM_EDUC]=6 then 'Don’t know'
when [MOM_EDUC]='' then 'Unknown'
else 'Unknown'
end [MOM_EDUC]
,case when [MOM_EDUC] between 2 and 5 then 1
else 0 end 'MOM_is_Educated_Code' --7-11
,case when [MOM_EDUC] between 2 and 5 then 'MOM_is_Educated'
else 'MOM is not Educated' end 'MOM_is_Educated' 
,case when STHVMTEL=1  then 1 else 0 end 'Mobile'
--,case when STHVRADO=1  then 1 else 0 end 'Radio'
--,case when STHVTELE=1  then 1 else 0 end 'Television'
,case when [STHVCOMP]=1  then 1 else 0 end 'Computer'
,case when [STHVINTR]=1  then 1 else 0 end 'St_Internet'
--,case when STHVDVD=1  then 1 else 0 end 'DVD'
--,case when STHVCBLE=1  then 1 else 0 end 'Cable TV box'
,case when STHVMTEL=1 and [STHVCOMP]=1 and [STHVINTR]=1 then 1 else 0 end Tech_Full_Access
---------------------------------------
,case when STRPTCL1=0 then 1 else 0 end 'No_repeated_Grades1-5' --ST Which grades have you repeated in school? In Grades 1-5
,case when STRPTCL6=0 then 1 else 0 end'No_repeated_Grades6-9'
,case when STRPTCL10=0 then 1 else 0 end'No_repeated_Grades10'
,case when cast(STRPTCL1 as int) +cast(STRPTCL6 as int)+cast(STRPTCL10 as int)=0 then 1 else 0 end No_repeated_Grades
,[ENG_RAWSCORE]
,[MATH_RAWSCORE]
,case when [ENG_RAWSCORE]>=20 then 1 else 0 end ENG_SCORE
,case when [MATH_RAWSCORE]>=20 then 1 else 0 end MATH_SCORE

---------------------English------------------------
,case when STAGEENG=1 then 'Kindergarten'
when STAGEENG=2 then 'Grade 1 - 5'
when STAGEENG=3 then 'Grade 6 - 9'
when STAGEENG=4 then 'Grade 10'
when STAGEENG=5 then 'I have never learned English in school'
end Start_ENG
,case when STAGEENG<>5 then 1 else 0 end Know_ENG
------------------School Infra structure------------------------
------------------School Infra structure------------------------
------------------School Infra structure------------------------

/*,[SCHFAC01A]--SC SFO - Classrooms (Enter the number)
,[SCHFAC01B]-- SC SFO - Laboratories(Enter the number)
,[SCHFAC02]-- SC SFO - Does each Grade 10 class have a separate classroom?
,[SCHFAC03]--SC SFO - Is there an electricity supply at the school?
,[SCHFAC04]--SC SFO - Is there a functional library (i.e. a collection of books â€“ not textboo
,[SCHFAC05]--SC SFO - Does the school have connected and working internet access?
,[SCHFAC06]--SC SFO - How many working computers are there for students to use?
,[SCHFAC07]--SC SFO - Does the school have a sports area or play area?
,[SCHFAC08]--SC SFO - Does the school have a swimming pool?
,[SCHFAC09]--SC SFO - Does the school have a gymnasium?
,[SCHFAC10]--SC SFO - How many individual working toilets are there for students to use? (Ple
,[SCHFAC11]--SC SFO - Does the school have separate toilets for male and female students?
,[SCHFAC12]--SC SFO - What is the main source of drinking water at the school?
/*
Value = 0.0	Label = No drinking water
	Value = 1.0	Label = School's own tap
	Value = 2.0	Label = Public tap
	Value = 3.0	Label = School's own well
	Value = 4.0	Label = Public well
	Value = 5.0	Label = Rainwater
	Value = 6.0	Label = Spring
	Value = 7.0	Label = Tanker truck
	Value = 8.0	Label = Bottled water provided to school
	Value = 9.0	Label = Students bring drinking water from home
	Value = 10.0	Label = Other
	Value = 99.0	Label = Missing
	Value = 88.0	Label = NA
*/
,[SCHFAC13]--SC SFO - Is there water available from this water source today?
,[SCHFAC14]--SC SFO - Does the school need major repairs? ('Major repairs' means the physical
*/
--,case when STTLTSCH<>2 then 1 else 0 end School_Toilet--2 = There are no toilets at my school
--,case when STBRWBK<>2 then 1 else 0 end  School_Library
,case when STPAYLNC=2 then 1 else 0 end Free_School_Meal--2=school provides lunch and I don’t pay for it
,case when HTTYPSCH=1 then 1 else 0 end Public_School
,case when HTPRDIST<>1 then 1 else 0 end Not_Poor_District
,[SCHFAC01A]Classrooms_num--SC SFO - Classrooms (Enter the number)
,[SCHFAC01B]Laboratories_num-- SC SFO - Laboratories(Enter the number)
,[SCHFAC02] separate_classroom-- SC SFO - Does each Grade 10 class have a separate classroom?
,[SCHFAC03] electricity--SC SFO - Is there an electricity supply at the school?
,[SCHFAC04]library_--SC SFO - Is there a functional library (i.e. a collection of books – not textboo
,[SCHFAC05]internet--SC SFO - Does the school have connected and working internet access?
,[SCHFAC06]computers--SC SFO - How many working computers are there for students to use?
,[SCHFAC07]sports_area--SC SFO - Does the school have a sports area or play area?
,[SCHFAC08]swimming_pool--SC SFO - Does the school have a swimming pool?
,[SCHFAC09]gymnasium--SC SFO - Does the school have a gymnasium?
,[SCHFAC10]toilets--SC SFO - How many individual working toilets are there for students to use? (Ple
,[SCHFAC11]separated_toilets--SC SFO - Does the school have separate toilets for male and female students?
,[SCHFAC12]source_of_water_code--SC SFO - What is the main source of drinking water at the school?
,case 
when [SCHFAC12]  = 0	Then 'No drinking water'
when [SCHFAC12]  = 1	Then 'School''s own tap'
when [SCHFAC12]  = 2	Then 'Public tap'
when [SCHFAC12]  = 3	Then 'School''s own well'
when [SCHFAC12]  = 4	Then 'Public well'
when [SCHFAC12]  = 5	Then 'Rainwater'
when [SCHFAC12]  = 6	Then 'Spring'
when [SCHFAC12]  = 7	Then 'Tanker truck'
when [SCHFAC12]  = 8	Then 'Bottled water provided to school'
when [SCHFAC12]  = 9	Then 'Students bring drinking water from home'
when [SCHFAC12]  = 10	Then 'Other'
when [SCHFAC12]  = 99	Then 'Missing'
when [SCHFAC12]  = 88	Then 'NA'
end source_of_water
,case when [SCHFAC14]=0 then 1 
else 0 end NoNeed_major_repairs--SC SFO - Does the school need major repairs? ('Major repairs' means the physical
from [Asghari_Task2DB].[dbo].[vietnam_wave_1]a
GO
