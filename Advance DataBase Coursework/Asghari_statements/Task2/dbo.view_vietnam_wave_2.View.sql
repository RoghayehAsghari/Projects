USE [Asghari_Task2DB]
GO
/****** Object:  View [dbo].[view_vietnam_wave_2]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[view_vietnam_wave_2] 
as
select * 
,case when k.ENG_RAWSCORE>=20 then 1 else 0 end ENG_SCORE
,case when k.MATH_RAWSCORE>=20 then 1 else 0 end MATH_SCORE
,case when k.TS_RAWSCORE>=20 then 1 else 0 end TS_SCORE
from 
(select 
UNIQUEID
,SCHOOLID
,CLASSID
,STUDENTID
,STNTCMP
,STDINT
--,ENG_TEST
,case when ENG_TEST='No' then 0 else ENG_RAWSCORE end ENG_RAWSCORE
--,MATH_TEST
,case when MATH_TEST='No' then 0 else MATH_RAWSCORE end MATH_RAWSCORE
--,TS_TEST--Transferable skills test
,case when TS_TEST='No' then 0 
when TS_TEST<>'No' then 
cast( [TS_ITEM1] as smallint) 
+cast([TS_ITEM2] as smallint) 
+cast([TS_ITEM3A] as smallint) 
+cast([TS_ITEM3B] as smallint) 
+cast([TS_ITEM3C] as smallint) 
+cast([TS_ITEM3D] as smallint) 
+cast([TS_ITEM3E] as smallint) 
+cast([TS_ITEM3F] as smallint) 
+cast([TS_ITEM3] as smallint) 
+cast([TS_ITEM4] as smallint) 
+cast([TS_ITEM5] as smallint) 
+cast([TS_ITEM6] as smallint) 
+cast([TS_ITEM7] as smallint) 
+cast([TS_ITEM8A] as smallint) 
+cast([TS_ITEM8B] as smallint) 
+cast([TS_ITEM8C] as smallint) 
+cast([TS_ITEM8] as smallint) 
+cast([TS_ITEM9] as smallint) 
+cast([TS_ITEM10] as smallint) 
+cast([TS_ITEM11] as smallint) 
+cast([TS_ITEM12] as smallint) 
+cast([TS_ITEM11_12] as smallint) 
+cast([TS_ITEM13] as smallint) 
+cast([TS_ITEM14] as smallint) 
+cast([TS_ITEM15] as smallint) 
+cast([TS_ITEM16] as smallint) 
+cast([TS_ITEM17] as smallint) 
+cast([TS_ITEM18] as smallint) 
+cast([TS_ITEM19] as smallint) 
+cast([TS_ITEM20] as smallint) 
+cast([TS_ITEM21] as smallint) 
+cast([TS_ITEM22] as smallint) 
+cast([TS_ITEM23] as smallint) 
end TS_RAWSCORE

--,[STADDMT]--ST Do you attend non-compulsory additional classes at school in Maths
--,[STADDEN]--ST Do you attend non-compulsory additional classes at school in English
--,[STADDOT]--ST Do you attend non-compulsory additional classes at school in Other subjects
--,[STPRVMT]--ST Do you attend private classes outside school in Maths
--,[STPRVEN]--ST Do you attend private classes outside school in English
--,[STPRVOT]--ST Do you attend private classes outside school in Other subjects
          
----------------Experienced teacher---------------------
,ENG_TCHID --TC Teacher ID
,ENG_TCHSUBJ --TC Teacher Subject
,[ENG_TCLVLEDC]--TC What is your highest level of education (excluding teacher training)?
/*1 Upper secondary or equivalent
2 = Vocational training school
3 = College education
4 = University education (undergraduate)
5 = University education (postgraduate)*/
,[ENG_TCTCHQLF]--TC What is your highest level of teacher training qualification?
/*
0 = I am not trained
1 = Short course or crash course in teaching profession
2 = Teacher training level (2 years after upper secondary education)
3 = Teacher training college level (3 years after upper secondary
education)
4 = Teacher training university level (4 years after upper secondary
education) or higher*/
,ENG_TCAWDTTL --TC Have you ever been awarded the title of ‘Excellent Teacher’?
/*0 = Never been an excellent teacher
1 = Yes, school level
2 = Yes, district level
3 = Yes, province level or higher*/
,ENG_TCYRTCH--TC For how many years have you been doing the following? Working as a teacher
,ENG_TCSTDENG--TC Before you became a teacher, for how many years did you study English as a subject?
/*0 = I have never studied English as a subject
1 = Up to 1 year
2 = 1 – 2 years
3 = 3 – 5 years
4 = 6 – 10 years
5 = More than 10 years*/
--------------Table 4c: Teacher Background Questionnaire – Maths Teacher----------------
,MATH_TCHID --TC Teacher ID
,MATH_TCHSUBJ --TC Teacher Subject
,[MATH_TCLVLEDC]--TC What is your highest level of education (excluding teacher training)?
/*1 Upper secondary or equivalent
2 = Vocational training school
3 = College education
4 = University education (undergraduate)
5 = University education (postgraduate)*/
,[MATH_TCTCHQLF]--TC What is your highest level of teacher training qualification?
/*
0 = I am not trained
1 = Short course or crash course in teaching profession
2 = Teacher training level (2 years after upper secondary education)
3 = Teacher training college level (3 years after upper secondary
education)
4 = Teacher training university level (4 years after upper secondary
education) or higher*/
,MATH_TCAWDTTL --TC Have you ever been awarded the title of ‘Excellent Teacher’?
/*0 = Never been an excellent teacher
1 = Yes, school level
2 = Yes, district level
3 = Yes, province level or higher*/
,MATH_TCYRTCH--TC For how many years have you been doing the following? Working as a teacher
,MATH_TCSTDENG--TC Before you became a teacher, for how many years did you study English as a subject?
/*0 = I have never studied English as a subject
1 = Up to 1 year
2 = 1 – 2 years
3 = 3 – 5 years
4 = 6 – 10 years
5 = More than 10 years*/

from vietnam_wave_2
)k
GO
