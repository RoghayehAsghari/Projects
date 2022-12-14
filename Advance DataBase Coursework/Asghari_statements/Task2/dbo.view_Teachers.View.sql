USE [Asghari_Task2DB]
GO
/****** Object:  View [dbo].[view_Teachers]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_Teachers]
As
select * 
,case when 
University_Education=1
and Teacher_Training_Qualification=1 
and Experience=1 then 1 
else 0 end Experienced_Qualified_Teacher
from 
(select UNIQUEID
,SCHOOLID
--,ENG_TCHID --TC Teacher ID
,case when b.[ENG_TCLVLEDC] >3  and b.[Math_TCLVLEDC] >3 then 1 else 0 end University_Education --TC What is your highest level of education (excluding teacher training)?
/*1 Upper secondary or equivalent
2 = Vocational training school
3 = College education
4 = University education (undergraduate)
5 = University education (postgraduate)*/
,case when b.[ENG_TCTCHQLF]>1 and b.[Math_TCTCHQLF]>1  then 1 else 0 end  Teacher_Training_Qualification--TC What is your highest level of teacher training qualification?
/*
0 = I am not trained
1 = Short course or crash course in teaching profession
2 = Teacher training level (2 years after upper secondary education)
3 = Teacher training college level (3 years after upper secondary
education)
4 = Teacher training university level (4 years after upper secondary
education) or higher*/
--,case when ENG_TCAWDTTL >0 then 1 else 0 end Excellent_Teacher--TC Have you ever been awarded the title of ‘Excellent Teacher’?
/*0 = Never been an excellent teacher
1 = Yes, school level
2 = Yes, district level
3 = Yes, province level or higher*/
,case when b.ENG_TCYRTCH>4 and b.Math_TCYRTCH>4 then 1 else 0 end Experience--TC For how many years have you been doing the following? Working as a teacher
from [dbo].[view_vietnam_wave_2] b)k
GO
