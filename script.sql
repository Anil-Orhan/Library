USE [master]
GO
/****** Object:  Database [CarDb]    Script Date: 03/12/2021 17:15:33 ******/
CREATE DATABASE [CarDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarDb', FILENAME = N'C:\Users\anilo\CarDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarDb_log', FILENAME = N'C:\Users\anilo\CarDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarDb] SET  MULTI_USER 
GO
ALTER DATABASE [CarDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarDb] SET QUERY_STORE = OFF
GO
USE [CarDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CarDb]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
	[ModelYear] [nvarchar](50) NOT NULL,
	[DailyPrice] [money] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[UserID] [int] NULL,
	[CompanyName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NULL,
	[CustomerID] [int] NULL,
	[RentDate] [date] NULL,
	[ReturnDate] [date] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/12/2021 17:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1, N'BMW')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (2, N'AUDI')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (3, N'FORD')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (4, N'WOLKSVAGEN')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (5, N'OPEL')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1002, N'BMW')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1003, N'AUDI')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1004, N'FORD')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1005, N'WOLKSVAGEN')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1006, N'OPEL')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [BrandID], [ColorID], [ModelYear], [DailyPrice], [Description]) VALUES (46, 3, 2, N'2019', 250.0000, N'12000KM Lokal Boyalı Depo Dolu')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ColorID], [ModelYear], [DailyPrice], [Description]) VALUES (47, 2, 2, N'2020', 385.0000, N'6.000 KM Tam dolu hasarsız')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (1, N'RED')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (2, N'GREEN')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (3, N'BLUE')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (4, N'YELLOW')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (5, N'ORANGE')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (6, N'BROWN')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (7, N'BLACK')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
INSERT [dbo].[Customers] ([UserID], [CompanyName]) VALUES (8, N'Tumpa Group')
INSERT [dbo].[Customers] ([UserID], [CompanyName]) VALUES (5, N'Bitexxen')
INSERT [dbo].[Customers] ([UserID], [CompanyName]) VALUES (7, N'Group Tekstil')
INSERT [dbo].[Customers] ([UserID], [CompanyName]) VALUES (9, N'Yuce Otomotiv')
INSERT [dbo].[Customers] ([UserID], [CompanyName]) VALUES (10, N'Tombul İnsaat')
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([RentalID], [CarID], [CustomerID], [RentDate], [ReturnDate]) VALUES (1, 45, 8, CAST(N'2021-11-14' AS Date), CAST(N'2021-11-18' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [CarID], [CustomerID], [RentDate], [ReturnDate]) VALUES (2, 46, 6, NULL, NULL)
INSERT [dbo].[Rentals] ([RentalID], [CarID], [CustomerID], [RentDate], [ReturnDate]) VALUES (3, 0, 0, CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [CarID], [CustomerID], [RentDate], [ReturnDate]) VALUES (4, 45, 7, CAST(N'2021-11-13' AS Date), CAST(N'2021-11-18' AS Date))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (5, N'Anıl', N'Orhan', N'anilorhan-@hotmail.com', N'123456')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Mehmet Tugay', N'Can', N'mtc@gmail.com', N'321321')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (7, N'Tuğba', N'Albayrak', N'albayraktgb@gmail.com', N'299595')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (8, N'Metehan', N'Yüce', N'metehanyuce@tumpa.com', N'01012030')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (9, N'Burak Cem', N'Yüce', N'brkcmyc@hotmail.com', N'161696')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (10, N'Şerif', N'Tombul', N'seriftombul27@gmail.com', N'271665')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (11, N'Ersin', N'Çakıcı', N'ersnckc52@hotmail.com', N'525252')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (12, N'Doğuş', N'Varyemez', N'dogusvrymz@hotmail.com', N'shiba0.01')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Rentals] ADD  CONSTRAINT [DF_Rentals_ReturnDate]  DEFAULT (NULL) FOR [ReturnDate]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
USE [master]
GO
ALTER DATABASE [CarDb] SET  READ_WRITE 
GO
