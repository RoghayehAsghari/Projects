USE [Asghari_Task2DB]
GO
/****** Object:  User [Readuser]    Script Date: 5/14/2022 11:04:24 PM ******/
CREATE USER [Readuser] FOR LOGIN [Readuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Readuser]
GO
