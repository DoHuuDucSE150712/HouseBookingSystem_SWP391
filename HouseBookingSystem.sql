USE [master]
GO
/****** Object:  Database [HouseBooking]    Script Date: 10/29/2022 2:51:06 AM ******/
CREATE DATABASE [HouseBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HouseBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HouseBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HouseBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HouseBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HouseBooking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HouseBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HouseBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HouseBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HouseBooking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HouseBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HouseBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HouseBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HouseBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HouseBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HouseBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HouseBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HouseBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HouseBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HouseBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HouseBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HouseBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HouseBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HouseBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HouseBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HouseBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HouseBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HouseBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HouseBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HouseBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HouseBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HouseBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HouseBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HouseBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HouseBooking] SET QUERY_STORE = OFF
GO
USE [HouseBooking]
GO
/****** Object:  Table [dbo].[Additional_service]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Additional_service](
	[add_service_id] [int] IDENTITY(0,1) NOT NULL,
	[add_serviceName] [nvarchar](max) NULL,
	[add_serviceDesc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[add_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(0,1) NOT NULL,
	[date] [date] NULL,
	[total] [float] NULL,
	[status] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_detail]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_detail](
	[billdetail_id] [int] IDENTITY(0,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[billdetail_id] ASC,
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cid] [int] IDENTITY(0,1) NOT NULL,
	[userid] [int] NULL,
	[houseid] [int] NULL,
	[comment] [nchar](1000) NULL,
	[date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[house_id] [int] IDENTITY(0,1) NOT NULL,
	[post_date] [date] NULL,
	[house_name] [nvarchar](max) NULL,
	[review] [nvarchar](max) NULL,
	[house_price] [float] NULL,
	[status] [int] NULL,
	[address] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[loca_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_additional_service]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_additional_service](
	[house_add_service_id] [int] IDENTITY(0,1) NOT NULL,
	[add_service_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	[add_service_status] [int] NULL,
	[add_service_price] [float] NULL,
 CONSTRAINT [PK_House_additional_service] PRIMARY KEY CLUSTERED 
(
	[house_add_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_img]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_img](
	[img_id] [int] IDENTITY(0,1) NOT NULL,
	[img_link] [nvarchar](MAX) NULL,
	[house_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[loca_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[loca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/29/2022 2:51:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(0,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[avatar] [nvarchar](MAX) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[status] [int] NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Additional_service] ON 

INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc]) VALUES (0, N'breakfast', N'Biff Steak')
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc]) VALUES (1, N'lunch', N'rice, meat, drink,...')
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc]) VALUES (2, N'Loa', N'Loa DBI')
SET IDENTITY_INSERT [dbo].[Additional_service] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [date], [total], [status], [user_id]) VALUES (0, CAST(N'2022-09-29' AS Date), 3000000, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [date], [total], [status], [user_id]) VALUES (1, CAST(N'2022-09-29' AS Date), 1500000, 1, 4)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill_detail] ON 

INSERT [dbo].[Bill_detail] ([billdetail_id], [bill_id], [house_id], [start_date], [end_date], [note]) VALUES (0, 0, 0, CAST(N'2022-09-30' AS Date), CAST(N'2022-10-30' AS Date), N'no')
INSERT [dbo].[Bill_detail] ([billdetail_id], [bill_id], [house_id], [start_date], [end_date], [note]) VALUES (1, 1, 0, CAST(N'2022-11-02' AS Date), CAST(N'2022-11-17' AS Date), N'14 day')
SET IDENTITY_INSERT [dbo].[Bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([cid], [userid], [houseid], [comment], [date]) VALUES (0, 1, 0, N'rat dc  nha                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[Comment] ([cid], [userid], [houseid], [comment], [date]) VALUES (1, 4, 0, N'abc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', CAST(N'2022-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (0, CAST(N'2022-09-29' AS Date), N'house1', N'ok', 2000000, 1, N'12/27, Lê Quang Định, Bình Thạnh, HCM', NULL, 2, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (1, CAST(N'2022-10-29' AS Date), N'vinhome', N'', 1000000, 1, N'district 9, Thu Duc city', N'gan truong', 0, 0)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (2, CAST(N'2022-10-28' AS Date), N'Sky9', N'', 500000, 1, N'Khu cong nghe cao', N'gan truong', 1, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (5, CAST(N'2022-10-28' AS Date), N'vinhome', N'', 40000, 1, N'district 9, Thu Duc city', N'rat dep', 1, 0)
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[House_additional_service] ON 

INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id], [add_service_status], [add_service_price]) VALUES (1, 1, 0, 0, 25000)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id], [add_service_status], [add_service_price]) VALUES (2, 0, 1, 1, 50000)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id], [add_service_status], [add_service_price]) VALUES (3, 1, 2, 0, 35000)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id], [add_service_status], [add_service_price]) VALUES (4, 0, 5, 0, 3000)
SET IDENTITY_INSERT [dbo].[House_additional_service] OFF
GO
SET IDENTITY_INSERT [dbo].[House_img] ON 

INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (0, NULL, 0)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (1, NULL, 1)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (2, NULL, 0)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (3, NULL, 2)
SET IDENTITY_INSERT [dbo].[House_img] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([loca_id], [name]) VALUES (0, N'Go Vap')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (1, N'Thu Duc')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (2, N'Binh Thanh ')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (3, N'Q12')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (4, N'Q9')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (5, N'Tan Binh')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (0, N'villa')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (1, N'home stay')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name]) VALUES (0, N'admin')
INSERT [dbo].[Role] ([role_id], [name]) VALUES (1, N'host')
INSERT [dbo].[Role] ([role_id], [name]) VALUES (2, N'customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (0, N'Dương Tuấn Kiệt', NULL, N'kietdtse151418', N'1', N'kietyasuo2016@gmail.com', N'0339526281', 1, 0)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (1, N'Minh Hy', NULL, N'hyminh', N'1', NULL, N'909099', 1, 2)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (2, N'Hữu Đức', NULL, N'duchuu', N'1', NULL, N'676767', 1, 2)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (3, N'Nam Nguyễn', NULL, N'namnguyen', N'1', NULL, N'575754', 1, 2)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (4, N'Trung', NULL, N'trung', N'1', NULL, N'04635353', 0, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Users]
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Bill_detail] CHECK CONSTRAINT [FK_Bill_Detail]
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Bill_detail] CHECK CONSTRAINT [FK_Bill_Detail_House]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_House] FOREIGN KEY([houseid])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_House]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_house_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([menu_id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_house_menu]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_Location] FOREIGN KEY([loca_id])
REFERENCES [dbo].[Location] ([loca_id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_Location]
GO
ALTER TABLE [dbo].[House_additional_service]  WITH CHECK ADD  CONSTRAINT [FK_House_additional_service_Additional_service1] FOREIGN KEY([add_service_id])
REFERENCES [dbo].[Additional_service] ([add_service_id])
GO
ALTER TABLE [dbo].[House_additional_service] CHECK CONSTRAINT [FK_House_additional_service_Additional_service1]
GO
ALTER TABLE [dbo].[House_additional_service]  WITH CHECK ADD  CONSTRAINT [FK_House_additional_service_House1] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[House_additional_service] CHECK CONSTRAINT [FK_House_additional_service_House1]
GO
ALTER TABLE [dbo].[House_img]  WITH CHECK ADD  CONSTRAINT [FK_House_Img] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[House_img] CHECK CONSTRAINT [FK_House_Img]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [HouseBooking] SET  READ_WRITE 
GO
