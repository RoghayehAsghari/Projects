USE [Asghari_Task2DB]
GO
/****** Object:  UserDefinedFunction [dbo].[Convert_To_Decimal]    Script Date: 5/14/2022 11:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Convert_To_Decimal](@Input as int) 
--select [dbo].[Convert_To_Decimal](11)

RETURNS decimal(38,2)
AS
BEGIN
	-- Declare the return variable here
DECLARE @output as decimal(38,2)=(select cast(@Input as decimal(38,2)))

	-- Return the result of the function
RETURN @output

END
GO
