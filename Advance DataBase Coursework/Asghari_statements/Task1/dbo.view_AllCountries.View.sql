USE [Asghari_Task1DB]
GO
/****** Object:  View [dbo].[view_AllCountries]    Script Date: 5/14/2022 11:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[view_AllCountries]
as 

select *
from(
select * from [dbo].[view_Ethiopia]
union all
select * from [dbo].[view_India]
union all
select * from [dbo].[view_Peru]
union all
select * from [dbo].[view_Vietnam])k
where inround=1
GO
