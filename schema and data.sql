USE [master]
GO
/****** Object:  Database [SellMangementDB]    Script Date: 12/5/2022 6:48:04 PM ******/
CREATE DATABASE [SellMangementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SellMangementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SellMangementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SellMangementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SellMangementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SellMangementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SellMangementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SellMangementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SellMangementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SellMangementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SellMangementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SellMangementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SellMangementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SellMangementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SellMangementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SellMangementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SellMangementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SellMangementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SellMangementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SellMangementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SellMangementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SellMangementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SellMangementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SellMangementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SellMangementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SellMangementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SellMangementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SellMangementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SellMangementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SellMangementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SellMangementDB] SET  MULTI_USER 
GO
ALTER DATABASE [SellMangementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SellMangementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SellMangementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SellMangementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SellMangementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SellMangementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SellMangementDB', N'ON'
GO
ALTER DATABASE [SellMangementDB] SET QUERY_STORE = OFF
GO
USE [SellMangementDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/5/2022 6:48:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2022 6:48:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerAddress] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/5/2022 6:48:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/5/2022 6:48:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/5/2022 6:48:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[SKUCode] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[PicturePath] [nvarchar](200) NULL,
	[InStock] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Mouse')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Keyboard')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'SSD')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'RAM')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Monitor')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Graphics Card')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CustomerAddress]) VALUES (1, N'Faruk Hossain', N'Barishal')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CustomerAddress]) VALUES (2, N'Al Amin', N'Chandpur')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CustomerAddress]) VALUES (3, N'Shaon Khalifa', N'Barishal')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CustomerAddress]) VALUES (4, N'Abdul Ahad', N'Feni')
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CustomerAddress]) VALUES (5, N'Faiza Islam Mumu', N'Barishal')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 1, 1, 1, 2200.0000)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 1, 2, 3, 1100.0000)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 1, 3, 4, 1250.0000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [SKUCode], [EntryDate], [PicturePath], [InStock]) VALUES (1, N'HP OMEN Mouse', 1, 2200.0000, 1, CAST(N'2022-12-13' AS Date), N'~/Images/a1e08a1d-46be-4da1-befa-d1c4f953d9c5.png', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [SKUCode], [EntryDate], [PicturePath], [InStock]) VALUES (2, N'Lenovo N100 Wireless Mouse', 1, 1100.0000, 5, CAST(N'2022-12-18' AS Date), N'~/Images/3b03eab7-979c-4b8d-9e89-783afdc61437.jpg', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [SKUCode], [EntryDate], [PicturePath], [InStock]) VALUES (3, N'Asus U2000 Keyboard', 2, 1250.0000, 6, CAST(N'2022-12-20' AS Date), N'~/Images/cbcd2493-190a-461d-ab51-b1c8eae8c761.jpg', 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [SKUCode], [EntryDate], [PicturePath], [InStock]) VALUES (4, N'Transcend SSD220S 2TB M.2', 3, 2800.0000, 1, CAST(N'2022-12-13' AS Date), N'~/Images/f7688230-e720-4419-a264-a7c05728c19e.jpg', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [SellMangementDB] SET  READ_WRITE 
GO
