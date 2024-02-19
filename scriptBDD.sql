USE [master]
GO
/****** Object:  Database [bddProjetHotel]    Script Date: 19/02/2024 15:48:20 ******/
CREATE DATABASE [bddProjetHotel]
GO
ALTER DATABASE [bddProjetHotel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bddProjetHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bddProjetHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bddProjetHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bddProjetHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bddProjetHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bddProjetHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [bddProjetHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bddProjetHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bddProjetHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bddProjetHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bddProjetHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bddProjetHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bddProjetHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bddProjetHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bddProjetHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bddProjetHotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bddProjetHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bddProjetHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bddProjetHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bddProjetHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bddProjetHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bddProjetHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bddProjetHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bddProjetHotel] SET RECOVERY FULL 
GO
ALTER DATABASE [bddProjetHotel] SET  MULTI_USER 
GO
ALTER DATABASE [bddProjetHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bddProjetHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bddProjetHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bddProjetHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bddProjetHotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bddProjetHotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bddProjetHotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [bddProjetHotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bddProjetHotel]
GO
/****** Object:  Table [dbo].[chambre]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chambre](
	[nohotel] [int] NOT NULL,
	[nochambre] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nohotel] ASC,
	[nochambre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement](
	[noequ] [int] IDENTITY(1,1) NOT NULL,
	[lib] [varchar](255) NOT NULL,
	[imgequ] [varchar](50) NULL,
 CONSTRAINT [PK__equipeme__E56BE9F31E053AEF] PRIMARY KEY CLUSTERED 
(
	[noequ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equiper]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equiper](
	[nohotel] [int] NOT NULL,
	[noequ] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nohotel] ASC,
	[noequ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[nohotel] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[adr1] [varchar](255) NOT NULL,
	[adr2] [varchar](255) NULL,
	[cp] [varchar](5) NOT NULL,
	[ville] [varchar](255) NOT NULL,
	[tel] [varchar](20) NOT NULL,
	[descourt] [varchar](255) NULL,
	[deslong] [varchar](1000) NULL,
	[prix] [float] NOT NULL,
	[password] [varchar](255) NOT NULL,
 CONSTRAINT [PK__hotel__4E501312B67378F7] PRIMARY KEY CLUSTERED 
(
	[nohotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[photo]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photo](
	[nohotel] [int] NOT NULL,
	[nophoto] [int] NOT NULL,
	[nomfichier] [varchar](255) NULL,
 CONSTRAINT [PK__photo__635A91202F44CEB3] PRIMARY KEY CLUSTERED 
(
	[nohotel] ASC,
	[nophoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[noresglobale] [int] IDENTITY(1,1) NOT NULL,
	[nohotel] [int] NOT NULL,
	[nores] [int] NOT NULL,
	[datedeb] [datetime] NULL,
	[datefin] [datetime] NULL,
	[nom] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[codeacces] [varchar](5) NULL,
 CONSTRAINT [PK_reservation] PRIMARY KEY CLUSTERED 
(
	[noresglobale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserver]    Script Date: 19/02/2024 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserver](
	[nohotel] [int] NOT NULL,
	[nochambre] [int] NOT NULL,
	[noresglobale] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nohotel] ASC,
	[nochambre] ASC,
	[noresglobale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 66)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 67)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 68)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 69)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 70)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 71)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 72)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 73)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 74)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 75)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 76)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 77)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 78)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 79)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 80)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 81)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 82)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 83)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 84)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 85)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 86)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 87)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 88)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 89)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 90)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 91)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 92)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 93)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 94)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 95)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 99)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 100)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 101)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 102)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 103)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 104)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 105)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 106)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 107)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 108)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 109)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 110)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 111)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 112)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 113)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 114)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 115)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 116)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 117)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 118)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 119)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 120)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 121)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 122)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 123)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 124)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 125)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 126)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 127)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 128)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 129)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 130)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 131)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 132)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 133)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 134)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 135)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 136)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 137)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 138)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 139)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 140)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 141)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 142)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 143)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 144)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 145)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 146)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 147)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 148)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 149)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 150)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 151)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 152)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 153)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 154)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 155)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 156)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 157)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 158)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 159)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 160)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 161)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 162)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 163)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 164)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 165)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 166)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 167)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 168)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 169)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1, 170)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (2, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (3, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (4, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (5, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (6, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (7, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (8, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (9, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (10, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (11, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (12, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (13, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (14, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (15, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 1)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 2)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 3)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 4)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 5)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 6)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 7)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 8)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 9)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 10)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 11)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 12)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 13)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 14)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 15)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 16)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 17)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 18)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 19)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 20)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 21)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 22)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 23)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 24)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 25)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 26)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 27)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 28)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 29)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 30)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 31)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 32)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 33)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 34)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 35)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 36)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 37)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 38)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 39)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 40)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 41)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 42)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 43)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 44)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 45)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 46)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 47)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 48)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 49)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 50)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 51)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 52)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 53)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 54)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 55)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 56)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 57)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 58)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 59)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 60)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 61)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 62)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 63)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 64)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 65)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 66)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 67)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 68)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 69)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 70)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 71)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 72)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 73)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 74)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 75)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 76)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 77)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 78)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 79)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 80)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 81)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 82)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 83)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 84)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 85)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 86)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 87)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 88)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 89)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 90)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 91)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 92)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 93)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 94)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 95)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 96)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 97)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 98)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 99)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 100)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 101)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 102)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 103)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 104)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 105)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 106)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 107)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 108)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 109)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 110)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 111)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 112)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 113)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 114)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 115)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 116)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 117)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 118)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 119)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 120)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 121)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 122)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 123)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 124)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 125)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 126)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 127)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 128)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 129)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 130)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 131)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 132)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 133)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 134)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 135)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 136)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 137)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 138)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 139)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 140)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 141)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 142)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 143)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 144)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 145)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 146)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 147)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 148)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 149)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 150)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 151)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 152)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 153)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 154)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 155)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 156)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 157)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 158)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 159)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 160)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 161)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 162)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 163)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 164)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 165)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 166)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 167)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 168)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 169)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 170)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 171)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 172)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 173)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 174)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 175)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 176)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 177)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 178)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 179)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 180)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 181)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 182)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 183)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 184)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 185)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 186)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 187)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 188)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 189)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 190)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 191)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 192)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 193)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 194)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 195)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 196)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 197)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 198)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 199)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 200)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 201)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 202)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 203)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 204)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 205)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 206)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 207)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 208)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 209)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 210)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 211)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 212)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 213)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 214)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 215)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 216)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 217)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 218)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 219)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 220)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 221)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 222)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 223)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 224)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 225)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 226)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 227)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 228)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 229)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 230)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 231)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 232)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 233)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 234)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 235)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 236)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 237)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 238)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 239)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 240)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 241)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 242)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 243)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 244)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 245)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 246)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 247)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 248)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 249)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 250)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 251)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 252)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 253)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 254)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 255)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 256)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 257)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 258)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 259)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 260)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 261)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 262)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 263)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 264)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 265)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 266)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 267)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 268)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 269)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 270)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 271)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 272)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 273)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 274)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 275)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 276)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 277)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 278)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 279)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 280)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 281)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 282)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 283)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 284)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 285)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 286)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 287)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 288)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 289)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 290)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 291)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 292)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 293)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 294)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 295)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 296)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 297)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 298)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 299)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 300)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 301)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 302)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 303)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 304)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 305)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 306)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 307)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 308)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 309)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 310)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 311)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 312)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 313)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 314)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 315)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 316)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 317)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 318)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 319)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 320)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 321)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 322)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 323)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 324)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 325)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 326)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 327)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 328)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 329)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 330)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 331)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 332)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 333)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 334)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 335)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 336)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 337)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 338)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 339)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 340)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 341)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 342)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 343)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 344)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 345)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 346)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 347)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 348)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 349)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 350)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 351)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 352)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 353)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 354)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 355)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 356)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 357)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 358)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 359)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 360)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 361)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 362)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 363)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 364)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 365)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 366)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 367)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 368)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 369)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 370)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 371)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 372)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 373)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 374)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 375)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 376)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 377)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 378)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 379)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 380)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 381)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 382)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 383)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 384)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 385)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 386)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 387)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 388)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 389)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 390)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 391)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 392)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 393)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 394)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 395)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 396)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 397)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 398)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 399)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 400)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 401)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 402)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 403)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 404)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 405)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 406)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 407)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 408)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 409)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 410)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 411)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 412)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 413)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 414)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 415)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 416)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 417)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 418)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 419)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 420)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 421)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 422)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 423)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 424)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 425)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 426)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 427)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 428)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 429)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 430)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 431)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 432)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 433)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 434)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 435)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 436)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 437)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 438)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 439)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 440)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 441)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 442)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 443)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 444)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 445)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 446)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 447)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 448)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 449)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 450)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 451)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 452)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 453)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 454)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 455)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 456)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 457)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 458)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 459)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 460)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 461)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 462)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 463)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 464)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 465)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 466)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 467)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 468)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 469)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 470)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 471)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 472)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 473)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 474)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 475)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 476)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 477)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 478)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 479)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 480)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 481)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 482)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 483)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 484)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 485)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 486)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 487)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 488)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 489)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 490)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 491)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 492)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 493)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 494)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 495)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 496)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 497)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 498)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 499)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 500)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 501)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 502)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 503)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 504)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 505)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 506)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 507)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 508)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 509)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 510)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 511)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 512)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 513)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 514)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 515)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 516)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 517)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 518)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 519)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 520)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 521)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 522)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 523)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 524)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 525)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 526)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 527)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 528)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 529)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 530)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 531)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 532)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 533)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 534)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 535)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 536)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 537)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 538)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 539)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 540)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 541)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 542)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 543)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 544)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 545)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 546)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 547)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 548)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 549)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 550)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 551)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 552)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 553)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 554)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 555)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 556)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 557)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 558)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 559)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 560)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 561)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 562)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 563)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 564)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 565)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 566)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 567)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 568)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 569)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 570)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 571)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 572)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 573)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 574)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 575)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 576)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 577)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 578)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 579)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 580)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 581)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 582)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 583)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 584)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 585)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 586)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 587)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 588)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 589)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 590)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 591)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 592)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 593)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 594)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 595)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 596)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 597)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 598)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 599)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 600)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 601)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 602)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 603)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 604)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 605)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 606)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 607)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 608)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 609)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 610)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 611)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 612)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 613)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 614)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 615)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 616)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 617)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 618)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 619)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 620)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 621)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 622)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 623)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 624)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 625)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 626)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 627)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 628)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 629)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 630)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 631)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 632)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 633)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 634)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 635)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 636)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 637)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 638)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 639)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 640)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 641)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 642)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 643)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 644)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 645)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 646)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 647)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 648)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 649)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 650)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 651)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 652)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 653)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 654)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 655)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 656)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 657)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 658)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 659)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 660)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 661)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 662)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 663)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 664)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 665)
GO
INSERT [dbo].[chambre] ([nohotel], [nochambre]) VALUES (1023, 666)
GO
SET IDENTITY_INSERT [dbo].[equipement] ON 
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (3, N'Wifi', N'wifi.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (4, N'Animaux admis', N'animaux.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (5, N'Petit Déjeuner', N'petitdejeuner.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (6, N'Bar', N'bar.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (7, N'Restaurant', N'restaurant.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (8, N'Climatisation', N'climatisation.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (9, N'Parking', N'parking.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (10, N'Salle de réunion', N'sallereunion.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (11, N'Accès handicapés', N'handicapes.png')
GO
INSERT [dbo].[equipement] ([noequ], [lib], [imgequ]) VALUES (12, N'Piscine', N'piscine.png')
GO
SET IDENTITY_INSERT [dbo].[equipement] OFF
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (2, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (3, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (4, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (4, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (4, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (5, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (6, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (6, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (6, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (7, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (8, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (8, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (8, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (9, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (9, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (10, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (11, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (12, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (13, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (13, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (14, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (14, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (14, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 5)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 8)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 9)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 10)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 11)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (15, 12)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1023, 3)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1023, 4)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1023, 6)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1023, 7)
GO
INSERT [dbo].[equiper] ([nohotel], [noequ]) VALUES (1023, 12)
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (1, N'demo', N'adr1', N'adr2', N'cp', N'ville', N'tel', N'descourt', N'desclong', 10, N'demo')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (2, N'LYON - DARDILLY', N'15 Chemin de Gargantua', N'Sortie: 33b Dardilly-Porte de lyon', N'69570', N'DARDILLY', N'+33 (0)4 78 66 77 77', N'L''hôtel Lyon Nord Dardilly, entièrement rénové en 2011, est situé à 11 kilomètres du centre-ville de Lyon.', N'L''hôtel, entièrement rénové en 2015, propose un restaurant-bar, un parking gratuit et une connexion Wi-Fi gratuite dans chaque chambre. Le Lyon Nord Dardilly dispose de 60 chambres avec terrasse et télévision par satellite et par câble. Vous pourrez choisir parmi une sélection de plats traditionnels et régionaux servis dans le restaurant de l''hôtel. Le Lyon Nord Dardilly se trouve à proximité des musées et des théâtres de Lyon. Vous pourrez également vous rendre dans les Alpes voisines et profiter des pistes de ski et des sentiers de randonnée. L''hôtel est ouvert 24h/24 et les chambres sont disponibles dès 14H. ATTENTION : Restaurant fermé pour congés du 22/12/14 au 04/01/15 inclus.', 55, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (3, N'LYON - VILLEFRANCHE-SUR-SAONE', N'365 av. Theodore - Braun', NULL, N'69400', N'VILLEFRANCHE-SUR-SAONE', N'+33 (0)4 74 62 89 13', N'L''hotel est situé à Villefranche-sur-Saone, à 15 minutes au nord de Lyon. Vous apprécierez le calme et la convivialité de notre hotel. Les horaires d''ouverture de la réception sont les suivants : Du Lundi Matin au Vendredi Soir de 7H00 à 23H00. Le Samedi ', N'L’hôtel de Villefranche sur Saône, entièrement climatisé, dispose de 50 chambres tout confort, équipées : d’une salle de bain/douche avec toilettes, d’une télévision écran plat LED avec canal+, canal satellite et les chaines internationales, d’un téléphone direct avec réveil automatique ainsi que d’une connexion Wifi gratuite. Dans votre chambre, vous trouverez tout le confort nécessaire dans un cadre moderne et fonctionnel. Vous pourrez également vous restaurer dans notre restaurant où le buffet est à volonté ! Pour vous détendre, un salon ainsi qu’une terrasse ombragée sont à votre disposition. L’hôtel propose un parking privé gratuit fermé la nuit. L''hôtel de Villefranche sur Saône se situe à 300 m de l’autoroute, à 2 mn du parc des expositions, à 5 mn du centre ville, à 15 mn du centre de Lyon, 30 mn de l’aéroport, et à 20 mn des Dombes (Parc des oiseaux) et du Hameau du Beaujolais. A quelques minutes d’Ars. ', 48, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (4, N'LYON - BRON', N'16 rue Maryse Bastie', N'', N'69500', N'BRON', N'+33 (0)4 72 37 46 46', N'L''Hôtel Lyon-Bron, idéal pour les escales et les voyages d''affaires courts, jouit d''un emplacement privilégié à seulement 5 minutes du parc des expositions Eurexpo, à 10 minutes du centre de Lyon et à 15 minutes de l''aéroport international Lyon Saint Exup', N'Nous vous proposons 50 chambres non-fumeurs tout confort, climatisées, avec WIFI gratuit et un parking fermé sous surveillance vidéo enregistrée. Nous nous ferons un plaisir de vous accueillir pour vos séjours professionnels et touristiques. L''hôtel dispose aussi d''un bar avec terrasse et d''un parking privé avec système de vidéosurveillance. Plusieurs restaurants sont accessibles à proximité de cet établissement.', 55, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (5, N'LYON - GIVORS', N'Centre Commercial des 2 vallees', N'Rue de la paix', N'69700', N'GIVORS', N'+33 (0)4 72 24 15 56', N'L''hotel Lyon-Givors vous accueille dans la périphérie de Lyon. Vous apprécierez l''accueil chaleureux et amical de notre équipe.', N'Nous vous proposons 27 chambres tout confort, équipées de salle de bain et télévision satellite. Venez vous détendre au bar ou prendre un verre sur la terrasse. Idéal pour vos voyages ou vos soirées étapes, vous trouverez ici le confort et la douceur de vivre. Lyon capitale historique et gastronomique à 15 min. Eurexpo à 30 min', 46, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (6, N'DIJON - NORD', N'4 rue des Ardennes', N'Village Auto', N'21000', N'DIJON', N'+33 (0)3 80 78 90 80', N'L''hôtel Dijon vous attend pour vous offrir un accueil à la fois chaleureux et personnel. L''hôtel est idéal pour un séjour en famille ou entre amis, et y passer un agréable moment.', N'L''Hôtel Dijon Nord vous accueille 24h/24 dans ses 53 chambres non fumeur, entièrement équipées et climatisées avec l''accès wifi gratuit. Nous disposons également de chambres familiales et communicantes. Toute l''équipe de notre restaurant aura le plaisir de vous accueillir tous les jours (sauf le Samedi midi et Dimanche midi) pour vous servir des spécialités bourguignonnes, des grillades, pizzas, salades... Dès les beaux jours vous pourrez profiter de notre terrasse ainsi que de la piscine extérieur.', 53, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (7, N'DIJON - MARSANNAY', N'84 Route de Beaune', NULL, N'21160', N'MARSANNAY-LA-COTE', N'+33 (0)3 80 51 10 00', N'Situé à quelques minutes de Dijon, l''hôtel Superior sera le point de départ pour découvrir la route des Grands Crus de Bourgogne, le prestigieux Palais de ses Grands Ducs et le centre médiéval de la ville.', N'Le Superior vous propose 49 chambres climatisées, toutes équipées de salle de bain et wc privés, Wifi gratuit, téléviseur LCD, canal+, canal sat et téléphone direct, dont 2 chambres accessibles aux personnes à mobilité réduite. Vous aurez un large choix de chambres doubles, triples et quadruples. A la belle saison vous apprécierez la piscine chauffée. Un parking fermé sous vidéo surveillance est à votre disposition.', 63, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (8, N'GRIGNY', N'10 Avenue des Tuileries', NULL, N'91350', N'GRIGNY', N'+33 (0)1 69 43 53 33', N'Notre hôtel, situé à proximité de l''autoroute A6, à 15 min de l''aéroport d''Orly et à 2 minutes à pied de la ligne D du RER, est ouvert 24/24 7/7j.', N'L''hôtel propose un hébergement de qualité à un prix abordable. Toutes les chambres, à la décoration sobre et brillante, sont spacieuses et confortables. Elles sont toutes dotées d''équipements modernes, comme la salle de bains privative, la télévision satellite et l''accès Internet sans fil.', 51, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (9, N'CHILLY MAZARIN', N'4 rue Denis Papin', N'ZI La Vigne aux Loups', N'91380', N'CHILLY - MAZARIN', N'+33 (0)1 69 09 02 22', N'Situé à proximité de l''aéroport Paris Orly, entre les autoroutes A6 et A10, , l''hôtel de Chilly Mazarin vous accueille dans une de ses 80 chambres.', N'L''hôtel propose des chambres spacieuses dotées de 1 à 2 lits et d''une connexion WiFi gratuite. Ses chambres offrent des espaces de vie confortables, parfaits pour une étape ou un séjour de courte durée dans la région. La station de RER toute proche vous place à mi-chemin du Château de Versailles et du centre de Paris. L''aéroport de Paris-Orly se trouve à seulement 10 minutes de l''hôtel.', 50, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (10, N'ANTONY', N'1 rue Alexis de Tocqueville', NULL, N'92160', N'ANTONY', N'+33 (0)1 55 59 98 46', N'Cet hôtel se trouve à Antony, à quelques minutes de route des autoroutes A6 et A10, et à 10 minutes de l''aéroport d''Orly.', N'Chaque chambre comprend une connexion Wi-Fi gratuite, la télévision par satellite, Canal+ et une salle de bains. Un petit déjeuner buffet est proposé en matinée et le restaurant de l''hôtel sert des plats de saison pour le déjeuner et le dîner. En soirée, vous pouvez vous détendre dans le bar de l''Hôtel Antony Superior. L''Hôtel se trouve à 1,5 km de la station de RER Fontaine-Michalon, qui permet de rejoindre le centre de Paris. En voiture, la capitale est accessible en 20 minutes.', 79, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (11, N'MOISSY-CRAMAYEL', N'Zone Industrielle de Chateau d''eau', N'612 Avenue Andre Ampere', N'77550', N'MOISSY-CRAMAYEL', N'+33 (0)1 64 13 63 63', N'L''hôtel Moissy-Cramayel propose un hébergement confortable et un accueil chaleureux et convivial à 5 minutes de la place Sénart', N'Les chambres confortables sont dotées d''une salle de bains privative, d''une télévision et d''un téléphone. L''accès Internet sans fil est disponible dans les parties communes et un parking gratuit est disponible sur place. Dans la matinée, profitez du petit déjeuner buffet copieux.', 41, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (12, N'SAVIGNY-LE-TEMPLE', N'155 / 159 rue de l''Industrie', NULL, N'77176', N'SAVIGNY-LE-TEMPLE', N'+33 (0)1 60 63 08 40', N'Hôtel entièrement rénové ! A 35 km de Disneyland Paris et de la Capitale, à 10 minutes du Château de Vaux le Vicomte et de l''Espace Millénaire, nous saurons vous faire allier déplacement professionnel et plaisir de la connaissance !', N'Offrant une télévision à écran plat dans les chambres et une connexion Wi-Fi gratuite, l''hôtel  Le Temple propose des équipements modernes et un accueil chaleureux. Les chambres sont confortables et disposent de salle de bains privée et de tout le confort moderne. Démarrez la journée en beauté en dégustant un petit déjeuner buffet savoureux et copieux.', 45, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (13, N'RAMBOUILLET', N'Rue Joseph Jacquart', NULL, N'78120', N'RAMBOUILLET', N'+33 (0)1 34 94 90 26', N'Notre hôtel vous accueille pour une halte reposante à 50km de Paris et à proximité de l''aéroport d''Orly.', N'Cet hôtel propose un hébergement économique en périphérie de Rambouillet et près du parc naturel régional de la Haute Vallée de Chevreuse. Une connexion Wi-Fi gratuite est disponible dans tout l''établissement. Chaque chambre de l''Hôtel  Rambouillet possède une salle de bain privative et une télévision avec les chaînes satellite. L''Hôtel  Rambouillet occupe un emplacement idéal, à 2,5 km du centre-ville et de la gare de Rambouillet. Il se trouve également à 40 minutes de route de l''aéroport de Paris-Orly et est facilement accessible depuis l''autoroute N10. Les clients voyageant en voiture apprécieront le parking gratuit.', 51, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (14, N'TRAPPES', N'Rue gaston Monmousseau', N'Z.A. de Trappes Elancourt', N'78190', N'TRAPPES', N'+33 (0)1 30 50 82 42', N'A 5 minutes du centre-ville, 10 minutes du Vélodrome National de Saint Quentin en Yvelines, l''hôtel Trappes est une destination de choix pour se dépayser de la capitale sans en être très loin, à seulement 40 minutes.', N'Proche des centres d''affaires et des sites touristiques (Vélodrome National, Golf de St Quentin, Versailles…), cet établissement est idéal aussi bien pour les déplacements professionnels que pour les séjours loisirs. Ses 67 chambres comprennent une salle de bain privative avec baignoire ou douche, une télévision satellite, un accès Wifi gratuit. L''hôtel dispose également de 3 salles de réunion équipées (d''une capacité de 5 à 50 personnes) ainsi que d''une grande terrasse extérieure pouvant accueillir jusqu''à 30 personnes.', 85, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (15, N'BOURG-EN-BRESSE - VIRIAT', N'694 rue des Vareys', N'Parc de la Chambiere', N'01440', N'VIRIAT', N'+33 (0)4 74 45 11 35', N'Situé sur une zone d’activité, à proximité du nœud autoroutier A39, 40 et 42, l’hôtel ffre une position stratégique d’où que vous veniez.', N'L''Hôtel Bourg En Bresse vous propose des chambres confortables à des tarifs abordables à proximité de l''autoroute, à 3 kilomètres du centre-ville et à 4 kilomètres de la gare. Vous pourrez profiter de la connexion Wi-Fi gratuite illimitée et du parking privé gratuit. Les chambres possèdent une salle de bains privative avec douche, lavabo et toilettes, un espace de travail, une télévision à écran plat et la climatisation en été. Certaines chambres comprennent des toilettes privées et des douches communes. Hôtel non fumeur. Merci de nous informer au préalable pour toute arrivée en dehors des horaires d''ouverture de la réception (ouvert de 7h-12h et 17h-21h). Les chambres doivent être libérées à 11h00 le jour du départ. Les animaux sont admis.', 30, N'password')
GO
INSERT [dbo].[hotel] ([nohotel], [nom], [adr1], [adr2], [cp], [ville], [tel], [descourt], [deslong], [prix], [password]) VALUES (1023, N'HAZBIN HOTEL', N'Enfer, Cercle de l''Orgueil', N'', N'66600', N'Pentagram City', N'66 66 66 66 66', N'Explorez le Hazbin Hotel, dans le Pride Ring of Hell. Géré par Charlie Morningstar, cet établissement délabré offre une expérience unique de réhabilitation pour les pécheurs, mêlant décadence et rédemption. Un refuge royal au cœur du chaos infernal.', N'Bienvenue au Hazbin Hotel, ex-Happy Hotel, situé dans le Pride Ring of Hell à Pentagram City. Géré par Charlie Morningstar, cet hôtel délabré a pour mission de réhabiliter les pécheurs et soulager la surpopulation infernale. L''extérieur extravagant contraste avec un intérieur délabré, conservant une touche royale avec des vitraux et une palette rouge et or.

Le Caviar Bar offre une atmosphère de casino, tandis que le personnel, comprenant Charlie, Vaggie, Alastor, Niffty, et Husk, travaille à réhabiliter les pécheurs. Hazbin Hotel attire une clientèle variée, du roi de l''Enfer à d''autres individus divers.

Autrefois propriété royale, l''hôtel est devenu un refuge sous la direction de Charlie. Alastor offre son partenariat pour promouvoir l''établissement, créant une expérience unique où décadence et rédemption se rencontrent dans ce refuge délabré au cœur du chaos infernal de Pentagram City.', 666, N'hell')
GO
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (1, 1, N'01.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (2, 2, N'02.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (3, 3, N'03.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (4, 4, N'04.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (5, 5, N'05.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (6, 6, N'06.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (7, 7, N'07.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (8, 8, N'08.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (9, 9, N'09.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (10, 10, N'10.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (11, 11, N'11.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (12, 12, N'12.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (13, 13, N'13.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (14, 14, N'14.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (15, 15, N'15.jpg')
GO
INSERT [dbo].[photo] ([nohotel], [nophoto], [nomfichier]) VALUES (1023, 666, N'hazbin_hotel.png')
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 
GO
INSERT [dbo].[reservation] ([noresglobale], [nohotel], [nores], [datedeb], [datefin], [nom], [email], [codeacces]) VALUES (8183, 1023, 1, CAST(N'2024-02-02T00:00:00.000' AS DateTime), CAST(N'2024-02-06T00:00:00.000' AS DateTime), N'toi', N'moi@mail.com', N'64039')
GO
INSERT [dbo].[reservation] ([noresglobale], [nohotel], [nores], [datedeb], [datefin], [nom], [email], [codeacces]) VALUES (8184, 10, 1, CAST(N'2024-02-02T00:00:00.000' AS DateTime), CAST(N'2024-02-03T00:00:00.000' AS DateTime), N'deux', N'dfccs@ere', N'23105')
GO
INSERT [dbo].[reservation] ([noresglobale], [nohotel], [nores], [datedeb], [datefin], [nom], [email], [codeacces]) VALUES (8185, 1023, 2, CAST(N'2024-02-08T00:00:00.000' AS DateTime), CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'jesuistoi', N'test@mail.com', N'46403')
GO
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (10, 1, 8184)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (10, 3, 8184)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (10, 5, 8184)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (1023, 1, 8185)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (1023, 3, 8185)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (1023, 4, 8185)
GO
INSERT [dbo].[reserver] ([nohotel], [nochambre], [noresglobale]) VALUES (1023, 666, 8183)
GO
ALTER TABLE [dbo].[chambre]  WITH CHECK ADD  CONSTRAINT [FK__chambre__nohotel__4222D4EF] FOREIGN KEY([nohotel])
REFERENCES [dbo].[hotel] ([nohotel])
GO
ALTER TABLE [dbo].[chambre] CHECK CONSTRAINT [FK__chambre__nohotel__4222D4EF]
GO
ALTER TABLE [dbo].[equiper]  WITH CHECK ADD  CONSTRAINT [FK__equiper__noequ__3C69FB99] FOREIGN KEY([noequ])
REFERENCES [dbo].[equipement] ([noequ])
GO
ALTER TABLE [dbo].[equiper] CHECK CONSTRAINT [FK__equiper__noequ__3C69FB99]
GO
ALTER TABLE [dbo].[equiper]  WITH CHECK ADD  CONSTRAINT [FK__equiper__nohotel__3B75D760] FOREIGN KEY([nohotel])
REFERENCES [dbo].[hotel] ([nohotel])
GO
ALTER TABLE [dbo].[equiper] CHECK CONSTRAINT [FK__equiper__nohotel__3B75D760]
GO
ALTER TABLE [dbo].[photo]  WITH CHECK ADD  CONSTRAINT [FK__photo__nohotel__3F466844] FOREIGN KEY([nohotel])
REFERENCES [dbo].[hotel] ([nohotel])
GO
ALTER TABLE [dbo].[photo] CHECK CONSTRAINT [FK__photo__nohotel__3F466844]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_hotel] FOREIGN KEY([nohotel])
REFERENCES [dbo].[hotel] ([nohotel])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_hotel]
GO
ALTER TABLE [dbo].[reserver]  WITH CHECK ADD  CONSTRAINT [FK__reserver__chambre] FOREIGN KEY([nohotel], [nochambre])
REFERENCES [dbo].[chambre] ([nohotel], [nochambre])
GO
ALTER TABLE [dbo].[reserver] CHECK CONSTRAINT [FK__reserver__chambre]
GO
ALTER TABLE [dbo].[reserver]  WITH CHECK ADD  CONSTRAINT [FK_reserver_reservation] FOREIGN KEY([noresglobale])
REFERENCES [dbo].[reservation] ([noresglobale])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reserver] CHECK CONSTRAINT [FK_reserver_reservation]
GO
USE [master]
GO
ALTER DATABASE [bddProjetHotel] SET  READ_WRITE 
GO
