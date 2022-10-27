USE [websales]
GO
/****** Object:  Database [websales]    Script Date: 10/27/2022 8:54:18 PM ******/
CREATE DATABASE [websales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'websales', FILENAME = N'C:\sqldev\MSSQL15.MSSQLSERVER\MSSQL\DATA\websales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'websales_log', FILENAME = N'C:\sqldev\MSSQL15.MSSQLSERVER\MSSQL\DATA\websales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [websales] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [websales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [websales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [websales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [websales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [websales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [websales] SET ARITHABORT OFF 
GO
ALTER DATABASE [websales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [websales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [websales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [websales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [websales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [websales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [websales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [websales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [websales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [websales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [websales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [websales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [websales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [websales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [websales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [websales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [websales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [websales] SET RECOVERY FULL 
GO
ALTER DATABASE [websales] SET  MULTI_USER 
GO
ALTER DATABASE [websales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [websales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [websales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [websales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [websales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [websales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'websales', N'ON'
GO
ALTER DATABASE [websales] SET QUERY_STORE = OFF
GO
USE [websales]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/27/2022 8:54:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_getAllProduct]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_getAllProduct]
as
begin
SELECT * FROM Products

end

GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategory]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertCategory]
(
@Na nvarchar(50),
@NaVN nvarchar(50)
 
 ) as
begin
INSERT INTO Categories(Name,NameVN) values(@Na ,@NaVN)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchProducts]    Script Date: 10/27/2022 8:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_SearchProducts]( @MaxPrice Float = 0,
@MinPrice float = 0)
as
begin
SELECT * FROM Products where UnitPrice between @MinPrice and @MaxPrice 

end
GO
USE [master]
GO
ALTER DATABASE [websales] SET  READ_WRITE 
GO
