USE [Asghari_Task3DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrimeRate_By_LSOAcode]    Script Date: 5/14/2022 11:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------
CREATE procedure [dbo].[sp_CrimeRate_By_LSOAcode](@LSOAcode as varchar(50))
--exec  dbo.sp_CrimeRate_By_LSOAcode 'All'
--exec  dbo.sp_CrimeRate_By_LSOAcode 'E01004766'
as
begin
select * from [dbo].[view_LSOAcode_Crime_Rate]
where [LSOA code]=@LSOAcode or 'All'=@LSOAcode
end
GO
