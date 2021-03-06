USE [master]
GO
/****** Object:  Database [Society-Appp]    Script Date: 14-06-2021 18:09:45 ******/
CREATE DATABASE [Society-Appp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Society-Appp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.YASH\MSSQL\DATA\Society-Appp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Society-Appp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.YASH\MSSQL\DATA\Society-Appp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Society-Appp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Society-Appp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Society-Appp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Society-Appp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Society-Appp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Society-Appp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Society-Appp] SET ARITHABORT OFF 
GO
ALTER DATABASE [Society-Appp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Society-Appp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Society-Appp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Society-Appp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Society-Appp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Society-Appp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Society-Appp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Society-Appp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Society-Appp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Society-Appp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Society-Appp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Society-Appp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Society-Appp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Society-Appp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Society-Appp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Society-Appp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Society-Appp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Society-Appp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Society-Appp] SET  MULTI_USER 
GO
ALTER DATABASE [Society-Appp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Society-Appp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Society-Appp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Society-Appp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Society-Appp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Society-Appp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Society-Appp] SET QUERY_STORE = OFF
GO
USE [Society-Appp]
GO
/****** Object:  Table [dbo].[Insersation_Table]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insersation_Table](
	[Company_Name] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[First_Name] [varchar](100) NOT NULL,
	[Last_name] [varchar](100) NOT NULL,
	[User_Name] [varchar](100) NOT NULL,
	[Company_Size] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Mobile_Number] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[Active] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Procedure]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Delete_Procedure]
	@Mobile_Number int
AS
BEGIN
	DELETE FROM Insersation_Table Where Mobile_Number = @Mobile_Number
END
GO
/****** Object:  StoredProcedure [dbo].[info_book]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    create Procedure [dbo].[info_book]  
    AS  
    BEGIN  
    Select Company_Name, Password, First_Name, Last_name, User_Name, Company_Size, Email, Mobile_Number from Insersation_Table
    END  
GO
/****** Object:  StoredProcedure [dbo].[InsertPersonalDetails]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[InsertPersonalDetails]
       -- Add the parameters for the stored procedure here
      @Company_Name varchar,
      @Password varchar,
      @First_Name varchar,
      @Last_name varchar,
      @User_Name varchar,
      @Company_Size varchar,
      @Email varchar,
      @Mobile_Number int
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

    -- Insert statements for procedure here
       INSERT INTO Insersation_Table
		   (
			   Company_Name
			  ,Password
			  ,First_Name
			  ,Last_name
			  ,User_Name
			  ,Company_Size
			  ,Email
			  ,Mobile_Number
			)
       VALUES
            (
			  @Company_Name
			  ,@Password
			  ,@First_Name
			  ,@Last_name
			  ,@User_Name
			  ,@Company_Size
			  ,@Email
			  ,@Mobile_Number
			)
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Procedure]    Script Date: 14-06-2021 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Procedure]
	@Company_Name varchar(100),@Password varchar(100),@First_Name varchar(100), @Last_Name varchar(100), @User_Name varchar(100), @Company_Size varchar(100), @Email varchar(100), @Mobile_Number int,@Choose_File image
AS
Begin
	UPDATE Insersation_Table
	SET		  Company_Name = @Company_Name
			  ,Password = @Password
			  ,First_Name = @First_Name
			  ,Last_Name = @Last_Name
			  ,User_Name = @User_Name
			  ,Company_Size = @Company_Size
			  ,Email = @Email
			  ,Mobile_Number = @Mobile_Number
	WHERE Mobile_Number = @Mobile_Number; 
END
GO
USE [master]
GO
ALTER DATABASE [Society-Appp] SET  READ_WRITE 
GO
