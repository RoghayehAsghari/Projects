USE [Asghari_Task1DB]
GO
/****** Object:  User [Readuser]    Script Date: 5/14/2022 11:02:24 PM ******/
CREATE USER [Readuser] FOR LOGIN [Readuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Readuser]
GO
