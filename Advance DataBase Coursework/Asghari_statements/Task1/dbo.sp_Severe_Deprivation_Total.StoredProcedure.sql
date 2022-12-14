USE [Asghari_Task1DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Severe_Deprivation_Total]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Severe_Deprivation_Total]
-- exec [dbo].[sp_Severe_Deprivation_Total]
as 
begin
declare @cnt_Ethiopia int =( select count(distinct childid) from [Ethiopia_constructed])--2999
declare @cnt_India int =( select count(distinct childid) from [India_constructed])--3019
declare @cnt_Peru int =( select count(distinct childid) from [Peru_constructed])--2766
declare @cnt_Vietnam int =( select count(distinct childid) from [Vietnam_constructed])--3000
declare @cnt_All int =( select @cnt_Ethiopia+@cnt_India+@cnt_Peru+@cnt_Vietnam)--11784

if object_id('[dbo].[Severe_Deprivation_Total_Percentage]') is not null 
drop table [dbo].[Severe_Deprivation_Total_Percentage]
select 'Severe_Education_Deprivation' Deprivation, cast(cast(count(*) as decimal(38,2))*100/@cnt_All as decimal(38,2)) Deprivation_percentage 
into [dbo].[Severe_Deprivation_Total_Percentage]
from [dbo].[view_Severe_Education_Deprivation_AllCountries]
union all
select 'Food_Deprivation'Deprivation,cast(cast(count(*) as decimal(38,2))*100/@cnt_All as decimal(38,2)) Deprivation_percentage 
from [dbo].[view_Severe_Food_Deprivation_AllCountries]
union all
select 'Health_Deprivation'Deprivation,cast(cast(count(*) as decimal(38,2))*100/@cnt_All as decimal(38,2)) Deprivation_percentage 
from [dbo].[view_Severe_Health_Deprivation_AllCountries]
union all
select 'Sanitation_Deprivation'Deprivation,cast(cast(count(*) as decimal(38,2))*100/@cnt_All as decimal(38,2)) Deprivation_percentage 
from [dbo].[view_Severe_Sanitation_Deprivation_AllCountries]
union all
select 'Water_Deprivation'Deprivation,cast(cast(count(*) as decimal(38,2))*100/@cnt_All as decimal(38,2)) Deprivation_percentage 
from [dbo].[view_Severe_Water_Deprivation_AllCountries]
select * from [dbo].[Severe_Deprivation_Total_Percentage]
order by Deprivation_percentage desc
end

GO
