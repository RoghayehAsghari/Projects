USE [Asghari_Task2DB]
GO
/****** Object:  User [test]    Script Date: 5/14/2022 11:04:24 PM ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
