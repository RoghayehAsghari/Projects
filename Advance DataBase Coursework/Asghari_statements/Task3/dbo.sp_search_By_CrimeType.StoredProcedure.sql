USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_search_By_CrimeType]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_search_By_CrimeType] (@Crimetype as varchar(50))
--exec [dbo].[sp_search_By_CrimeType] 'Anti'
As
begin

select * from [dbo].[Greater_Manchester_Street_LSOA]
where [Crime type] like '%'+ @Crimetype+'%'
end
GO
