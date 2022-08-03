USE [master]
GO
/****** Object:  Database [Asghari_Task1DB]    Script Date: 5/14/2022 11:02:24 PM ******/
CREATE DATABASE [Asghari_Task1DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Asghari_Task1DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Asghari_Task1DB.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Asghari_Task1DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Asghari_Task1DB_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Asghari_Task1DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Asghari_Task1DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Asghari_Task1DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Asghari_Task1DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Asghari_Task1DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Asghari_Task1DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Asghari_Task1DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Asghari_Task1DB] SET  MULTI_USER 
GO
ALTER DATABASE [Asghari_Task1DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Asghari_Task1DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Asghari_Task1DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Asghari_Task1DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Asghari_Task1DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Asghari_Task1DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Asghari_Task1DB', N'ON'
GO
ALTER DATABASE [Asghari_Task1DB] SET QUERY_STORE = OFF
GO
ALTER DATABASE [Asghari_Task1DB] SET  READ_WRITE 
GO
