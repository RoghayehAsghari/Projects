USE [Asghari_Task2DB]
GO
/****** Object:  UserDefinedFunction [dbo].[Percentage_Of_Students]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Percentage_Of_Students](@Input as int) 
--select [dbo].[Percentage_Of_Students](100)

RETURNS decimal(38,2)
AS
BEGIN
	-- Declare the return variable here
Declare @Student_Number as int=(select count(distinct [UNIQUEID]) from [dbo].[view_Vietnam_wave_1])

DECLARE @output as decimal(38,2)
set @output=(select cast(cast(sum( @Input) as decimal(38,2))*100 /@Student_Number as decimal(38,2)) )


	-- Return the result of the function
RETURN @output

END
GO
