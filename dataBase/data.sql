--USE [master]
--GO
--/****** Object:  Database [STORE]    Script Date: 16/02/2022 13:09:19 ******/
--CREATE DATABASE [STORE]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'STORE', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQL\MSSQL\DATA\STORE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'STORE_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQL\MSSQL\DATA\STORE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
--GO
--ALTER DATABASE [STORE] SET COMPATIBILITY_LEVEL = 130
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [STORE].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [STORE] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [STORE] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [STORE] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [STORE] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [STORE] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [STORE] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [STORE] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [STORE] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [STORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [STORE] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [STORE] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [STORE] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [STORE] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [STORE] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [STORE] SET  ENABLE_BROKER 
--GO
--ALTER DATABASE [STORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [STORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [STORE] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [STORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [STORE] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [STORE] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [STORE] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [STORE] SET RECOVERY FULL 
--GO
--ALTER DATABASE [STORE] SET  MULTI_USER 
--GO
--ALTER DATABASE [STORE] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [STORE] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [STORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [STORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO
--ALTER DATABASE [STORE] SET DELAYED_DURABILITY = DISABLED 
--GO
--EXEC sys.sp_db_vardecimal_storage_format N'STORE', N'ON'
--GO
--ALTER DATABASE [STORE] SET QUERY_STORE = OFF
--GO
--USE [STORE]
--GO
--ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
--GO
--ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
--GO
--ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
--GO
--ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
--GO
--ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
--GO
--ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
--GO
--ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
--GO
--ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
--GO
--USE [STORE]
--GO
--/****** Object:  Table [dbo].[Buying]    Script Date: 16/02/2022 13:09:19 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

--CREATE DATABASE REACT
--USE  REACT



CREATE TABLE [dbo].[Buying](
	[CodeBuying] [smallint] IDENTITY(10,10) NOT NULL,
	[CustID] [varchar](10) NULL,
	[SumBuying] [money] NULL,
	[DateBuying] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeBuying] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingDetails]    Script Date: 16/02/2022 13:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingDetails](
	[CodeBuyingDeatails] [smallint] IDENTITY(10,10) NOT NULL,
	[CodeBuying] [smallint] NULL,
	[CodeProduct] [smallint] NULL,
	[CountProducts] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeBuyingDeatails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/02/2022 13:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CodeCategory] [smallint] IDENTITY(1,1) NOT NULL,
	[NameCategory] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 16/02/2022 13:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [varchar](10) NOT NULL,
	[FirsName] [varchar](10) NULL,
	[LastName] [varchar](10) NULL,
	[CustAddress] [varchar](10) NULL,
	[CustCity] [varchar](10) NULL,
	[CustPhone] [varchar](10) NULL,
	[CustPassword] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/02/2022 13:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[CodeProduct] [smallint] IDENTITY(10,1) NOT NULL,
	[NameProduct] [varchar](10) NULL,
	[DescriptionProduct] [varchar](50) NULL,
	[CodeCategory] [smallint] NULL,
	[Cost] [money] NULL,
	[Picture] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buying] ON 

INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (50, N'324841949', 16100.0000, CAST(N'2020-02-19' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (60, N'226645620', 7850.0000, CAST(N'2019-11-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (80, N'324841949', 10000.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (90, N'324841949', 10000.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (100, N'324841949', 4520.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (120, N'324841949', 0.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (130, N'324841949', 0.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (140, N'324841949', 6260.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (150, N'324841949', 6260.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (160, N'111111111', 5500.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (170, N'111111111', 5500.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (180, N'111111111', 11110.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (190, N'111111111', 11110.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (200, N'324841949', 4050.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (210, N'111111111', 9110.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (220, N'111111111', 12850.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (230, N'324841949', 4520.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (240, N'324841949', 11110.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (250, N'111111111', 4520.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (260, N'324841949', 4520.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (270, N'324841949', 11110.0000, CAST(N'2022-02-14' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (280, N'324841949', 2.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (290, N'111111111', 4520.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (300, N'324841949', 8080.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (310, N'111111111', 4210.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (320, N'324841949', 8260.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (330, N'324841949', 8260.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (340, N'324841949', 5000.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (350, N'', 16110.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (360, N'324841949', 11110.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (370, N'', 16110.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (380, N'324841949', 5000.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (390, N'324841949', 15700.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (400, N'123456789', 20520.0000, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Buying] ([CodeBuying], [CustID], [SumBuying], [DateBuying]) VALUES (410, N'555555555', 7850.0000, CAST(N'2022-02-15' AS Date))
SET IDENTITY_INSERT [dbo].[Buying] OFF
SET IDENTITY_INSERT [dbo].[BuyingDetails] ON 

INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (10, 260, 10, 2)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (20, 260, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (30, 290, 12, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (40, 290, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (50, 300, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (60, 300, 14, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (70, 310, 18, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (80, 310, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (90, 320, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (100, 320, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (110, 330, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (120, 330, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (130, 340, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (140, 350, 11, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (150, 350, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (160, 360, 11, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (170, 360, 13, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (180, 370, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (190, 380, 10, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (200, 390, 11, 2)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (210, 400, 14, 1)
INSERT [dbo].[BuyingDetails] ([CodeBuyingDeatails], [CodeBuying], [CodeProduct], [CountProducts]) VALUES (220, 410, 11, 1)
SET IDENTITY_INSERT [dbo].[BuyingDetails] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (1, N'כורסאות')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (2, N'ספות')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (3, N'כסאות סלון')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (4, N'כסאות מטבח')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (5, N'כסאות פנאי')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (6, N'כסאות משרד')
INSERT [dbo].[Categories] ([CodeCategory], [NameCategory]) VALUES (7, N'אלגנט')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'031503675', N'Yitty', N'Lev', N'sfat-emet', N'Arad', N'oooooooooo', N'444')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'034547547', N'Avi', N'Lev', N'', N'Arad', N'050258963', N'547')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'111111111', N'Yitty', N'Blasbalg', N'sfat-emet', N'BeitShemes', N'0722357013', N'3333')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'123456789', N'zvi', N'ory', N'ssss', N'BeitShemes', N'0504116613', N'1234')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'226645620', N'משה', N'אור', N'השושנים', N'ערד', N'0737311000', N'1000')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'234232361', N'Maly', N'Slom', N'חפץ חיים', N'בית שמש', N'029999999', N'234')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'324841949', N'לאהלה', N'אורלינסקי', N'קהילת יעקב', N'בית שמש', N'02-9992946', N'2946')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'324856566', N'כבי', N'קושמרסקי', N'טיגכ', N'ירושלים', N'0504133999', N'33339999')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'555555555', N'Yitty', N'ory', N'ssss', N'rrrrrrrrrr', N'oooooooooo', N'5555')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'618.54635', N'uuuuuuuuuu', N'Blasbalg', N'ffffffffff', N'rrrrrrrrrr', N'oooooooooo', N'pppppppppp')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'618122545', N'uuuuuuuuuu', N'nvjgkju', N'kiouio', N'jh;lih', N'oooooooooo', N'254254')
INSERT [dbo].[Customer] ([CustID], [FirsName], [LastName], [CustAddress], [CustCity], [CustPhone], [CustPassword]) VALUES (N'987654321', N'Yitty', N';;;;;;;;;;', N'', N'rrrrrrrrrr', N'oooooooooo', N'pppppppppp')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (10, N'כורסת עור', N'כורסת עור חום כתום עם הדום', 1, 5000.0000, N'../../../assets/armchair/b.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (11, N'כורסת עור', N'כורסת עור איטלקי לבנה', 1, 7850.0000, N'../../../assets/armchair/cc.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (12, N'כורסת עור', N'כורסת עור אדומה', 1, 1260.0000, N'../../../assets/armchair/ddd.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (13, N'כורסת עור', N'כורסת עור חום תכול', 1, 3260.0000, N'../../../assets/armchair/f.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (14, N'כורסת עור', N'כורסת עור לבנה בעיצוב חדיש', 1, 4820.0000, N'../../../assets/armchair/gg.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (15, N'כורסת עור', N'כורסת עור חום בעיצוב עתיק ', 1, 3100.0000, N'../../../assets/armchair/h.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (16, N'כורסת עור', N'כורסת עור זהב תכול', 1, 2200.0000, N'../../../assets/armchair/i.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (17, N'כורסת בד', N'כורסת בד קטיפה אדומה ורכה', 1, 1560.0000, N'../../../assets/armchair/ll.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (18, N'כורסת עור', N'כורסת עור בשילוב עץ ', 1, 950.0000, N'../../../assets/armchair/n.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (19, N'כורסת בד', N'כורסת בד ורודה עם כרית תואמת', 1, 860.0000, N'../../../assets/armchair/qqq.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (20, N'כורסת בד', N'כורסת בד בשילוב עץ ', 1, 2820.0000, N'../../../assets/armchair/vvv.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (21, N'כורסת עור', N'כורסת עור עשירה', 1, 4650.0000, N'../../../assets/armchair/zz.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (22, N'כיסא סלון', N'כיסא סלוני בעיצוב פרסי', 3, 820.0000, N'../../../assets/diningroom/g.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (23, N'כיסא סלון', N'כיסא סלוני בעיצוב איטלקי', 3, 1300.0000, N'../../../assets/diningroom/m.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (24, N'כיסא סלון', N'כיסא סלוני בעיצוב ישראלי', 3, 960.0000, N'../../../assets/diningroom/ww.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (25, N'כיסא סלון', N'כיסא סלוני עם ידיות', 3, 1230.0000, N'../../../assets/diningroom/y.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (26, N'כיסא אלגנט', N'כיסא אלגנטי מכסף 9925 ', 7, 50000.0000, N'../../../assets/elegant/aaa.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (27, N'ספה אלגנט', N'ספה אלגנטית מלכותית', 7, 18500.0000, N'../../../assets/elegant/bb.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (28, N'ספה אלגנט', N'ספה אלגנטית קלאסית', 7, 16300.0000, N'../../../assets/elegant/c.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (29, N'כיסא אלגנט', N'כיסא אלגנט מעור עם ידיות', 7, 8700.0000, N'../../../assets/elegant/d.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (30, N'כיסא אלגנט', N'כיסא אלגנט מבד עם ידיות', 7, 8800.0000, N'../../../assets/elegant/ff.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (31, N'כיסא אלגנט', N'כיסא אלגנט אדום', 7, 2600.0000, N'../../../assets/elegant/j.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (32, N'כיסא אלגנט', N'כיסא אלגנט לבן זהב', 7, 9120.0000, N'../../../assets/elegant/jjj.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (33, N'כיסא אלגנט', N'כיסא אלגנט אדום', 7, 11200.0000, N'../../../assets/elegant/k.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (34, N'ספסל אלגנט', N'ספסל אלגנט לגינה לבן', 7, 1300.0000, N'../../../assets/elegant/mmm.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (35, N'ספה אלגנט', N'ספה אלגנטית קלאסית עם ידיות ', 7, 11600.0000, N'../../../assets/elegant/nnn.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (36, N'כיסא אלגנט', N'כיסא אלגנט אדום זהב', 7, 5300.0000, N'../../../assets/elegant/v.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (37, N'כיסא אלגנט', N'כיסא אלגנט מעור חום', 7, 6200.0000, N'../../../assets/elegant/x.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (40, N'כסאות מטבח', N'מערכת ישיבה למטבח', 4, 5000.0000, N'../../../assets/kitchen/s.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (41, N'כיסא מטבח', N'כיסא מטבח עץ ירוק', 4, 500.0000, N'../../../assets/kitchen/ss.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (42, N'כסאות מטבח', N'זוג כסאות מטבח מרופדים', 4, 1200.0000, N'../../../assets/kitchen/uuu.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (43, N'כיסא מטבח', N'כיסא מטבח עץ', 4, 320.0000, N'../../../assets/kitchen/w.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (44, N'כסאות מטבח', N'מערכת ישיבה למטבח כסאות מרופדים', 4, 5200.0000, N'../../../assets/kitchen/www.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (45, N'כסאות מטבח', N'מערכת ישיבה למטבח עץ', 4, 2100.0000, N'../../../assets/kitchen/yy.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (46, N'כיסא פנאי', N'כיסא אדום מסתובב', 5, 1400.0000, N'../../../assets/leisure/dd.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (47, N'כיסא פנאי', N'כיסא בד אפור נקודות ובסיס אדום', 5, 800.0000, N'../../../assets/leisure/ee.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (48, N'כיסא פנאי', N'כיסא פנאי בעיצוב ביצה', 5, 340.0000, N'../../../assets/leisure/ggg.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (49, N'כיסא פנאי', N'כיסא פנאי בעיצוב מפותל', 5, 420.0000, N'../../../assets/leisure/kk.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (50, N'כיסא פנאי', N'כיסא פנאי קלוע', 5, 280.0000, N'../../../assets/leisure/mm.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (51, N'כיסא פנאי', N'כיסא עץ עם ריפוד טורכיז רך', 5, 370.0000, N'../../../assets/leisure/ttt.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (52, N'כיסא משרדי', N'כיסא משרדי עור שחור', 6, 2300.0000, N'../../../assets/office/eee.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (53, N'כיסא משרדי', N'כיסא משרדי עור שחור', 6, 2200.0000, N'../../../assets/office/fff.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (54, N'כיסא משרדי', N'כיסא משרדי עור שחור', 6, 3100.0000, N'../../../assets/office/jj.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (55, N'כיסא משרדי', N'כיסא משרדי עור לבן', 6, 2600.0000, N'../../../assets/office/oo.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (56, N'כיסא משרדי', N'כיסא משרדי עור בז', 6, 2500.0000, N'../../../assets/office/ooo.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (57, N'כיסא משרדי', N'כיסא משרדי עור חום', 6, 3200.0000, N'../../../assets/office/pp.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (58, N'כיסא משרדי', N'כיסא משרדי בד כתום', 6, 950.0000, N'../../../assets/office/tt.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (59, N'כיסא משרדי', N'כיסא משרדי עור שחור', 6, 1980.0000, N'../../../assets/office/xx.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (60, N'כיסא משרדי', N'כיסא משרדי בד אדום', 6, 1620.0000, N'../../../assets/office/z.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (61, N'ספה', N'ספת בד ורודה', 2, 3200.0000, N'../../../assets/sofa/a.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (62, N'ספה', N'ספת עור לבנה', 2, 2500.0000, N'../../../assets/sofa/aa.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (63, N'ספה', N'ספת עור לבנה פינתית', 2, 13000.0000, N'../../../assets/sofa/ccc.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (64, N'ספה', N'ספת בד כחולה מעוצבת', 2, 3200.0000, N'../../../assets/sofa/e.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (65, N'ספה', N'ספת בד כאמל', 2, 9600.0000, N'../../../assets/sofa/hh.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (66, N'ספה', N'ספת בד סגולה עם כריות', 2, 6200.0000, N'../../../assets/sofa/hhh.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (67, N'ספה', N'ספת בד אדומה', 2, 5200.0000, N'../../../assets/sofa/iii.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (68, N'ספה', N'ספת גיזעית לבנה', 2, 4100.0000, N'../../../assets/sofa/nn.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (69, N'ספה', N'ספה מפוספסת בעיצוב מעניין', 2, 7200.0000, N'../../../assets/sofa/o.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (70, N'ספה', N'ספה מטפסת', 2, 8100.0000, N'../../../assets/sofa/qq.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (71, N'ספה', N'מערכת ספות 2+3', 2, 15900.0000, N'../../../assets/sofa/r.jpg')
INSERT [dbo].[Products] ([CodeProduct], [NameProduct], [DescriptionProduct], [CodeCategory], [Cost], [Picture]) VALUES (72, N'ספה', N'ספת בד אפורה', 2, 7400.0000, N'../../../assets/sofa/xxx.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Buying]  WITH CHECK ADD FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustID])
GO
ALTER TABLE [dbo].[BuyingDetails]  WITH CHECK ADD FOREIGN KEY([CodeBuying])
REFERENCES [dbo].[Buying] ([CodeBuying])
GO
ALTER TABLE [dbo].[BuyingDetails]  WITH CHECK ADD FOREIGN KEY([CodeProduct])
REFERENCES [dbo].[Products] ([CodeProduct])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CodeCategory])
REFERENCES [dbo].[Categories] ([CodeCategory])
GO
--USE [master]
--GO
--ALTER DATABASE [STORE] SET  READ_WRITE 
--GO
