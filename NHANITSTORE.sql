USE [master]
GO
/****** Object:  Database [ITStore]    Script Date: 2/4/2025 9:04:37 PM ******/
CREATE DATABASE [ITStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ITStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ITStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ITStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ITStore] SET  MULTI_USER 
GO
ALTER DATABASE [ITStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITStore', N'ON'
GO
ALTER DATABASE [ITStore] SET QUERY_STORE = OFF
GO
USE [ITStore]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[MaBanner] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnh] [nvarchar](255) NOT NULL,
	[LienKet] [nvarchar](255) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaMoi] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaGioHang] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaMoi] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhapKho]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhapKho](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuNhap] [int] NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaNhap] [decimal](18, 2) NOT NULL,
	[TongTien]  AS ([SoLuong]*[GiaNhap]),
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[NgayDatHang] [datetime] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[MaVoucher] [int] NULL,
	[DiaChiGiaoHang] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[TrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TongTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanPham]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanPham](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](100) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapKho]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapKho](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Gia] [decimal](18, 0) NOT NULL,
	[GiaMoi] [decimal](18, 0) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[MaHang] [int] NULL,
	[MaDanhMuc] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[MaQuyen] [int] NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 2/4/2025 9:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[MaVoucher] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[GiamGia] [decimal](18, 0) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[SoLuongSuDung] [int] NOT NULL,
	[SoLuongSuDungToiDa] [int] NOT NULL,
	[TrangThai] [bit] NULL,
	[MoTa] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVoucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([MaBanner], [HinhAnh], [LienKet], [MoTa]) VALUES (1, N'banner_web_slider_800x400_7b486e59502946e49437262c3f61cef3.jpg', N'Index', N'update 2024')
INSERT [dbo].[Banner] ([MaBanner], [HinhAnh], [LienKet], [MoTa]) VALUES (3, N'head-gear_0f3bdf6468af4090bc79785c23bf1c0b.jpg', N'', N'update 2024')
INSERT [dbo].[Banner] ([MaBanner], [HinhAnh], [LienKet], [MoTa]) VALUES (4, N'gearvn-tet-slider.jpg', N'', N'tet')
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] ON 

INSERT [dbo].[ChiTietGioHang] ([MaChiTiet], [MaGioHang], [MaSanPham], [SoLuong], [Gia], [GiaMoi]) VALUES (1011, 2, 13, 1, CAST(20000000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhapKho] ON 

INSERT [dbo].[ChiTietPhieuNhapKho] ([MaChiTiet], [MaPhieuNhap], [MaSanPham], [SoLuong], [GiaNhap]) VALUES (10, 14, 1, 10, CAST(23000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietPhieuNhapKho] ([MaChiTiet], [MaPhieuNhap], [MaSanPham], [SoLuong], [GiaNhap]) VALUES (11, 14, 2, 5, CAST(23000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietPhieuNhapKho] ([MaChiTiet], [MaPhieuNhap], [MaSanPham], [SoLuong], [GiaNhap]) VALUES (12, 15, 1, 5, CAST(23000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietPhieuNhapKho] ([MaChiTiet], [MaPhieuNhap], [MaSanPham], [SoLuong], [GiaNhap]) VALUES (13, 15, 2, 4, CAST(23000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhapKho] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (1, N'Laptop', 1, CAST(N'2024-10-04T19:35:03.260' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (2, N'PC', 1, CAST(N'2024-10-04T19:35:08.977' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (4, N'RAM,HHD,SSD', 1, CAST(N'2024-10-14T20:57:35.970' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (5, N'MAIN,CPU,GPU', 1, CAST(N'2025-02-03T20:47:46.097' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (6, N'Case,Nguồn,Tản Nhiệt', 1, CAST(N'2025-02-03T20:49:21.910' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (7, N'Màn Hình', 1, CAST(N'2025-02-03T20:51:11.007' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (8, N'Bàn Phím', 1, CAST(N'2025-02-03T20:51:19.133' AS DateTime))
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc], [TrangThai], [NgayTao]) VALUES (9, N'Chuột', 1, CAST(N'2025-02-03T20:51:24.667' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGioHang], [MaTaiKhoan], [NgayTao], [TongTien]) VALUES (1, 3, CAST(N'2024-10-04T20:04:49.287' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[GioHang] ([MaGioHang], [MaTaiKhoan], [NgayTao], [TongTien]) VALUES (2, 4, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[GioHang] ([MaGioHang], [MaTaiKhoan], [NgayTao], [TongTien]) VALUES (3, 7, NULL, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HangSanPham] ON 

INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (1, N'ASUS', 1, CAST(N'2024-10-04T19:35:35.627' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (2, N'DELL', 1, CAST(N'2024-10-04T19:35:40.307' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (3, N'HP', 1, CAST(N'2024-10-04T19:35:42.320' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (4, N'Lenovo', 1, CAST(N'2024-10-12T12:11:48.837' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (5, N'PC NHÂN IT SHOP', 1, CAST(N'2025-02-03T21:03:28.363' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (6, N'MSI', 1, CAST(N'2025-02-03T22:00:10.267' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (7, N'GIGABYTE', 1, CAST(N'2025-02-03T22:03:29.490' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (8, N'Kingston', 1, CAST(N'2025-02-04T11:46:54.667' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (9, N'SAMSUNG', 1, CAST(N'2025-02-04T11:56:33.283' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (10, N' Thermaltake', 1, CAST(N'2025-02-04T12:00:19.507' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (11, N'JETEK', 1, CAST(N'2025-02-04T12:02:42.910' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (12, N' Cooler Master ', 1, CAST(N'2025-02-04T12:07:32.663' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (13, N'Corsair', 1, CAST(N'2025-02-04T12:10:39.503' AS DateTime))
INSERT [dbo].[HangSanPham] ([MaHang], [TenHang], [TrangThai], [NgayTao]) VALUES (14, N'Logitech', 1, CAST(N'2025-02-04T12:22:51.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[HangSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (11, 7, 2, N'cho hỏi sản phẩm a còn không', CAST(N'2024-10-06T18:29:31.727' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (12, 2, 7, N'còn nhé bạn', CAST(N'2024-10-06T18:29:46.227' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1011, 4, 2, N'alo', CAST(N'2024-10-08T21:15:22.970' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1012, 2, 4, N'sao ạ', CAST(N'2024-10-08T21:21:40.653' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1026, 4, 2, N'cho mình hỏi sản phẩm b còn không ạ', CAST(N'2024-10-08T22:10:44.303' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1027, 2, 4, N'để mình check trong kho xem sao nhé', CAST(N'2024-10-08T22:11:01.693' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1028, 4, 2, N'oke bạn', CAST(N'2024-10-09T10:31:15.667' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1029, 2, 4, N'vẫn còn nhé bạn', CAST(N'2024-10-09T10:31:29.227' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1030, 5, 2, N'cho mình hỏi sản phẩm laptop asus còn k', CAST(N'2024-10-14T20:56:03.103' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1031, 2, 5, N'để mình check hàng tồn nhé bạn', CAST(N'2024-10-14T20:56:20.480' AS DateTime))
INSERT [dbo].[Messages] ([Id], [SenderId], [ReceiverId], [Content], [Timestamp]) VALUES (1032, 2, 5, N'vẫn còn nhé bạn', CAST(N'2024-10-14T20:56:42.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhapKho] ON 

INSERT [dbo].[PhieuNhapKho] ([MaPhieuNhap], [NgayNhap], [TongTien], [GhiChu]) VALUES (14, CAST(N'2024-10-14T20:48:53.597' AS DateTime), CAST(345000000.00 AS Decimal(18, 2)), N'ok')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNhap], [NgayNhap], [TongTien], [GhiChu]) VALUES (15, CAST(N'2024-10-14T21:10:31.060' AS DateTime), CAST(207000000.00 AS Decimal(18, 2)), N'ok')
SET IDENTITY_INSERT [dbo].[PhieuNhapKho] OFF
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'Nhân viên')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (3, N'Khách hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (4, N'Chăm sóc khách hàng')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (1, N'Laptop ASUS Vivobook S 14 S5406SA PP059WS', N'<h2><strong>Th&ocirc;ng số kỹ thuật:&nbsp;</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly" target="_blank"><strong>CPU</strong></a></td>
			<td>Intel Core&trade; Ultra 7 258V up to 4.80Ghz, 8 Cores (4P+4PLE), 8 Threads, 12MB Intel&reg; Smart Cache</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ram-pc" target="_blank"><strong>RAM</strong></a></td>
			<td>32GB LPDDR5X Onboard (Kh&ocirc;ng n&acirc;ng cấp)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/hdd-o-cung-laptop" target="_blank"><strong>Ổ cứng</strong></a></td>
			<td>1TB SSD M.2 NVMe&trade; PCIe&reg; 4.0</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh" target="_blank"><strong>Card m&agrave;n h&igrave;nh</strong></a></td>
			<td>Intel&reg; Arc&trade; Graphics 140V</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/pages/man-hinh" target="_blank"><strong>M&agrave;n h&igrave;nh</strong></a></td>
			<td>14 inch 3K (2880 x 1800) Lumina OLED, tỷ lệ khung h&igrave;nh 16:10, 120Hz, 400 nits, 600 nits HDR, 100% DCI-P3, 1.000.000:1, 1.07 tỉ m&agrave;u,&nbsp;</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>2x USB 3.2 Gen 1 Type-A (data speed up to 5Gbps)<br />
			2x Thunderbolt&trade; 4 with support for display / power delivery (data speed up to 40Gbps)<br />
			1x HDMI 2.1 TMDS<br />
			1x Micro SD<br />
			1x 3.5mm Combo Audio Jack</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ban-phim-may-tinh" target="_blank"><strong>B&agrave;n ph&iacute;m</strong></a></td>
			<td>Chiclet RGB 1 v&ugrave;ng, Ph&iacute;m tắt Copilot</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam"><strong>Webcam</strong></a></td>
			<td>FHD, Camera IR hỗ trợ Windows Hello</td>
		</tr>
		<tr>
			<td><strong>Audio</strong></td>
			<td>C&ocirc;ng nghệ Amply Th&ocirc;ng minh<br />
			Loa t&iacute;ch hợp</td>
		</tr>
		<tr>
			<td><strong>Bảo mật</strong></td>
			<td>IR webcam c&oacute; hỗ trợ Windows Hello - Nhận diện khu&ocirc;n mặt<br />
			Trusted Platform Module (Firmware TPM)<br />
			Bộ xử l&yacute; bảo mật Microsoft Pluton<br />
			McAfee&reg;</td>
		</tr>
		<tr>
			<td><strong>Wifi + Bluetooth</strong></td>
			<td>Wi-Fi 7(802.11be) (Tri-band)2*2 + Bluetooth v5.4</td>
		</tr>
		<tr>
			<td><strong>Webcam</strong></td>
			<td>FHD c&oacute; chức năng IR để hỗ trợ Windows Hello</td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Window 11 Home, Microsoft Office Home &amp; Student 2024</td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>4-cell 75WHrs</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>1.3 kg</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Mist Blue (Xanh)</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>Kim loại (nh&ocirc;m)</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>31.05 x 22.19 x 1.39 ~ 1.59 cm</td>
		</tr>
	</tbody>
</table>
', CAST(34490000 AS Decimal(18, 0)), CAST(22000000 AS Decimal(18, 0)), N'pp059w_f967e9d44fc045e0abecc2cce05b2669_grande.jpg', 1, 1, CAST(N'2025-02-04T12:15:00.453' AS DateTime), 1, 20)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (2, N'Laptop Dell Inspiron T7430 N7430I58W1 Silver', N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly" target="_blank"><strong>CPU</strong></a></td>
			<td>Intel&reg; Core&trade; i5-1355U upto 4.60GHz, 10 cores 12 threads, 12Mb Cache</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/ram-laptop" target="_blank">RAM</a></strong></td>
			<td>8GB (1 x 8GB) LPDDR5 4800MHz&nbsp;</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/hdd-o-cung-laptop" target="_blank"><strong>Ổ cứng</strong></a></td>
			<td>512GB M.2 PCIe NVMe&nbsp;<a href="https://gearvn.com/collections/ssd-o-cung-the-ran" target="_blank">SSD</a></td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh" target="_blank"><strong>Card đồ họa</strong></a></td>
			<td>Intel Iris Xe Graphics</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/pages/man-hinh" target="_blank"><strong>M&agrave;n h&igrave;nh</strong></a></td>
			<td>14.0 inch FHD+(1920 x 1200) 60Hz, Touch, WVA, TrueLife&trade;, Narrow Border, Pen Support</td>
		</tr>
		<tr>
			<td><strong>Wireless</strong></td>
			<td>Intel&reg; Wi-Fi 6E</td>
		</tr>
		<tr>
			<td><strong>LAN</strong></td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Bluetooth</strong></td>
			<td>v5.2</td>
		</tr>
		<tr>
			<td><strong>Cổng giao tiếp</strong></td>
			<td>
			<ul>
				<li>2 x Thunderbolt 4.0</li>
				<li>1 x USB 3.2 Gen 1 Type-A</li>
				<li>1 x headset (headphone and microphone combo) port</li>
				<li>1 x HDMI 1.4 port</li>
				<li>1 x SD card slot</li>
				<li>1 x Universal Audio Jack</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam" target="_blank"><strong>Webcam</strong></a></td>
			<td>FHD Webcam</td>
		</tr>
		<tr>
			<td><strong>Audio</strong></td>
			<td>2 Loa</td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>4-Cell Battery, 54WHr</td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Windows 11 Home + Office Home&amp;Student</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>314 x 226.56 x 15.54mm - 18.55mm</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>1.58 kg</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Color Platinum Silver&nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(18990000 AS Decimal(18, 0)), NULL, N'n7430i58w1_97351009345a4702bf2d4edbf560bc3f_grande.jpg', 2, 1, CAST(N'2025-02-04T12:16:32.783' AS DateTime), 1, 19)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (3, N'Laptop HP Pavilion 15 EG0506TX 46M05PA', N'<h2><strong>TH&Ocirc;NG SỐ KĨ THUẬT :&nbsp;</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a></td>
			<td>Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">RAM</a></td>
			<td>8GB (4GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 16GB SDRAM)</td>
		</tr>
		<tr>
			<td>Ổ cứng</td>
			<td>512GB&nbsp;<a href="https://gearvn.com/collections/ssd-o-cung-the-ran">SSD</a>&nbsp;M.2 PCIE (1 slot)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh">Card đồ họa</a></td>
			<td>NVIDIA GeForce MX450 2GB GDDR5 + Intel Iris Xe Graphics</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/pages/man-hinh">M&agrave;n h&igrave;nh</a></td>
			<td>15.6&quot; FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC</td>
		</tr>
		<tr>
			<td>Cổng kết nối</td>
			<td>1x SuperSpeed USB Type-C&reg; 10Gbps signaling rate (USB Power Delivery, DisplayPort&trade; 1.4, HP Sleep and Charge)<br />
			2x SuperSpeed USB Type-A 5Gbps signaling rate<br />
			1x HDMI 2.0<br />
			1x AC smart pin<br />
			1x headphone/microphone combo</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ban-phim-may-tinh">B&agrave;n ph&iacute;m</a></td>
			<td>Kh&ocirc;ng LED</td>
		</tr>
		<tr>
			<td>Audio</td>
			<td>B&amp;O, Dual Speakers, HP Audio Boost</td>
		</tr>
		<tr>
			<td>Đọc thẻ nhớ</td>
			<td>multi-format SD media card reader</td>
		</tr>
		<tr>
			<td>Chuẩn LAN</td>
			<td>None</td>
		</tr>
		<tr>
			<td>Chuẩn WiFi</td>
			<td>Realtek RTL8822CE 802.11a/b/g/n/ac (2x2)</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v5.0</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam">Webcam</a></td>
			<td>HP Wide Vision HD Camera</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows 11</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>3 Cell 41WHr</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>1.75 kg</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>Natural silver (Bạc)</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>36.02 x 23.4 x 1.79 cm</td>
		</tr>
	</tbody>
</table>
', CAST(19590000 AS Decimal(18, 0)), CAST(30000000 AS Decimal(18, 0)), N'aptop-hp-pavilion-15-eg0506tx-46m05pa_3f2e2cb97f6b4ed192752aa774e1b9b4_7514240edc9a4ee98c2f88b18c0fc039_grande.jpg', 3, 1, CAST(N'2025-02-04T12:18:14.100' AS DateTime), 1, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (4, N'Laptop ASUS ROG Strix G15', N'<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a></strong></td>
			<td>Intel&reg; Core&trade; Ultra 9 processor 185H with Intel&reg; AI Boost (NPU)&nbsp;16 cores (6 P-cores + 8 E-cores + 2 Low Power E-cores), Max Turbo Frequency 5.1 GHz</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/ram-pc">RAM</a></strong></td>
			<td>64GB (2x32GB) DDR5 5600MHz (2x SO-DIMM socket, up to 96GB SDRAM)</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/o-cung-di-dong-hdd-box" target="_blank">Ổ lưu trữ</a></strong></td>
			<td>1TB NVMe PCIe Gen4x4 SSD (2 x M.2 SSD slots)</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/vga-card-man-hinh">Card đồ họa</a></strong></td>
			<td>NVIDIA&reg; GeForce RTX&trade; 4080 Laptop GPU powers advanced AI with 542 AI TOPS<br />
			Up to 1665MHz Boost Clock 105W Maximum Graphics Power with Dynamic Boost.</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/pages/man-hinh" target="_blank">M&agrave;n h&igrave;nh</a></strong></td>
			<td>16&quot; QHD+(2560x1600), 240Hz Refresh Rate, IPS-Level, 100% DCI-P3(Typical)&nbsp;&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td><br />
			<br />
			<strong>Cổng giao tiếp</strong></td>
			<td>1x Type-A USB3.2 Gen2<br />
			1x Type-C (USB3.2 Gen2 / DisplayPort&trade;)<br />
			1x Thunderbolt&trade; 4 (DisplayPort&trade;/ Power Delivery 3.0)<br />
			1x HDMI&trade; 2.1 (8K @ 60Hz / 4K @ 120Hz)&nbsp;&nbsp; &nbsp;<br />
			1x Micro SD&nbsp;&nbsp; &nbsp;<br />
			1x Mic-in/Headphone-out Combo Jack&nbsp;&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/ban-phim-may-tinh">B&agrave;n ph&iacute;m</a></strong></td>
			<td>Per-Key RGB Gaming Keyboard by SteelSeries with Copilot Key&nbsp;&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td><strong>Audio</strong></td>
			<td>2x 2W Audio Speaker<br />
			4x 2W Audio Woofer<br />
			Sound by Dynaudio, Nahimic 3 Audio Enhancer, Hi-Res Audio Ready</td>
		</tr>
		<tr>
			<td><strong>LAN</strong></td>
			<td>Intel&reg; Killer&trade; Ethernet E3100 2.5 Gbps&nbsp;&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td><strong>Wifi + Bluetooth</strong></td>
			<td>Intel&reg; Killer&trade; Wi-Fi 7 BE1750, Bluetooth v5.4&nbsp;&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<td><strong>Bảo mật</strong></td>
			<td>Fingerprint Security, Firmware Trusted Platform Module(fTPM) 2.0, Webcam Shutter, Kensington Lock</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/webcam">Webcam</a></strong></td>
			<td>IR FHD type (30fps@1080p) with HDR<br />
			3D Noise Reduction+ (3DNR+)</td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>4-Cell 99.9 Battery (Whr)</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>1.99 kg</td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Windows 11 Home</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Star Blue</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>Magnesium Aluminum</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>355.8 x 259.7 x 19.95 mm&nbsp;&nbsp; &nbsp;</td>
		</tr>
	</tbody>
</table>
', CAST(73990000 AS Decimal(18, 0)), NULL, N'ava_9f543d3a40a040739ce1929c13bf6813_grande.jpg', 6, 1, CAST(N'2025-02-04T12:20:01.780' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (5, N'Card màn hình MSI GeForce RTX 5080 16G VENTUS 3X OC PLUS', N'<p>Card m&agrave;n h&igrave;nh MSI GeForce RTX 5080 16G VENTUS 3X OC PLUS</p>
', CAST(39990000 AS Decimal(18, 0)), NULL, N'1024_3231afda2bba4a6d94c13b9770364872_grande.jpg', 6, 5, CAST(N'2025-02-04T11:44:09.197' AS DateTime), 1, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (6, N'Card màn hình GIGABYTE AORUS GeForce RTX 5080 XTREME WATERFORCE 16G (GV-N5080AORUSX W-16GD)', N'<p>Card m&agrave;n h&igrave;nh GIGABYTE AORUS GeForce RTX 5080 XTREME WATERFORCE 16G (GV-N5080AORUSX W-16GD)</p>
', CAST(46990000 AS Decimal(18, 0)), CAST(34000000 AS Decimal(18, 0)), N'2000__30__20bf60b294e044fb9b11df322340da71_grande.jpg', 7, 5, CAST(N'2025-02-04T11:44:27.320' AS DateTime), 1, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (7, N'Card màn hình ASUS PRIME GeForce RTX 4070 SUPER 12GB GDDR6X (PRIME-RTX4070S-12G)', N'<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Nh&acirc;n đồ họa&nbsp;</strong></td>
			<td>NVIDIA&reg; GeForce RTX&trade; 4070 SUPER</td>
		</tr>
		<tr>
			<td><strong>Hiệu năng AI</strong></td>
			<td>568 AI TOPS</td>
		</tr>
		<tr>
			<td><strong>Bus ti&ecirc;u chuẩn</strong></td>
			<td>PCI Express 4.0</td>
		</tr>
		<tr>
			<td><strong>OpenGL</strong></td>
			<td>OpenGL&reg;4.6</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ Video</strong></td>
			<td>12GB GDDR6X</td>
		</tr>
		<tr>
			<td><strong>Xung nhịp</strong></td>
			<td>Chế độ OC: 2505 MHz (Boost Clock)<br />
			Chế độ mặc định: 2475 MHz&nbsp;(Boost Clock)</td>
		</tr>
		<tr>
			<td><strong>Nh&acirc;n CUDA</strong></td>
			<td>7168</td>
		</tr>
		<tr>
			<td><strong>Tốc độ bộ nhớ</strong></td>
			<td>21 Gbps</td>
		</tr>
		<tr>
			<td><strong>Giao thức bộ nhớ</strong></td>
			<td>192-bit</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải</strong></td>
			<td>Độ ph&acirc;n giải tối đa 7680 x 4320</td>
		</tr>
		<tr>
			<td><strong>Giao thức</strong></td>
			<td>
			<p>C&oacute; x 1&nbsp;(Native HDMI 2.1)</p>

			<p>C&oacute; x 3 (Native DisplayPort 1.4a)</p>

			<p>Hỗ trợ HDCP&nbsp;(2.3)</p>
			</td>
		</tr>
		<tr>
			<td><strong>Số lượng m&agrave;n h&igrave;nh tối đa hỗ trợ</strong></td>
			<td>4</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ NVlink/ Crossfire&nbsp;</strong></td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td><br />
			<strong>Phụ kiện</strong></td>
			<td>1 x Hướng dẫn c&agrave;i đặt tốc độ<br />
			1 x Thẻ cảm ơn<br />
			1 x C&aacute;p chuyển đổi (1 đến 2)</td>
		</tr>
		<tr>
			<td><strong>Phần mềm</strong></td>
			<td>ASUS GPU Tweak III &amp; GeForce Game Ready Driver &amp; Studio Driver: vui l&ograve;ng tải xuống tất cả phần mềm từ trang web hỗ trợ.</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>269 x 120 x 50 mm<br />
			10.59 x 4.72 x 1.97 inch</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/psu-nguon-may-tinh">PSU</a>&nbsp;kiến nghị</strong></td>
			<td>750W</td>
		</tr>
		<tr>
			<td><strong>Kết nối nguồn</strong></td>
			<td>1 x 16 pin</td>
		</tr>
		<tr>
			<td><strong>Khe cắm</strong></td>
			<td>2.5</td>
		</tr>
		<tr>
			<td><strong>SFF Ready</strong></td>
			<td>Tương th&iacute;ch</td>
		</tr>
	</tbody>
</table>
', CAST(20790000 AS Decimal(18, 0)), NULL, N'prime-rtx4070s-12g-01_21759d36d2a842ed888b42703e81fc1d_grande.jpg', 1, 5, CAST(N'2025-02-03T22:07:41.213' AS DateTime), 1, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (8, N'Ổ cứng SSD Kingston NV3 2TB M.2 PCIe NVMe Gen4', N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Thương hiệu</strong></td>
			<td>Kingston</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>36&nbsp;th&aacute;ng</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>M.2 2280</td>
		</tr>
		<tr>
			<td><strong>Giao diện</strong></td>
			<td>
			<table>
				<tbody>
					<tr>
						<td>PCIe 4.0 x4 NVMe</td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td><strong>NAND</strong></td>
			<td>3D</td>
		</tr>
		<tr>
			<td><strong>Mức dung lượng</strong></td>
			<td>500GB</td>
		</tr>
		<tr>
			<td><strong>Đọc/ghi tuần tự</strong></td>
			<td>6.000/5.000 MB/gi&acirc;y</td>
		</tr>
		<tr>
			<td><strong>Đ&ocirc;̣ b&ecirc;̀n</strong></td>
			<td>640TB</td>
		</tr>
		<tr>
			<td><strong>Nhiệt độ bảo quản</strong></td>
			<td>-40&deg;C~85&deg;C</td>
		</tr>
		<tr>
			<td><strong>Nhiệt độ vận h&agrave;nh</strong></td>
			<td>0&deg;C~70&deg;C</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước chuẩn&nbsp;</strong></td>
			<td>22 mm x 80 mm x 2,1 mm</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>7 g (Tất cả c&aacute;c mức dung lượng)</td>
		</tr>
		<tr>
			<td><strong>Độ rung khi hoạt động</strong></td>
			<td>10 G (10-1000 Hz)</td>
		</tr>
		<tr>
			<td><strong>Tuổi thọ trung b&igrave;nh</strong></td>
			<td>2.000.000 giờ)</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh/hỗ trợ</strong></td>
			<td>Bảo h&agrave;nh 3 năm c&oacute; giới hạn với hỗ trợ kỹ thuật miễn ph&iacute;</td>
		</tr>
	</tbody>
</table>
', CAST(3990000 AS Decimal(18, 0)), NULL, N'snv3s_2000gb_pkg-lg_a603785fc04542c5be21481462584107_grande.jpg', 8, 4, CAST(N'2025-02-04T11:53:23.203' AS DateTime), 1, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (9, N'Ổ Cứng SSD Samsung 990 PRO 4TB M.2 PCIe Gen4 NVMe (MZ-V9P4T0BW)', N'<h2><strong>Th&ocirc;ng số kỹ thuật</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Nh&agrave; sản xuất</strong></td>
			<td>Samsung</td>
		</tr>
		<tr>
			<td><strong>Model</strong></td>
			<td>MZ-V9P4T0BW</td>
		</tr>
		<tr>
			<td><strong>Chuẩn giao tiếp</strong></td>
			<td>PCIe Gen4.0 x4, NVMe1.3c</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>M.2 2280</td>
		</tr>
		<tr>
			<td><strong>Dung lượng</strong></td>
			<td>4 TB</td>
		</tr>
		<tr>
			<td><strong>Tốc độ đọc ngẫu nhi&ecirc;n</strong></td>
			<td>1,600,000 IOPS</td>
		</tr>
		<tr>
			<td><strong>Tốc độ ghi ngẫu nhi&ecirc;n</strong></td>
			<td>1,550,000 IOPS</td>
		</tr>
		<tr>
			<td><strong>Tốc độ đọc</strong></td>
			<td>7450 MB/s</td>
		</tr>
		<tr>
			<td><strong>Tốc độ ghi</strong></td>
			<td>6900 MB/s</td>
		</tr>
		<tr>
			<td><strong>NAND Flash</strong></td>
			<td>Samsung V-NAND TLC</td>
		</tr>
		<tr>
			<td><strong>TBW</strong></td>
			<td>2400 TB</td>
		</tr>
	</tbody>
</table>
', CAST(10990000 AS Decimal(18, 0)), NULL, N'vn-990pro-nvme-m2-ssd-mz-v9p4t0b.jpg', 9, 4, CAST(N'2025-02-04T11:56:56.130' AS DateTime), 1, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (10, N'Ổ Cứng SSD GIGABYTE AORUS Gen4 5000E SSD 500GB (AG450E500G-G)', N'<h2><strong>Th&ocirc;ng số kỹ thuật :</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Giao thức kết nối</strong></td>
			<td>PCI-Express 4.0x4, NVMe 1.4</td>
		</tr>
		<tr>
			<td><strong>Dung lượng</strong></td>
			<td>500GB</td>
		</tr>
		<tr>
			<td><strong>NAND</strong></td>
			<td>3D TLC NAND Flash</td>
		</tr>
		<tr>
			<td><strong>Tốc độ đọc tuần tự</strong></td>
			<td>L&ecirc;n đến 5,000 MB/gi&acirc;y</td>
		</tr>
		<tr>
			<td><strong>Tốc độ ghi tuần tự</strong></td>
			<td>L&ecirc;n đến 3,800 MB/gi&acirc;y</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>80 x 22 x 2.3 mm</td>
		</tr>
		<tr>
			<td><strong>Tuổi thọ trung b&igrave;nh</strong></td>
			<td>1,5 triệu giờ</td>
		</tr>
		<tr>
			<td><strong>Điện năng ti&ecirc;u thụ (Hoạt động)</strong></td>
			<td>
			<ul>
				<li>Đọc:&nbsp;4W</li>
				<li>Ghi:&nbsp;4W</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td><strong>Điện năng ti&ecirc;u thụ (Kh&ocirc;ng đoạt động)</strong></td>
			<td>20mW</td>
		</tr>
		<tr>
			<td><strong>Nhiệt độ (Vận h&agrave;nh)</strong></td>
			<td>0&deg;C đến 70&deg;C</td>
		</tr>
		<tr>
			<td><strong>Nhiệt độ (Lưu trữ)</strong></td>
			<td>-40&deg;C đến 85&deg;C</td>
		</tr>
	</tbody>
</table>
', CAST(1690000 AS Decimal(18, 0)), CAST(33000000 AS Decimal(18, 0)), N'aorus_gen4_5000e_ssd_500gb-01_6ef637a2a06e4d0cb8cd545c868aaf50_grande.jpg', 7, 4, CAST(N'2025-02-04T11:58:53.280' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (11, N'Vỏ máy tính Thermaltake H570 TG ARGB', N'<h2><strong><strong>Th&ocirc;ng số kỹ thuật:</strong></strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>P/N</strong></td>
			<td>CA-1T9-00M1WN-01</td>
		</tr>
		<tr>
			<td><strong>Model</strong></td>
			<td>H570 TG ARGB Black</td>
		</tr>
		<tr>
			<td><strong>Loại case</strong></td>
			<td>Mid Tower</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước&nbsp;(H X W X D)</strong></td>
			<td>487 x 216 x 463.6 mm (19.2 x 8.5 x 18.3 inch)</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>7.5 kg / 16.5 lbs.</td>
		</tr>
		<tr>
			<td><strong>Mặt b&ecirc;n</strong></td>
			<td>K&iacute;nh cường lực 4mm x 1</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Đen</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>SPCC</td>
		</tr>
		<tr>
			<td><strong>Hệ thống tản nhiệt</strong></td>
			<td>Mặt trước: 3 quạt ARGB 120mm (sẵn trong case)</td>
		</tr>
		<tr>
			<td><strong>Khay ổ cứng</strong></td>
			<td>
			<table>
				<tbody>
					<tr>
						<td>2 x 3.5&rdquo;<br />
						2 x 2.5&rdquo;<br />
						4 x 2.5&rdquo;</td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td><strong>Khe mở rộng</strong></td>
			<td>7</td>
		</tr>
		<tr>
			<td><strong>Bo mạch chủ hổ trợ</strong></td>
			<td>6.7&rdquo; x 6.7&rdquo; (Mini ITX)<br />
			9.6&rdquo; x 9.6&rdquo; (Micro ATX)<br />
			12&rdquo; x 9.6&rdquo; (ATX)<br />
			12&rdquo; x 13&rdquo;(E-ATX)</td>
		</tr>
		<tr>
			<td><strong>Cổng&nbsp;I/O</strong></td>
			<td>
			<table>
				<tbody>
					<tr>
						<td>USB 3.0 x 2<br />
						HD Audio x 1</td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td><strong>Nguồn hổ trợ</strong></td>
			<td>Standard PS2 PSU<br />
			Độ d&agrave;i tối đa: 180mm</td>
		</tr>
		<tr>
			<td><strong>Quạt hổ trợ</strong></td>
			<td><strong>Trước:</strong>
			<ul>
				<li>3 x 120mm, 2 x 120mm, 1 x 120mm&nbsp;</li>
				<li>3 x 140mm, 2 x 140mm, 1 x 140mm&nbsp;</li>
				<li>2 x 200mm, 1 x 200mm</li>
			</ul>

			<p><strong>Tr&ecirc;n:&nbsp;</strong></p>

			<p>&nbsp;</p>

			<ul>
				<li>3 x 120mm, 2 x 120mm, 1 x 120mm</li>
				<li>2 x 140mm, 1 x 140mm&nbsp;</li>
			</ul>

			<p><strong>Sau:</strong>&nbsp;1 x 120mm</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td><strong>Rad tản nhiệt hổ trợ</strong></td>
			<td><strong>Trước:</strong>
			<ul>
				<li>1 x 360mm, 1 x 240mm, 1 x 120mm&nbsp;</li>
				<li>1 x 280mm, 1 x 140mm</li>
			</ul>

			<p><strong>Tr&ecirc;n:&nbsp;</strong></p>

			<ul>
				<li>1 x 360mm, 1 x 240mm, 1 x 120mm</li>
				<li>1 x 280mm, 1 x 140mm&nbsp;</li>
			</ul>

			<p><strong>Sau:</strong>&nbsp;1 x 120mm</p>
			</td>
		</tr>
		<tr>
			<td><strong>Chiều cao tản nhiệt CPU</strong></td>
			<td>160mm</td>
		</tr>
		<tr>
			<td><strong>Độ d&agrave;i VGA tối đa</strong></td>
			<td>375mm</td>
		</tr>
	</tbody>
</table>
', CAST(1850000 AS Decimal(18, 0)), NULL, N'ca-1t9-00m1wn-01_1_f13074b6a8f945408be4318872e52f0a_grande.jpg', 10, 6, CAST(N'2025-02-04T12:02:13.347' AS DateTime), 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (12, N'Vỏ máy tính Jetek CSGO2 Wukong Black', N'<h2><strong>Th&ocirc;ng số kỹ thuật</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>H&atilde;ng sản xuất</strong></p>
			</td>
			<td>
			<p>Jetek</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>T&ecirc;n sản phẩm</strong></p>
			</td>
			<td>
			<p>CSGO2 WUKONG</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bảo h&agrave;nh</strong></p>
			</td>
			<td>
			<p>12 Th&aacute;ng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;u sắc</strong></p>
			</td>
			<td>
			<p>Đen</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chất liệu</strong></p>
			</td>
			<td>
			<ul>
				<li>Phần cứng SPCC 0,45 mm</li>
				<li>Mặt trước: K&iacute;nh cường lực cong&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</li>
				<li>Mặt tr&aacute;i: K&iacute;nh cường lực to&agrave;n phần</li>
				<li>Mặt phải: Tấm kim loại</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hỗ trợ mainboard</strong></p>
			</td>
			<td>
			<p>Micro ATX, Mini-ITX</p>
			</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước case</strong></td>
			<td>339*345*375mm(L*W*H)</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hỗ trợ số lượng ổ cứng</strong></p>
			</td>
			<td>
			<p>1&nbsp;x ổ&nbsp;cứng SSD 2.5&quot;, 2 x ổ cứng HDD 3.5&quot;&nbsp;</p>

			<p>hoặc 2&nbsp;x ổ&nbsp;cứng SSD 2.5&quot;, 1 x ổ cứng HDD 3.5</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><br />
			<strong>Cổng kết nối I/O mặt trước</strong></p>
			</td>
			<td>
			<ul>
				<li>
				<p>1&nbsp;x USB 3.0</p>
				</li>
				<li>
				<p>2&nbsp;x USB 2.0</p>
				</li>
				<li>
				<p>1 x HDD Audio</p>
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Vị tr&iacute; lắp nguồn</strong></p>
			</td>
			<td>
			<p>Sau</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><br />
			<strong>Hỗ trợ&nbsp;<a href="https://gearvn.com/collections/fan-rgb-tan-nhiet-pc" target="_blank">quạt tản nhiệt</a></strong></p>
			</td>
			<td>
			<ul>
				<li>
				<p>Mặt h&ocirc;ng:&nbsp;2 x 120mm</p>
				</li>
				<li>
				<p>Mặt tr&ecirc;n: 2 x 120mm</p>
				</li>
				<li>
				<p>Mặt dưới: 2 x 120mm</p>
				</li>
				<li>
				<p>Mặt sau: 1 x 120mm</p>
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td><strong>GPU hổ trợ</strong></td>
			<td>320mm</td>
		</tr>
		<tr>
			<td><strong>Tản nhiệt&nbsp;<a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly" target="_blank">CPU</a>&nbsp;hổ trợ</strong></td>
			<td>160mm</td>
		</tr>
	</tbody>
</table>
', CAST(790000 AS Decimal(18, 0)), NULL, N'1_copy_476ed181911344aa834d1679edc39186_compact.jpg', 11, 6, CAST(N'2025-02-04T12:04:34.103' AS DateTime), 1, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (13, N'Nguồn máy tính MSI MAG A500N-H - Active PFC (500W)', N'<h2><strong>Th&ocirc;ng số sản phẩm :</strong></h2>

<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>C&ocirc;ng suất tối đa</strong></td>
			<td>500W</td>
		</tr>
		<tr>
			<td><strong>Hiệu điện thế đầu v&agrave;o</strong></td>
			<td>200-240V</td>
		</tr>
		<tr>
			<td><strong>Modular</strong></td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td><strong>Quạt</strong></td>
			<td>120 mm</td>
		</tr>
		<tr>
			<td><strong>Fan bearing</strong></td>
			<td>V&ograve;ng bi</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước chuẩn</strong></td>
			<td>140mm x 150mm x 86mm / 5.51 x 5.9 x 3.38 inches</td>
		</tr>
		<tr>
			<td><strong>Loại PFC</strong></td>
			<td>PFC tự động</td>
		</tr>
		<tr>
			<td><strong>Tần số đầu v&agrave;o</strong></td>
			<td>50~60Hz</td>
		</tr>
		<tr>
			<td><strong>Chứng nhận bảo vệ</strong></td>
			<td>OCP, OPP, SCP, UVP</td>
		</tr>
	</tbody>
</table>
', CAST(790000 AS Decimal(18, 0)), NULL, N'1024__1__15aa607ec0044a8994a0015f97465a45_compact.jpg', 6, 6, CAST(N'2025-02-04T12:07:10.373' AS DateTime), 1, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (14, N'Nguồn máy tính Cooler Master MWE 750 - 80 Plus Bronze - V3 230V (750W)', N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Thương hiệu:</strong></p>
			</td>
			<td>
			<p>CoolerMaster</p>
			</td>
		</tr>
		<tr>
			<td><strong>Phi&ecirc;n bản ATX</strong></td>
			<td>ATX 12V Ver. 3.1</td>
		</tr>
		<tr>
			<td>
			<p><strong>PFC</strong></p>
			</td>
			<td>
			<p>K&iacute;ch hoạt PFC</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Điện &aacute;p đầu v&agrave;o</strong></p>
			</td>
			<td>
			<p>200-240V</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Dong điện đầu v&agrave;o</strong></p>
			</td>
			<td>
			<p>6A</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Tần số đầu v&agrave;o</strong></p>
			</td>
			<td>
			<p>50-60Hz</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>K&iacute;ch thước</strong></p>
			</td>
			<td>
			<p>140 x 150 x 86 mm / 5.5 x 5.9 x 3.4 inch</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>K&iacute;ch thước quạt</strong></p>
			</td>
			<td>
			<p>120mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>V&ograve;ng bi quạt</strong></p>
			</td>
			<td>
			<p>HDB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chuẩn</strong></p>
			</td>
			<td>
			<p>&gt;88% tải trọng th&ocirc;ng thường</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chuẩn 80 PLUS</strong></p>
			</td>
			<td>
			<p>80 PLUS BRONZE EU 230V</p>
			</td>
		</tr>
		<tr>
			<td><strong>ErP 2014 Lot 3</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Nhiệt độ hoạt động</strong></td>
			<td>0-40&deg;C</td>
		</tr>
		<tr>
			<td><strong>T&iacute;n hiệu tốt</strong></td>
			<td>100-150ms</td>
		</tr>
		<tr>
			<td><strong>Thời gian chờ</strong></td>
			<td>&gt;16ms</td>
		</tr>
		<tr>
			<td><strong>MTBF</strong></td>
			<td>&gt;100,000 giờ</td>
		</tr>
		<tr>
			<td><strong>Bảo vệ</strong></td>
			<td>UVP / OVP / OPP / OTP / SCP</td>
		</tr>
		<tr>
			<td><strong>Quy định</strong></td>
			<td>TUV, CE, FCC, CCC, EAC, RCM, UKCA, RoHS2.0 / BIS, KC (dựa tr&ecirc;n y&ecirc;u cầu của từng khu vực.)</td>
		</tr>
		<tr>
			<td><strong>Đầu kết nối ATX 24pin</strong></td>
			<td>1</td>
		</tr>
		<tr>
			<td><strong>EPS 8pin / 4 + 4pin kết nối</strong></td>
			<td>2</td>
		</tr>
		<tr>
			<td><strong>Kết nối SATA</strong></td>
			<td>6</td>
		</tr>
		<tr>
			<td><strong>Đầu nối 4pin ngoại vi</strong></td>
			<td>3</td>
		</tr>
		<tr>
			<td><strong>Đầu kết nối PCI-e 6+2pin</strong></td>
			<td>4</td>
		</tr>
	</tbody>
</table>
', CAST(1690000 AS Decimal(18, 0)), NULL, N'smart__1__14f9dfb8a0f94884826522f2ecd0b52b_grande.jpg', 12, 6, CAST(N'2025-02-04T12:09:19.347' AS DateTime), 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (15, N'Tản nhiệt AIO Corsair iCUE LINK TITAN 240 RX RGB BLACK (CW-9061016-WW)', N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td><strong>Chất liệu tấm lạnh</strong></td>
			<td>Đồng</td>
		</tr>
		<tr>
			<td><strong>Chất liệu rad</strong></td>
			<td>Nh&ocirc;m</td>
		</tr>
		<tr>
			<td><strong>Bao gồm quạt</strong></td>
			<td>x2 quạt iCUE LINK RX120 RGB</td>
		</tr>
		<tr>
			<td><strong>V&ograve;ng bi quạt</strong></td>
			<td>Magnetic Dome</td>
		</tr>
		<tr>
			<td><strong>Tốc độ quạt tối đa</strong></td>
			<td>300&ndash;2,100 RPM &plusmn;10%</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước quạt</strong></td>
			<td>120mm x 120mm x 25mm</td>
		</tr>
		<tr>
			<td><strong>Luồng kh&iacute; của quạt (mỗi quạt)</strong></td>
			<td>10.4&ndash;73.5 CFM</td>
		</tr>
		<tr>
			<td><strong>&Aacute;p suất tĩnh của quạt (mỗi quạt)</strong></td>
			<td>0.12&ndash;4.33 mm-H2O</td>
		</tr>
		<tr>
			<td><strong>Độ ồn của quạt (mỗi quạt)</strong></td>
			<td>10&ndash;36 dB(A)</td>
		</tr>
		<tr>
			<td><strong>Chiều d&agrave;i ống</strong></td>
			<td>400mm</td>
		</tr>
		<tr>
			<td><strong>Loại ống</strong></td>
			<td>Cao su c&oacute; độ thẩm thấu thấp</td>
		</tr>
		<tr>
			<td><strong>&Aacute;nh s&aacute;ng</strong></td>
			<td>RGB v&agrave; iCUE</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ socket</strong></td>
			<td>AMD: AM5, AM4<br />
			Intel: 1851, 1700</td>
		</tr>
	</tbody>
</table>
', CAST(3990000 AS Decimal(18, 0)), NULL, N'titan_240_rx_rgb_black_render_01_f324a771e18e4c9990ea1ae33c706d39_grande.jpg', 13, 6, CAST(N'2025-02-04T12:11:51.423' AS DateTime), 1, 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (16, N'PC GVN Intel i3-12100F/ VGA GT 1030', N'<h2><strong>Chi tiết về PC GVN Intel i3-12100F/ VGA GT 1030</strong></h2>

<h3><strong>Mainboard GIGABYTE H610M-H V2 (DDR4)</strong></h3>

<p>Mainboard&nbsp;<strong>GIGABYTE H610M-H V2 (DDR4)&nbsp;</strong>sẽ l&agrave; cầu nối tất cả linh kiện trong chiếc PC GVN Intel i3-12100F/ VGA GT 1030. L&agrave; chiếc bo mạch chủ gi&aacute; rẻ sở hữu socket LGA 1700 cho khả năng tương th&iacute;ch tốt với nhiều bộ vi xử l&yacute; hiện nay như Intel Gen 12,13&nbsp;v&agrave; tận dụng tối đa sức mạnh cho hiệu năng xử l&yacute; tốt nhất.</p>

<p><img src="https://product.hstatic.net/200000722513/product/z4526661575560_e34899162c954af2dfdd194c36a71831_fa7c64e8dfcf4f7a913d9379e009792a_grande.jpg" /></p>

<h3><strong>CPU Intel Core i3 12100F / 3.3GHz Turbo 4.3GHz / 4 Nh&acirc;n 8 Luồng / 12MB / LGA 1700</strong></h3>

<p>Đ&oacute;ng vai tr&ograve; l&agrave; bộ n&atilde;o cho PC GVN Intel i3-12100F/ VGA GT 1030,&nbsp;<a href="https://gearvn.com/collections/cpu-intel-core-i3">CPU&nbsp;</a><strong><a href="https://gearvn.com/collections/cpu-intel-core-i3">Intel Core i3</a>&nbsp;12100F</strong>&nbsp;l&agrave; lựa chọn xứng đ&aacute;ng nhất của&nbsp;<a href="https://gearvn.com/pages/pc-gvn">PC Gaming</a>. Với mức gi&aacute; phải chăng, i3-12100F vẫn mang lại khả năng xử l&yacute; nhanh với mức xung nhịp tối đa l&ecirc;n 4.3GHz c&ugrave;ng c&ocirc;ng nghệ si&ecirc;u ph&acirc;n luồng (Hyper-Threading). V&agrave; tự tin rằng, i3-12100F sẽ c&acirc;n tốt những tựa game Esport hiện nay như Li&ecirc;n Minh Huyền Thoại, FO4, Valorant, &hellip;</p>

<p><img src="https://product.hstatic.net/200000722513/product/12100f_d81914f75c254dba985d80033b522662_c3458e8ae6a24c8881b4ae103f0b6a6d_grande.png" /></p>

<h3><strong>Ram TeamGroup T-Force Vulcan Z Red 8GB 3200 DDR4</strong></h3>

<p><img src="https://product.hstatic.net/1000026716/product/36da3fafb9ee8be3a0b44806f67c819f_8be028d4fa714b0090b6b5fd86c2a39f_grande.jpg" /></p>

<p><strong>VGA MSI GeForce GT 1030 AERO ITX 2GD4 OC</strong></p>

<p>Đ&aacute;p ứng nhu cầu gaming nhẹ nh&agrave;ng đến trung b&igrave;nh, PC GVN Intel i3-12100F/ VGA GT 1030 trang bị chiếc card m&agrave;n h&igrave;nh đến từ MSI với t&ecirc;n&nbsp;<strong>MSI GeForce GT 1030 AERO ITX 2GD4 OC</strong>. Thiết kế nhỏ gọn với 1 quạt tản nhiệt cho khả năng dễ d&agrave;ng lắp đặt tr&ecirc;n mọi k&iacute;ch thước case m&aacute;y t&iacute;nh c&ugrave;ng độ bền tối ưu. Hiệu năng đến từ GPU GeForce GT 1030 sẽ cho bạn khả năng tận hưởng những tựa game online Esport như LOL, FO4, Valorant,... mượt m&agrave; nhất ở mức đồ họa trung b&igrave;nh, đ&aacute;p ứng nhu cầu chơi game cho c&aacute;c game thủ kh&ocirc;ng c&oacute; hầu bao qu&aacute; lớn.</p>

<p><img src="https://product.hstatic.net/1000026716/product/gt1030-aero-2gb-oc-msi_9e353c3df0f849f29676d12a5cd8477d.jpg" /></p>

<h3><strong>SSD PNY CS900 240G 2.5&quot; Sata 3</strong></h3>

<p><a href="https://gearvn.com/collections/pc-van-phong">M&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;PC GVN Intel i3-12100F/ VGA GT 1030&nbsp;sở hữu kh&ocirc;ng gian lưu trữ 240GB đến từ PNY CS900 240G 2.5&quot; Sata 3. Tốc độ đọc/ghi file ấn tượng lần lượt l&agrave; 535MB/s v&agrave; 500MB/s sẽ l&agrave; những th&ocirc;ng số cần thiết cho việc sao lưu, lưu trữ dữ liệu như video, h&igrave;nh ảnh v&agrave; game. Với bộ nhớ SSD, tối ưu tốc độ khởi động cho d&agrave;n PC chơi game của ch&uacute;ng ta.</p>

<p><img src="https://product.hstatic.net/1000026716/product/ssd_pny_cs900_gearvn3_grande.jpg" /></p>

<h3><strong>Nguồn m&aacute;y t&iacute;nh Jetek J400</strong></h3>

<p><strong>Nguồn m&aacute;y t&iacute;nh Jetek J400</strong>&nbsp;sẽ l&agrave; PSU cung cấp nguồn điện cho PC GVN Intel i3-12100F/ VGA GT 1030. Được ho&agrave;n thiện với thiết kế nhỏ gọn dễ d&agrave;ng cho việc lắp đặt, quạt 120mm cho khả năng tản nhiệt v&agrave; c&ocirc;ng suất 400W mạnh mẽ cung cấp năng lượng cho to&agrave;n bộ linh kiện b&ecirc;n trong d&agrave;n m&aacute;y. Đạt chuẩn sức mạnh để&nbsp;thể hiện khả năng sử dụng năng lượng hiệu quả của bộ nguồn đến từ Jetek.</p>

<p><img alt=" Nguồn máy tính Jetek J400 (400W) " src="https://product.hstatic.net/200000722513/product/3455_abf653d5dea3e3c357057cf334f76333_1793945aeb614299a6f8b92833a221cf_8d5a416765a742efbd6dc8717fb1c2ec_master.jpg" /></p>

<h3><strong>Case Xigmatek QUANTUM 3F</strong></h3>

<p>Tuy l&agrave; case kh&aacute; nhỏ gọn nhưng được hỗ trợ&nbsp;khả năng l&agrave;m m&aacute;t cực kỳ ấn tượng với ba quạt LED đi c&ugrave;ng. C&ugrave;ng với đ&oacute; case được trang bị&nbsp;một tấm k&iacute;nh cường lực mặt b&ecirc;n để tăng th&ecirc;m t&iacute;nh thẩm mỹ của vỏ case.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/quantum_3f_1_12a0184fbb24442894504c44e046bdac_grande.jpg" /></p>

<p>Ba quạt 120mm được c&agrave;i đặt sẵn trong Case Xigmatek QUANTUM 3F&nbsp;với 3&nbsp;quạt ở ph&iacute;a trước. Quạt được thắp s&aacute;ng nhờ tổ hợp đ&egrave;n LED ph&iacute;a trước case, bạn chỉ cần cắm điện v&agrave; tận hưởng trải nghiệm. C&aacute;c tấm lưới ph&iacute;a trước v&agrave; ph&iacute;a tr&ecirc;n cung cấp hệ thống th&ocirc;ng gi&oacute; tối ưu để di chuyển một lượng lớn kh&ocirc;ng kh&iacute; trong suốt vỏ m&aacute;y.</p>
', CAST(8390000 AS Decimal(18, 0)), NULL, N'gvn07935__1__b0b39d0512b4419f8c2a729bcb170881_grande.jpg', 1, 2, CAST(N'2025-02-03T21:25:58.257' AS DateTime), 1, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (17, N'PC GVN Intel i3-12100F/ VGA RX 6600', N'<h3><strong>ASUS PRIME H610M-CS D4</strong></h3>

<p>ASUS PRIME H610M-CS D4 hỗ trợ&nbsp;đầu ra đồ họa HDMI cho những sản phẩm&nbsp;<a href="https://gearvn.com/pages/man-hinh" target="_blank">m&agrave;n h&igrave;nh</a>&nbsp;l&ecirc;n đến&nbsp;4K 60Hz mới nhất.&nbsp;Với băng th&ocirc;ng lớn hơn v&agrave; tốc độ khung h&igrave;nh tăng l&ecirc;n, chuyển động tr&ecirc;n m&agrave;n h&igrave;nh của bạn trở n&ecirc;n tr&ocirc;i chảy hơn v&agrave; &iacute;t mờ hơn.&nbsp;</p>

<p>&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/bo-mach-chu-asus-prime-h610m-cs-d4-1_c4ae241125424d4699362cd2a66a2563_eff37e1d831348ee8ab6bc6c35f60773_grande.png" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Một trong những d&ograve;ng&nbsp;bo mạch chủ d&agrave;nh cho những d&ograve;ng&nbsp;<a href="https://gearvn.com/pages/pc-gvn" target="_blank">PC</a>&nbsp;tầm trung cho đến cao cấp&nbsp;sử dụng chipset H610 của Intel thuộc ph&acirc;n kh&uacute;c cơ bản của ASUS. Bo mạch chủ n&agrave;y sử dụng socket LGA 1700 c&oacute; thể chạy được CPU Intel Core thế hệ 12, 13 hỗ trợ PCI-E Gen 4.0 mới nhất.</p>

<h3><strong>Intel Core i3 12100F / 3.3GHz Turbo 4.3GHz / 4 Nh&acirc;n 8 Luồng / 12MB / LGA 1700</strong></h3>

<p>Đ&oacute;ng vai tr&ograve; l&agrave; bộ n&atilde;o cho PC GVN Intel i3-12100F/ VGA RX 6600, CPU&nbsp;<strong>Intel Core i3 12100F</strong>&nbsp;l&agrave; lựa chọn xứng đ&aacute;ng nhất của&nbsp;<a href="https://gearvn.com/pages/pc-gvn">PC Gaming</a>. Với mức gi&aacute; phải chăng, i3-12100F vẫn mang lại khả năng xử l&yacute; nhanh với mức xung nhịp tối đa l&ecirc;n 4.3GHz c&ugrave;ng c&ocirc;ng nghệ si&ecirc;u ph&acirc;n luồng (Hyper-Threading). V&agrave; tự tin rằng, i3-12100F sẽ c&acirc;n tốt những tựa game Esport hiện nay như Li&ecirc;n Minh Huyền Thoại, FO4, Valorant, &hellip;</p>

<p><img src="https://product.hstatic.net/200000722513/product/12100f_d81914f75c254dba985d80033b522662_c3458e8ae6a24c8881b4ae103f0b6a6d_grande.png" /></p>

<h3><strong>Ram PNY XLR8 Silver 1x8GB 3200 RGB</strong></h3>

<p>&nbsp;</p>

<p><img src="https://product.hstatic.net/1000026716/product/en_color_list_22d26_r9gc83djaz_3c686ea66ef2444a937c1fd51d008395__1__ae48a53002da4865b402c951dd663848_grande.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>ASUS Dual Radeon RX 6600 V2 8GB GDDR6 (DUAL-RX6600-8G-V2)</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/ard-man-hinh-asus-dual-radeon-rx-6600-v2-8gb-gddr6-dual-rx6600-8g-v2-1_9b8f2efba776482c90caf06126d4773f_grande.png" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>L&agrave; một trong những d&ograve;ng card m&agrave;n h&igrave;nh gi&aacute; rẻ tốt nhất khi&nbsp;<a href="https://gearvn.com/pages/pc-gvn">build PC</a>, ASUS Dual Radeon RX 6600 V2 8GB GDDR6&nbsp;phi&ecirc;n bản &eacute;p xung mang đến tốc độ l&agrave;m mới cao.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>SSD Verbatim Vi550 256GB Sata3</strong></h3>

<p><a href="https://gearvn.com/collections/pc-van-phong">M&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;PC GVN Intel i3-12100F/ VGA RX 6600&nbsp;sở hữu kh&ocirc;ng gian lưu trữ 240GB đến từ Verbatim Vi550 256GB Sata3. Tốc độ đọc/ghi file ấn tượng lần lượt l&agrave; 535MB/s v&agrave; 500MB/s sẽ l&agrave; những th&ocirc;ng số cần thiết cho việc sao lưu, lưu trữ dữ liệu như video, h&igrave;nh ảnh v&agrave; game. Với bộ nhớ SSD, tối ưu tốc độ khởi động cho d&agrave;n PC chơi game của ch&uacute;ng ta.</p>

<p><img src="https://product.hstatic.net/200000722513/product/gearvn-o-cung-ssd-verbatim-vi550-256gb-sata3-1_7ef1024514df4f3484b56186726535d2_grande.png" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>Nguồn m&aacute;y t&iacute;nh FSP HV PRO 550W - 80 Plus Bronze</strong></p>

<p>&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/guon-fsp-hv-pro-550w-80-plus-bronze-2_4a28137ea83544bb811ca84ca20d3b63_f1521f14f2954cb28e11a3db171d0bec_grande.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Được thiết kế cho mức hiệu quả 80 PLUS để giảm nhiệt l&atilde;ng ph&iacute; v&agrave; tiết kiệm điện.&nbsp;Quạt t&iacute;ch hợp 120mm c&oacute; luồng kh&ocirc;ng kh&iacute; tuyệt vời v&agrave; độ ồn thấp, ho&agrave;n hảo cho việc sử dụng tại nh&agrave; hoặc văn ph&ograve;ng y&ecirc;n tĩnh.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/guon-fsp-hv-pro-550w-80-plus-bronze-6_711732dad5c04d4faf81f3d89cf67e5a_af78e65d24db45fda2ec95f3f663465b_grande.jpg" /></p>

<p>&nbsp;</p>

<p>Thiết kế đường ray đơn + 12V mạnh mẽ, ho&agrave;n hảo để n&acirc;ng cấp hoặc &eacute;p xung linh kiện cao cấp trong tương lai.&nbsp;Độ s&acirc;u 140mm đặt ti&ecirc;u chuẩn mới cho PSU c&ocirc;ng suất cao.</p>

<h3><strong>Tản nhiệt DEEPCOOL AG400 ARGB</strong></h3>

<p>&nbsp;</p>

<p>Tản nhiệt DEEPCOOL AG400 ARGB l&agrave; thiết kế mới trong d&ograve;ng sản phẩm AG400 ARGB&nbsp;của thương hiệu DEEPCOOL. Được cải tiến&nbsp;gi&uacute;p cho việc tản nhiệt tốt hơn mang đến&nbsp;lượng gi&oacute; lưu th&ocirc;ng đảm bảo hiệu suất hoạt động tối ưu cho người d&ugrave;ng.</p>

<p><img src="https://product.hstatic.net/200000722513/product/01_a39d788b15f5476fa499fc95a3e76e9a_5e9d8e8518f34044b63104368b1aa4f1_grande.jpg" /></p>

<p>&nbsp;</p>

<p>Nếu bạn th&iacute;ch g&oacute;c m&aacute;y chơi game, l&agrave;m việc mang đậm m&agrave;u sắc RGB độc đ&aacute;o, ấn tượng th&igrave; bộ m&aacute;y PC GVN Intel i3-12100F/ VGA RX 6600 sẽ l&agrave; một trong những sự lựa chọn kh&ocirc;ng n&ecirc;n bỏ qua khi kết hợp c&ugrave;ng c&aacute;c thiết bị ngoại vi như b&agrave;n ph&iacute;m cơ,&nbsp;<a href="https://gearvn.com/collections/chuot-may-tinh" target="_blank">chuột m&aacute;y t&iacute;nh</a>&nbsp;đa kết nối từ&nbsp;<a href="https://gearvn.com/collections/chuot-wireless" target="_blank">chuột kh&ocirc;ng d&acirc;y</a>&nbsp;đến c&oacute; d&acirc;y, tai nghe,&nbsp;<a href="https://gearvn.com/collections/mouse-pad" target="_blank">miếng l&oacute;t chuột</a>&nbsp;led RGB,...</p>

<h3><strong>Case Xigmatek QUANTUM 3F (3 fan RGB)</strong></h3>

<p>Tuy l&agrave; case kh&aacute; nhỏ gọn nhưng được hỗ trợ&nbsp;khả năng l&agrave;m m&aacute;t cực kỳ ấn tượng với ba quạt LED đi c&ugrave;ng. C&ugrave;ng với đ&oacute; case được trang bị&nbsp;một tấm k&iacute;nh cường lực mặt b&ecirc;n để tăng th&ecirc;m t&iacute;nh thẩm mỹ của vỏ case.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/quantum_3f_1_12a0184fbb24442894504c44e046bdac_grande.jpg" /></p>

<p>Ba quạt 120mm được c&agrave;i đặt sẵn trong Xigmatek QUANTUM 3F (3 fan RGB), quạt được thắp s&aacute;ng nhờ tổ hợp đ&egrave;n LED ph&iacute;a trước case, bạn chỉ cần cắm điện v&agrave; tận hưởng trải nghiệm. C&aacute;c tấm lưới ph&iacute;a trước v&agrave; ph&iacute;a tr&ecirc;n cung cấp hệ thống th&ocirc;ng gi&oacute; tối ưu để di chuyển một lượng lớn kh&ocirc;ng kh&iacute; trong suốt vỏ m&aacute;y.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', CAST(12490000 AS Decimal(18, 0)), NULL, N'gvn07935__1__b0b39d0512b4419f8c2a729bcb170881_grande.jpg', 5, 2, CAST(N'2025-02-03T21:20:25.967' AS DateTime), 1, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (18, N'PC GVN Intel i5-12400F/ VGA RTX 4060', N'<h2><strong>Chi tiết về PC GVN Intel i5-12400F/ VGA RTX 4060</strong></h2>

<h3><strong>CPU Intel Core i5-12400F</strong></h3>

<p>CPU&nbsp;<strong>Intel Core i5-12400F</strong>, nh&acirc;n tố khuất đảo thị trường&nbsp;<a href="https://gearvn.com/pages/pc-gvn">PC Gaming</a>&nbsp;khi sở hữu mức gi&aacute; rẻ c&ugrave;ng hiệu năng xuất sắc. Với 6 nh&acirc;n 12 luồng, xung nhịp 2.5GHz v&agrave; turbo boost l&ecirc;n 4.4 GHz, quả l&agrave; sự lựa chọn tuyệt vời từ khả năng chơi game cho tới stream game của thế hệ vi xử l&yacute; Intel Gen 12, ch&iacute;nh l&agrave; sự n&acirc;ng cấp vượt bậc so với người tiền nhiệm i5-11400F.</p>

<p><img src="https://product.hstatic.net/1000026716/product/box_t4_i5f_12th_m35582_ang01_right_v01_1280x1280_0d8d3bea75e8441f855b246eba0b7b8a_grande.png" /></p>

<h3><strong>Mainboard&nbsp;ASUS PRIME B760M-A WIFI D4 CSM</strong></h3>

<p><strong>ASUS PRIME B760M-A WIFI D4 CSM</strong>&nbsp;l&agrave; một trong những d&ograve;ng mainboard được chắt lọc c&aacute;c yếu tố thiết yếu của nền tảng Intel mới nhất v&agrave; kết hợp ch&uacute;ng để tạo th&agrave;nh một sản phẩm ho&agrave;n hảo trong ph&acirc;n kh&uacute;c tầm trung. Được ho&agrave;n thiện với những th&agrave;nh phần tốt nhất, chiếc bo mạch chủ cung cấp đầy đủ những kết nối cơ bản. C&ugrave;ng với đ&oacute; l&agrave; những c&ocirc;ng nghệ ti&ecirc;n tiến từ tản nhiệt đến khả năng khai th&aacute;c hiệu năng. Sở hữu chipset B760, ASUS PRIME B760M-A WIFI D4 CSM sẽ mang đến cho bạn những khả năng tương th&iacute;ch đến tuyệt vời tr&ecirc;n những&nbsp;<a href="https://gearvn.com/pages/linh-kien-may-tinh">linh kiện m&aacute;y t&iacute;nh</a>&nbsp;ti&ecirc;n tiến.</p>

<p><img src="https://product.hstatic.net/200000722513/product/w800__1__ec2c156923e2400abeb67dccc0c5e44e_grande.png" /></p>

<p>V&agrave; cốt l&otilde;i b&ecirc;n trong của chiếc mainboard chế tạo từ bọc th&eacute;p sẽ l&agrave;m giảm thiểu hiện tượng g&atilde;y hay cong khe PCI-E khi bạn chọn lắp những VGA lớn, gi&uacute;p chịu tải trọng tốt hơn cho mainboard. Qua đ&oacute; gi&uacute;p tăng cường độ bền của sản phẩm v&agrave; cung cấp khả năng n&acirc;ng cấp trong tương lai cho người d&ugrave;ng.</p>

<h3><strong>VGA&nbsp;ASUS Dual GeForce RTX 4060 V2 OC Edition 8GB GDDR6</strong></h3>

<p><strong>ASUS Dual GeForce RTX 4060 V2 OC Edition 8GB GDDR6</strong>&nbsp;c&oacute; được vẻ ngo&agrave;i gaming trước đ&oacute;. Kho&aacute;c l&ecirc;n m&agrave;u đen mạnh mẽ c&ugrave;ng c&aacute;c g&oacute;c cạnh được ho&agrave;n thiện một c&aacute;ch bắt mắt, c&aacute;i t&ecirc;n từ ASUS sẽ l&agrave;m nổi bật chiếc case n&oacute;i ri&ecirc;ng v&agrave; g&oacute;c gaming n&oacute;i chung.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/fwebp_f763561886254dc9838eb6d71feaecf3_grande.png" /></p>

<p>GPU&nbsp;<a href="https://gearvn.com/collections/vga-rtx-4060/">RTX 4060</a>&nbsp;b&ecirc;n trong ASUS Dual GeForce RTX 4060 V2 OC Edition 8GB GDDR6&nbsp;sẽ khẳng định sức mạnh xử l&yacute; đồ họa với GPU được tạo bởi kiến tr&uacute;c Ada mới nhất&nbsp;c&ugrave;ng những c&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh ti&ecirc;n tiến. Kết hợp c&ugrave;ng những đồng bộ h&oacute;a tuyệt vời, ASUS Dual GeForce RTX 4060 V2 OC Edition 8GB GDDR6&nbsp;sẽ đủ sức &ldquo;c&acirc;n&rdquo; những chiếc&nbsp;<a href="https://gearvn.com/collections/man-hinh-tu-5-den-10-trieu">m&agrave;n h&igrave;nh gaming</a>&nbsp;với tần số qu&eacute;t l&ecirc;n đến 144Hz.</p>

<h3><strong>RAM Kingston Fury Beast 8GB 3600 DDR4 RGB SE</strong></h3>

<p>RAM&nbsp;<strong>Kingston Fury Beast 8GB 3600 DDR4 RGB SE</strong>&nbsp;kho&aacute;c l&ecirc;n m&igrave;nh gi&aacute;p tản nhiệt nổi bật với m&agrave;u bạc sang trọng c&ugrave;ng dải đ&egrave;n&nbsp;<a href="https://gearvn.com/collections/fan-led-trang-tri">LED RGB</a>&nbsp;đầy đủ m&agrave;u sắc rực rỡ chiếu s&aacute;ng kết hợp với hiệu ứng rainbow khi&nbsp;<a href="https://gearvn.com/pages/pc-gvn">build PC</a>. C&aacute;c v&ugrave;ng đ&egrave;n s&aacute;ng tr&ecirc;n RAM c&oacute; thể ph&aacute;t s&aacute;ng với g&oacute;c si&ecirc;u rộng l&ecirc;n đến 120 độ tạo n&ecirc;n trải nghiệm thị gi&aacute;c tuyệt vời, t&ocirc; điểm th&ecirc;m cho bữa tiệc &aacute;nh s&aacute;ng cho PC GVN Intel i5-12400F/ VGA RTX 4060.</p>

<p><img src="https://product.hstatic.net/200000722513/product/b353c53f9e743c3b93ad80e4848ef7a_large_dfc7e5e44dcd4c2c86e14c49b94fa99f_6977fe5a6dbc4fd9a4c1c47d77318c12_grande.png" /></p>

<p>Được trang bị bảng mạch JEDEC RC 2.0, Kingston Fury Beast 8GB 3600 DDR4 RGB SE đem lại tốc độ đọc, truyền tải nhanh hơn với những bảng mạch th&ocirc;ng thường tr&ecirc;n những chiếc&nbsp;<a href="https://gearvn.com/collections/ddr4-8gb">RAM DDR4</a>&nbsp;kh&aacute;c. Nhờ v&agrave;o điều n&agrave;y, việc &eacute;p xung tr&ecirc;n Kingston Fury Beast 8GB 3600 DDR4 RGB SE sẽ ổn định hơn v&agrave; y&ecirc;n t&acirc;m hơn.</p>

<h3><strong>SSD WD Black SN770 500G M.2 NVMe PCIe Gen4</strong></h3>

<p>Nhằm tối ưu khả năng lưu v&agrave; l&agrave;m việc tr&ecirc;n&nbsp;<a href="https://gearvn.com/collections/pc-van-phong">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;PC GVN Intel i5-12400F/ VGA RTX 4060, GEARVN đ&atilde; trang bị th&ecirc;m cho bộ PC n&agrave;y bộ nhớ&nbsp;<a href="https://gearvn.com/collections/ssd-m-2-pcie-gen-3x4">SSD M.2</a>&nbsp;tốc độ cao với dung lượng&nbsp;500G M.2 NVMe PCIe Gen4&nbsp;mang đến tốc độ khởi động m&aacute;y v&agrave; ứng dụng chỉ trong v&agrave;i gi&acirc;y cho trải nghiệm th&uacute; vị hơn rất nhiều.&nbsp;Trang bị tốc độ đọc/ghi l&ecirc;n đến 3300/1200 MB/s, WD mang lại khả năng truyền tải dữ liệu nhanh ch&oacute;ng gi&uacute;p đẩy nhanh hiệu quả c&ocirc;ng việc. C&ugrave;ng với đ&oacute;, SSD WD gi&uacute;p cho hệ thống khởi động Windows nhanh với chuẩn SSD ti&ecirc;n tiến n&agrave;y.</p>

<p><img src="https://product.hstatic.net/200000722513/product/2388_cd4d84551922555986ca587b4522f8f1_40f78090bec246f1a90f2f0da44aa691_11929657a68f4f7a8a503c49e7f3df69_grande.jpg" /></p>

<p>&nbsp;</p>

<p><strong>Nguồn FSP HV PRO 550W - 80 Plus Bronze (550W)</strong></p>

<p>Chứng nhận 80 Plus Bronze đảm bảo hiệu suất hoạt động tốt hơn, &iacute;t l&atilde;ng ph&iacute; điện năng, tối ưu nhiệt v&agrave; tiếng ồn của quạt, l&agrave; tất cả những g&igrave;&nbsp;<strong>FSP HV PRO 550W - 80 Plus Bronze (550W)</strong>&nbsp;sẽ mang lại cho bạn. Đ&oacute;ng vai tr&ograve; l&agrave; nguồn năng lượng cho PC GVN Intel i5-12400F/ VGA RTX 4060, Nguồn FSP HV PRO 550W - 80 Plus Bronze (550W) cung cấp giải ph&aacute;p tốt nhất cho việc x&acirc;y dựng hệ thống PC. C&aacute;p bện lưới l&agrave;m giảm sự lộn xộn v&agrave; cải thiện luồng kh&ocirc;ng kh&iacute; trong case. Tất cả c&aacute;c tụ điện l&agrave; tụ điện chất lượng cao, để tạo ra hiệu suất hiệu quả v&agrave; đảm bảo độ tin cậy l&acirc;u hơn. Đường Single rail + 12V cung cấp năng lượng tốt nhất, ổn định v&agrave; tương th&iacute;ch cho phần cứng.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/nguon_fsp_hv_pro_550w_-_10_e6bde4a463d241788c2580e22b496368_55fc9eed7ea141498c1947e136e85640_grande.jpg" /></p>

<p>Quạt v&ograve;ng bi thủy lực 120mm tối ưu h&oacute;a việc giảm tiếng ồn v&agrave; hiệu suất nhiệt. Tốc độ quạt được điều chỉnh tự động theo hoạt động của nguồn. Quạt thủy lực b&ecirc;n trong cung cấp cho&nbsp;Nguồn FSP HV PRO 550W - 80 Plus Bronze (550W) tuổi thọ d&agrave;i v&agrave; ổn định hơn.</p>

<h3><strong>Case Xigmatek QUANTUM ARCTIC 3F</strong></h3>

<p>Case&nbsp;Xigmatek QUANTUM ARCTIC 3F l&agrave; chiếc case được lựa chọn d&agrave;nh cho GVN Intel i5-12400F/ VGA RTX 4060. Sở hữu k&iacute;ch thước đủ lớn d&agrave;nh cho 6 chiếc fan hay&nbsp;<a href="https://gearvn.com/collections/tan-nhiet-nuoc-240mm">tản nhiệt AIO</a>&nbsp;l&ecirc;n đến 360mm, Case Xigmatek QUANTUM ARCTIC 3F cho bạn thoải m&aacute;i trang bị hệ thống tản nhiệt d&agrave;nh cho d&agrave;n PC của m&igrave;nh.&nbsp;</p>

<p>Kh&ocirc;ng dừng lại ở đ&oacute;, để tăng th&ecirc;m khả năng tiện dụng h&atilde;ng c&ograve;n t&iacute;ch hợp cổng kết nối tr&ecirc;n n&oacute;c case thuận tiện cho c&aacute;c nhu cầu kết nối với&nbsp;<a href="https://gearvn.com/pages/chuot-may-tinh" target="_blank">chuột m&aacute;y t&iacute;nh</a>,&nbsp;<a href="https://gearvn.com/collections/ban-phim-may-tinh" target="_blank">b&agrave;n ph&iacute;m</a>&nbsp;v&agrave; v&ocirc; số phụ kiện kh&aacute;c hỗ trợ tối đa cho nhu cầu chơi game giải tr&iacute; v&agrave; l&agrave;m việc.</p>

<p><img src="https://product.hstatic.net/200000722513/product/quantum_arctic_3f_1_7f59b3180767454a870575edab124b99_grande.jpg" /></p>

<p>&nbsp;</p>
', CAST(18190000 AS Decimal(18, 0)), NULL, N'pc_gvn_viper_i3060_gen_13_-_3_a7538c02de68412d8a7a4c8626c1b51b_grande.JPG', 5, 2, CAST(N'2025-02-03T21:30:28.923' AS DateTime), 1, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (19, N'PC GVN Intel i7-14700F/ VGA RTX 3060', N'<h3><strong>Đ&aacute;nh gi&aacute; chi tiết&nbsp;PC GVN Intel i7-14700F/ VGA RTX 3060</strong></h3>

<h3><strong>Bo mạch chủ&nbsp;ASUS Z790 AYW WIFI W DDR5</strong></h3>

<p>ASUS Z790 AYW WIFI W DDR5&nbsp;l&agrave; một trong những d&ograve;ng&nbsp;mainboard&nbsp;được&nbsp;chắt lọc c&aacute;c yếu tố thiết yếu của nền tảng Intel&nbsp;mới nhất v&agrave; kết hợp ch&uacute;ng để tạo th&agrave;nh một sản phẩm ho&agrave;n hảo trong ph&acirc;n kh&uacute;c tầm trung.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/w800__3__cba5e8e45ba4474f892b2a127761b0d2_grande.png" /></p>

<p>Được thiết kế với c&aacute;c th&agrave;nh phần tốt nhất, chiếc bo mạch chủ cung cấp đầy đủ những kết nối cơ bản gi&uacute;p cuộc sống của bạn dễ d&agrave;ng hơn.&nbsp;Việc được bọc th&eacute;p sẽ l&agrave;m giảm thiểu hiện tượng gẫy hay vặn xoắn khe PCI-E khi bạn chọn lắp những VGA lớn. Qua đ&oacute; gi&uacute;p tăng độ bền của sản phẩm v&agrave; khả năng sang nhượng trong tương lai l&agrave; s&aacute;ng sủa hơn tr&ocirc;ng thấy khi&nbsp;<a href="https://gearvn.com/pages/pc-gvn">build PC</a>.</p>

<p>&nbsp;</p>

<h3><strong>Intel Core i7 14700F / Turbo up to 5.4GHz / 20 Nh&acirc;n 28 Luồng / 33MB / LGA 1700</strong></h3>

<p>CPU Intel Core i7-14700F&nbsp;được sản xuất dựa tr&ecirc;n tiến tr&igrave;nh 14nm đem lại cho bộ vi xử l&yacute; sức mạnh ấn tượng. Với 20 nh&acirc;n 28&nbsp;luồng đi k&egrave;m với tần số cơ bản l&agrave; 2.10 GHz v&agrave; turbo boost l&ecirc;n đến 5.4&nbsp;GHz,&nbsp;i7-14700F&nbsp;đem lại tốc độ xử l&yacute; t&aacute;c vụ v&ocirc; c&ugrave;ng nhanh v&agrave; khả năng hoạt động đa nhiệm mượt m&agrave; khi học tập, l&agrave;m việc v&agrave; giải tr&iacute;.</p>

<p><img src="https://product.hstatic.net/200000722513/product/n22459-001-rpl-i7f-fhs-dva-bc-univ_png_21fc4faaaca646ae9804e8bcc729ae57_grande.png" /></p>

<h3><strong>Ram Kingston Fury Beast RGB 16GB (2x8GB) bus 5600 DDR5</strong></h3>

<p>Với thanh &aacute;nh s&aacute;ng ho&agrave;n to&agrave;n tiếp x&uacute;c với đ&egrave;n LED RGB rực rỡ, được kết hợp với thiết kế tản nhiệt Ram Kingston Fury Beast RGB 16GB (2x8GB) bus 5600 DDR5 từng đoạt giải thưởng v&agrave; được chế tạo với c&aacute;c th&agrave;nh phần chất lượng cao nhất, bộ nhớ Ram Kingston Fury Beast RGB 16GB (2x8GB) bus 5600 DDR5 kết hợp &aacute;nh s&aacute;ng RGB sống động nhất với hiệu suất vượt trội. Ram Kingston Fury Beast RGB 16GB (2x8GB) bus 5600 DDR5 được trang bị dải led RGB 16 triệu m&agrave;u, hỗ trợ t&ugrave;y chỉnh dễ d&agrave;ng bằng phần mềm.</p>

<p><img src="https://product.hstatic.net/200000722513/product/kt_49b1ddec1a7b444a9d2430e29064129a_f7d8664e0aa344188d76e40d712fa43b_grande.jpg" /></p>

<p>&nbsp;</p>

<h3><strong>Card m&agrave;n h&igrave;nh MSI GeForce RTX 3060 Ventus 2X OC 12G</strong></h3>

<p>&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/1024_8cf8d2e8bf3b46eb9a15cb1d790b0130_grande.png" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Để xử l&yacute; h&igrave;nh ảnh trong m&aacute;y t&iacute;nh như m&agrave;u sắc, thiết lập độ ph&acirc;n giải, độ tương phản, chất lượng h&igrave;nh ảnh hiển thị tr&ecirc;n m&agrave;n h&igrave;nh. PC GVN Intel i7-14700F/ VGA RTX 3060&nbsp;được trang bị d&ograve;ng VGA ấn tượng về hiệu năng v&agrave; cả thiết kết từ MSI.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/1024_8cf8d2e8bf3b46eb9a15cb1d790b0130_grande.png" /></p>

<p>MSI GeForce RTX 3060 Ventus 2X OC 12G sở hữu 2 quạt tản nhiệt c&ocirc;ng suất cao, được hỗ trợ bằng một tấm lưới kim loại gi&uacute;p dẫn truyền nhiệt v&agrave; hỗ trợ quạt khiến card lu&ocirc;n ở mức nhiệt l&yacute; tưởng.</p>

<p>Sở hữu cho m&igrave;nh 3584 nh&acirc;n CUDA, 1.78 xung nhịp tăng tốc c&ugrave;ng bộ nhớ 12GB GDDR6 gi&uacute;p card sở hữu hiệu năng thật sự mạnh mẽ. Từ đ&oacute; bạn c&oacute; thể dễ d&agrave;ng trải nghiệm c&aacute;c tựa game AAA ở mức đồ họa cao cho chiếc&nbsp;<a href="https://gearvn.com/collections/pc-van-phong">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;của bạn.</p>

<p>&nbsp;</p>

<h3><strong>SSD WD Blue SN570 500G M.2 NVMe PCIe Gen3</strong></h3>

<p>SSD WD Blue SN570 500G M.2 NVMe PCIe Gen3 l&agrave; chiếc M.2&nbsp;SSD&nbsp;cao cấp của thương hiệu&nbsp;Kingston. Sử dụng kết nối&nbsp;PCIe 3.0 x 4 c&oacute; băng th&ocirc;ng l&ecirc;n tới 32Gb/s. Gi&uacute;p&nbsp;SSD WD Blue SN570 500G M.2 NVMe PCIe Gen3 c&oacute; tốc độ hoạt động kh&aacute; tốt, đạt tối đa 3300/s đối với tốc độ đọc v&agrave; 1200MB/s ở tốc độ ghi. Chắc chắn chiếc ổ cứng SSD&nbsp;n&agrave;y sẽ l&agrave;m h&agrave;i l&ograve;ng rất nhiều người sử dụng.</p>

<p><img src="https://product.hstatic.net/1000026716/product/wd_blue_sn570_500g_ww_front_lr__1__20ec0c2bae4a4bf4a65bc08a59eb6f8d_grande.jpg" /></p>

<p>&nbsp;</p>

<h3><strong>Nguồn Corsair CV750 - 80 Plus Bronze</strong></h3>

<p>Nguồn<strong>&nbsp;</strong><strong>Corsair CV750 - 80 Plus Bronze</strong><strong>&nbsp;</strong>mang trong m&igrave;nh hiệu năng mạnh mẽ, sự c&aacute;ch t&acirc;n v&agrave; đổi mới với c&aacute; t&iacute;nh ri&ecirc;ng biệt.&nbsp;<strong>Corsair CV750 - 80 Plus Bronze</strong>&nbsp;chất lượng x&acirc;y dựng rất cao v&agrave; gi&uacute;p cho c&aacute;c th&agrave;nh phần quan trọng của bộ nguồn hoạt động một c&aacute;ch ổn định.</p>

<p><img src="https://product.hstatic.net/1000026716/product/gearvn-nguon-corsair-cv750-80-plus-bronze-2_003d75e26fc640879185b38fadd11040.jpg" /></p>

<h3><strong>Case Cooler Master CMP 510 (3 fan ARGB)</strong></h3>

<p><strong>Case Cooler Master CMP 510 (3 fan ARGB)</strong>&nbsp;l&agrave; d&ograve;ng case hỗ trợ khả năng l&agrave;m m&aacute;t cực kỳ ấn tượng với bốn&nbsp;<a href="https://gearvn.com/collections/fan-rgb-tan-nhiet-pc">quạt tản nhiệt</a>&nbsp;LED đi c&ugrave;ng.</p>

<p><img src="https://product.hstatic.net/1000026716/product/cmp510_webpages_4000x4000_gallery-13-zoom_9845dd0d6b0d4302af5b4b7105b3e77b.png" /></p>

<p>Hỗ trợ l&ecirc;n đến s&aacute;u quạt l&agrave;m m&aacute;t 120mm&nbsp;v&agrave; cả bộ tản nhiệt l&ecirc;n đến 240mm. C&ugrave;ng với đ&oacute;, trang bị th&ecirc;m c&aacute;c tấm lưới ph&iacute;a trước v&agrave; ph&iacute;a tr&ecirc;n cung cấp hệ thống th&ocirc;ng gi&oacute; tối ưu để di chuyển một lượng lớn kh&ocirc;ng kh&iacute; trong suốt vỏ m&aacute;y</p>

<h3><strong>Tản nhiệt Cooler Master MASTERLIQUID ML240 ILLUSION</strong></h3>

<p>Nhằm duy tr&igrave; hiệu năng, sức mạnh cho PC GVN Intel i7-14700F/ VGA RTX 3060, GEARVN đ&atilde; trang bị th&ecirc;m cho bạn chiếc Tản nhiệt Cooler Master MASTERLIQUID ML240 ILLUSION. Hỗ trợ socket LGA 1700 c&ugrave;ng những khung kim loại đa dạng, Tản nhiệt Cooler Master MASTERLIQUID ML240 ILLUSION thoải m&aacute;i lắp đặt cho những CPU thế hệ mới.</p>

<p><img src="https://product.hstatic.net/1000026716/product/masterliquid-ml240-illusion-gallery-1_d19533774c0b488c970169781c352522_grande.png" /></p>

<p>Tản nhiệt Cooler Master MASTERLIQUID ML240 ILLUSION&nbsp;ghi điểm với chiếc quạt LED ARGB tạo n&ecirc;n m&agrave;u sắc rực rỡ g&oacute;p phần t&ocirc; điểm v&agrave;o buổi tiệc &aacute;nh s&aacute;ng của PC GVN Intel i7-14700F/ VGA RTX 3060.</p>
', CAST(29990000 AS Decimal(18, 0)), NULL, N'cmp_b9ff1747363741a58c1bfb30812ad411_grande.jpg', 5, 2, CAST(N'2025-02-03T21:45:26.073' AS DateTime), 1, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (20, N'PC GVN Intel i7-14700F/ VGA RTX 4060 Ti', N'<h2><strong>Chi tiết về PC GVN Intel i7-14700F/ VGA RTX 4060 Ti</strong></h2>

<h3><strong>CPU Intel Core i7 14700F</strong></h3>

<p>CPU&nbsp;<strong>Intel Core i7 14700F</strong>, nh&acirc;n tố khuất đảo thị trường&nbsp;<a href="https://gearvn.com/pages/pc-gvn">PC Gaming</a>&nbsp;khi sở hữu mức gi&aacute; rẻ c&ugrave;ng hiệu năng xuất sắc. Với 20 nh&acirc;n 28&nbsp;luồng, xung nhịp 2.1GHz v&agrave; turbo boost l&ecirc;n 5.4GHz, quả l&agrave; sự lựa chọn tuyệt vời từ khả năng chơi game cho tới stream game của thế hệ vi xử l&yacute; Intel Gen 14, ch&iacute;nh l&agrave; sự n&acirc;ng cấp vượt bậc so với người tiền nhiệm i7-13700F.</p>

<p><img src="https://product.hstatic.net/200000722513/product/n22459-001-rpl-i7f-fhs-dva-bc-univ_png_21fc4faaaca646ae9804e8bcc729ae57_grande.png" /></p>

<h3><strong>Mainboard&nbsp;GIGABYTE Z790 AORUS ELITE AX ICE DDR5</strong></h3>

<p><strong>GIGABYTE Z790 AORUS ELITE AX ICE DDR5</strong>&nbsp;l&agrave; một trong những d&ograve;ng mainboard được chắt lọc c&aacute;c yếu tố thiết yếu của nền tảng Intel mới nhất v&agrave; kết hợp ch&uacute;ng để tạo th&agrave;nh một sản phẩm ho&agrave;n hảo trong ph&acirc;n kh&uacute;c tầm trung. Được ho&agrave;n thiện với những th&agrave;nh phần tốt nhất, chiếc bo mạch chủ cung cấp đầy đủ những kết nối cơ bản. C&ugrave;ng với đ&oacute; l&agrave; những c&ocirc;ng nghệ ti&ecirc;n tiến từ tản nhiệt đến khả năng khai th&aacute;c hiệu năng. Sở hữu chipset Z790, GIGABYTE Z790 AORUS ELITE AX ICE DDR5 sẽ mang đến cho bạn những khả năng tương th&iacute;ch đến tuyệt vời tr&ecirc;n những&nbsp;<a href="https://gearvn.com/collections/linh-kien-may-tinh">linh kiện m&aacute;y t&iacute;nh</a>&nbsp;ti&ecirc;n tiến.</p>

<p><img src="https://product.hstatic.net/200000722513/product/1000_1a532304f7544f40a55cc5eafc282e9a_grande.png" /></p>

<p>V&agrave; cốt l&otilde;i b&ecirc;n trong của chiếc mainboard chế tạo từ bọc th&eacute;p sẽ l&agrave;m giảm thiểu hiện tượng g&atilde;y hay cong khe PCI-E khi bạn chọn lắp những VGA lớn, gi&uacute;p chịu tải trọng tốt hơn cho mainboard. Qua đ&oacute; gi&uacute;p tăng cường độ bền của sản phẩm v&agrave; cung cấp khả năng n&acirc;ng cấp trong tương lai cho người d&ugrave;ng.</p>

<h3><strong>VGA GIGABYTE GeForce RTX 4060 Ti AERO OC 8G</strong></h3>

<p><strong>GIGABYTE GeForce RTX 4060 Ti AERO OC 8G</strong>&nbsp;c&oacute; được vẻ ngo&agrave;i gaming trước đ&oacute;. Kho&aacute;c l&ecirc;n m&agrave;u đen mạnh mẽ c&ugrave;ng c&aacute;c g&oacute;c cạnh được ho&agrave;n thiện một c&aacute;ch bắt mắt, c&aacute;i t&ecirc;n từ Giga&nbsp;sẽ l&agrave;m nổi bật chiếc case n&oacute;i ri&ecirc;ng v&agrave; g&oacute;c gaming n&oacute;i chung.</p>

<p><img src="https://product.hstatic.net/1000026716/product/z4366536082639_19458ee42d2e30dec0ece60475ad1e67_a6d4613880434f7bbbd7a67ffb640a72_grande.jpg" /></p>

<p>GPU&nbsp;<a href="https://gearvn.com/collections/vga-rtx-4060-ti">RTX 4060 Ti</a>&nbsp;b&ecirc;n trong GIGABYTE GeForce RTX 4060 Ti AERO OC 8G sẽ khẳng định sức mạnh xử l&yacute; đồ họa với GPU Ada được tạo bởi kiến tr&uacute;c Ada nổi tiếng c&ugrave;ng những c&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh ti&ecirc;n tiến. Kết hợp c&ugrave;ng những đồng bộ h&oacute;a tuyệt vời, GIGABYTE GeForce RTX 4060 Ti AERO OC 8G&nbsp;sẽ đủ sức &ldquo;c&acirc;n&rdquo; những chiếc&nbsp;<a href="https://gearvn.com/collections/man-hinh-tu-5-den-10-trieu">m&agrave;n h&igrave;nh gaming</a>&nbsp;với tần số qu&eacute;t l&ecirc;n đến 144Hz.</p>

<h3><strong>RAM PNY XLR8 Silver 2x8GB 3600 RGB</strong></h3>

<p>RAM&nbsp;<strong>PNY XLR8 Silver 2x8GB 3600 RGB</strong>&nbsp;kho&aacute;c l&ecirc;n m&igrave;nh gi&aacute;p tản nhiệt nổi bật với m&agrave;u bạc sang trọng c&ugrave;ng dải đ&egrave;n&nbsp;<a href="https://gearvn.com/collections/fan-led-trang-tri">LED RGB</a>&nbsp;đầy đủ m&agrave;u sắc rực rỡ chiếu s&aacute;ng kết hợp với hiệu ứng rainbow khi&nbsp;<a href="https://gearvn.com/pages/pc-gvn">build PC</a>. C&aacute;c v&ugrave;ng đ&egrave;n s&aacute;ng tr&ecirc;n RAM c&oacute; thể ph&aacute;t s&aacute;ng với g&oacute;c si&ecirc;u rộng l&ecirc;n đến 120 độ tạo n&ecirc;n trải nghiệm thị gi&aacute;c tuyệt vời, t&ocirc; điểm th&ecirc;m cho bữa tiệc &aacute;nh s&aacute;ng cho PC GVN Intel i7-14700F/ VGA RTX 4060 Ti.</p>

<p><img src="https://product.hstatic.net/1000026716/product/en_color_list_22d26_r9gc83djaz_3c686ea66ef2444a937c1fd51d008395__1__ae48a53002da4865b402c951dd663848_grande.jpg" /></p>

<p>Được trang bị bảng mạch JEDEC RC 2.0, PNY XLR8 Silver 1x8GB 3600 RGB đem lại tốc độ đọc, truyền tải nhanh hơn với những bảng mạch th&ocirc;ng thường tr&ecirc;n những chiếc&nbsp;<a href="https://gearvn.com/collections/ddr4-8gb">RAM DDR4</a>&nbsp;kh&aacute;c. Nhờ v&agrave;o điều n&agrave;y, việc &eacute;p xung tr&ecirc;n PNY XLR8 Silver 1x8GB 3600 RGB sẽ ổn định hơn v&agrave; y&ecirc;n t&acirc;m hơn.</p>

<h3><strong>SSD WD Black SN770 500G M.2 NVMe PCIe Gen4</strong></h3>

<p>Nhằm tối ưu khả năng lưu v&agrave; l&agrave;m việc tr&ecirc;n&nbsp;<a href="https://gearvn.com/collections/pc-van-phong">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;PC GVN Intel i7-14700F/ VGA RTX 4060 Ti, GEARVN đ&atilde; trang bị th&ecirc;m cho bộ PC n&agrave;y bộ nhớ&nbsp;<a href="https://gearvn.com/collections/ssd-m-2-pcie-gen-3x4">SSD M.2</a>&nbsp;tốc độ cao với dung lượng&nbsp;500G M.2 NVMe PCIe Gen4 mang đến tốc độ khởi động m&aacute;y v&agrave; ứng dụng chỉ trong v&agrave;i gi&acirc;y cho trải nghiệm th&uacute; vị hơn rất nhiều.&nbsp;Trang bị tốc độ đọc/ghi l&ecirc;n đến 5000/4000 MB/s, WD mang lại khả năng truyền tải dữ liệu nhanh ch&oacute;ng gi&uacute;p đẩy nhanh hiệu quả c&ocirc;ng việc. C&ugrave;ng với đ&oacute;, SSD WD gi&uacute;p cho hệ thống khởi động Windows nhanh với chuẩn SSD ti&ecirc;n tiến n&agrave;y.</p>

<p><img alt=" SSD WD Black SN770 500G M.2 NVMe PCIe Gen4 " src="https://product.hstatic.net/200000722513/product/2388_cd4d84551922555986ca587b4522f8f1_40f78090bec246f1a90f2f0da44aa691_11929657a68f4f7a8a503c49e7f3df69_master.jpg" /></p>

<h3><strong>Nguồn&nbsp;m&aacute;y t&iacute;nh Corsair CV750 - 80 Plus Bronze</strong></h3>

<p>Chứng nhận 80 Plus Bronze đảm bảo hiệu suất hoạt động tốt hơn, &iacute;t l&atilde;ng ph&iacute; điện năng, tối ưu nhiệt v&agrave; tiếng ồn của quạt, l&agrave; tất cả những g&igrave;&nbsp;<strong>Nguồn m&aacute;y t&iacute;nh Corsair CV750 - 80 Plus Bronze</strong>&nbsp;sẽ mang lại cho bạn. Đ&oacute;ng vai tr&ograve; l&agrave; nguồn năng lượng cho PC GVN Intel i7-14700F/ VGA RTX 4060 Ti, Nguồn m&aacute;y t&iacute;nh Corsair CV750 - 80 Plus Bronze&nbsp;cung cấp giải ph&aacute;p tốt nhất cho việc x&acirc;y dựng hệ thống PC. C&aacute;p bện lưới l&agrave;m giảm sự lộn xộn v&agrave; cải thiện luồng kh&ocirc;ng kh&iacute; trong case. Tất cả c&aacute;c tụ điện l&agrave; tụ điện chất lượng cao, để tạo ra hiệu suất hiệu quả v&agrave; đảm bảo độ tin cậy l&acirc;u hơn. Đường Single rail + 12V cung cấp năng lượng tốt nhất, ổn định v&agrave; tương th&iacute;ch cho phần cứng.&nbsp;</p>

<p><img alt=" Nguồn máy tính Corsair CV750 - 80 Plus Bronze (750W) " src="https://product.hstatic.net/200000722513/product/-nguon-corsair-cv750-80-plus-bronze-1_8a2e753170654f65bb4b5006138e17a9_ea371e1608fe44f6bdfa9212819a5986_master.jpg" /></p>

<p>Quạt v&ograve;ng bi thủy lực 120mm tối ưu h&oacute;a việc giảm tiếng ồn v&agrave; hiệu suất nhiệt. Tốc độ quạt được điều chỉnh tự động theo hoạt động của nguồn. Quạt thủy lực b&ecirc;n trong cung cấp cho&nbsp;Nguồn Nguồn m&aacute;y t&iacute;nh Corsair CV750 - 80 Plus Bronze tuổi thọ d&agrave;i v&agrave; ổn định hơn.</p>

<h3><strong>Vỏ m&aacute;y t&iacute;nh Corsair 4000D Airflow TG White</strong></h3>

<p>Vỏ m&aacute;y t&iacute;nh Corsair 4000D Airflow TG White l&agrave; chiếc case được lựa chọn d&agrave;nh cho PC GVN Intel i7-14700F/ VGA RTX 4060 Ti. Sở hữu k&iacute;ch thước đủ lớn d&agrave;nh cho 5 chiếc fan hay&nbsp;<a href="https://gearvn.com/collections/tan-nhiet-nuoc-240mm">tản nhiệt AIO</a>&nbsp;l&ecirc;n đến&nbsp;280mm, Vỏ m&aacute;y t&iacute;nh Corsair 4000D Airflow TG Whitee cho bạn thoải m&aacute;i trang bị hệ thống tản nhiệt d&agrave;nh cho d&agrave;n PC của m&igrave;nh.&nbsp;</p>

<p>Kh&ocirc;ng dừng lại ở đ&oacute;, để tăng th&ecirc;m khả năng tiện dụng h&atilde;ng c&ograve;n t&iacute;ch hợp cổng kết nối tr&ecirc;n n&oacute;c case thuận tiện cho c&aacute;c nhu cầu kết nối với&nbsp;<a href="https://gearvn.com/collections/chuot-may-tinh" target="_blank">chuột m&aacute;y t&iacute;nh</a>,&nbsp;<a href="https://gearvn.com/collections/ban-phim-may-tinh" target="_blank">b&agrave;n ph&iacute;m</a>&nbsp;v&agrave; v&ocirc; số phụ kiện kh&aacute;c hỗ trợ tối đa cho nhu cầu chơi game giải tr&iacute; v&agrave; l&agrave;m việc.</p>
', CAST(38490000 AS Decimal(18, 0)), NULL, N'5000d_white_aero_d254c2c1d006470dad47a5a4b6c116e8_1024x1024.jpg', 5, 2, CAST(N'2025-02-03T21:47:42.507' AS DateTime), 1, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (21, N'PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super', N'<h2><strong>Đ&aacute;nh gi&aacute; chi tiết cấu h&igrave;nh&nbsp;PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super</strong></h2>

<h3><strong>Bo mạch chủ ASUS ROG Strix Z790-A GAMING WIFI DDR5</strong></h3>

<p>ASUS ROG Strix Z790-A GAMING WIFI DDR5&nbsp;l&agrave;&nbsp;<a href="https://gearvn.com/collections/mainboard-bo-mach-chu" target="_blank">bo mạch chủ</a>&nbsp;sử dụng chipset Z790 của Intel thuộc ph&acirc;n kh&uacute;c cao cấp của Asus. Tr&aacute;i tim của bộ PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super sử dụng socket LGA 1700 c&oacute; thể chạy được CPU Intel Core thế hệ 12, 13, 14 hỗ trợ PCI-E Gen 5.0 mới nhất.</p>

<p><img src="https://product.hstatic.net/200000722513/product/rog-strix-z790-a-gaming-wifi-ii-01_52d6f083bcd8484692e2a216a32f31af_grande.jpg" /></p>

<p>Sở hữu thiết kế mạnh mẽ với phần tản nhiệt cho VRM c&ugrave;ng&nbsp;k&iacute;ch thước ATX, đ&acirc;y được xem l&agrave; một trong những sự lựa chọn&nbsp;ở ph&acirc;n kh&uacute;c mainboard&nbsp;cao cấp c&oacute; gần như đầy đủ mọi t&iacute;nh năng thời thượng nhất d&agrave;nh cho những bộ&nbsp;<a href="https://gearvn.com/pages/pc-gvn" target="_blank">PC Gaming</a>&nbsp;c&oacute; thể c&acirc;n mọi tựa game ở chế độ chơi cao nhất.</p>

<h3><strong>CPU - Bộ vi xử l&yacute; Intel Core i9 14900K&nbsp;/ 4.4GHz Turbo 6.0GHz / 24 Nh&acirc;n 32 Luồng / 36MB / LGA 1700</strong></h3>

<p>CPU&nbsp;<strong>Intel Core i9 14900K</strong>&nbsp;l&agrave; một trong những d&ograve;ng sản phẩm trong ph&acirc;n&nbsp;kh&uacute;c&nbsp;Alder Lake-S sở hữu th&ocirc;ng số kỹ thuật vượt trội&nbsp;24 nh&acirc;n 32 luồng, xung nhịp 4.4GHz v&agrave; đạt mức tối đa l&agrave; 6.0GHz đ&aacute;p ứng tốt hầu hết nhu cầu sử dụng từ&nbsp;nhẹ nh&agrave;ng đến n&acirc;ng cao.</p>

<p><img src="https://product.hstatic.net/200000722513/product/n22362-001-rpl-i9kf_png_dd11cb3a2936423f8d4fa159a3061ad1_grande.png" /></p>

<p>Để mang đến hiệu năng cho bộ m&aacute;y PC Gaming, d&ograve;ng ch&iacute;p xử l&yacute; đến từ nh&agrave; Intel dễ d&agrave;ng tương th&iacute;ch với sản phẩm bo mạch chủ thuộc series Z790, chuẩn RAM DDR5,..Ngo&agrave;i ra, điểm ấn tượng nhất tr&ecirc;n CPU Core i9-14900K&nbsp;l&agrave; được trang bị&nbsp;th&ecirc;m nh&acirc;n đồ họa Intel&nbsp;UHD Graphics 770 tăng cường khả năng xử l&yacute; h&igrave;nh ảnh, đồ họa cho bộ vi xử l&yacute;.</p>

<h3><strong>RAM Corsair Vengeance RGB White 32GB (2x16GB) 5600 DDR5</strong></h3>

<p>Để&nbsp;PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super lưu trữ tốt hơn dễ d&agrave;ng truy xuất v&agrave; xử l&yacute; dữ liệu, GEARVN đ&atilde; trang bị d&ograve;ng&nbsp;<a href="https://gearvn.com/collections/ram-pc" target="_blank">RAM</a>&nbsp;với sức mạnh vượt trội đến từ Corsair.&nbsp;</p>

<p>Corsair Vengeance RGB 32GB (2x16GB) với bus ram l&ecirc;n đến 5600&nbsp;mang lại hiệu suất cao nhất của DDR5. Cải thiện khả năng &eacute;p xung cho bộ m&aacute;y PC chơi game&nbsp;sử dụng c&ocirc;ng nghệ&nbsp;On-die ECC (ODECC) gi&uacute;p duy tr&igrave; dữ liệu một c&aacute;ch trọn vẹn, đảm bảo sự ổn định cho cả hệ thống.</p>

<p><img src="https://product.hstatic.net/200000722513/product/ram-pc-corsair-vengeance-rgb-whi_453c3d7acedc495983e67b06cb54503a_grande.png" /></p>

<p>&nbsp;</p>

<p>Để c&oacute; những trải nghiệm game tuyệt đỉnh hay c&aacute;c ứng dụng n&acirc;ng cao với hiệu năng vượt trội trong mọi ho&agrave;n cảnh,&nbsp;<a href="https://gearvn.com/collections/ram-pc-ddr5" target="_blank">RAM DDR5</a>&nbsp;Corsair&nbsp;c&oacute; thời gian truyền tải dữ liệu h&agrave;ng&nbsp;loạt tăng gấp đ&ocirc;i 8 đến 16 v&agrave; 2 k&ecirc;nh phụ 32-bit.</p>

<h3><strong>Card đồ họa ASUS TUF Gaming GeForce RTX 4070 Ti SUPER 16GB GDDR6X White OC Edition</strong></h3>

<p>Bộ&nbsp;<a href="https://gearvn.com/collections/pc-van-phong">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super được trang bị&nbsp;<a href="https://gearvn.com/collections/vga-card-man-hinh" target="_blank">card m&agrave;n h&igrave;nh</a>&nbsp;ASUS TUF Gaming GeForce RTX 4070 Ti White OC Edition 12GB&nbsp;l&agrave; một trong những sản phẩm cao cấp nhất của Asus&nbsp;phục vụ cho nhu cầu gaming xuất ra ở m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh&nbsp;ở độ ph&acirc;n giải 2K, 4K.</p>

<p><img src="https://product.hstatic.net/200000722513/product/tuf-rtx4070tis-o16g-gaming-white-edition-01_c138924a9bf64a2ab3e45557b617a1eb_grande.jpg" /></p>

<p>&nbsp;</p>

<p>Sử dụng kiến tr&uacute;c Ada&nbsp;ho&agrave;n to&agrave;n mới c&ugrave;ng nh&acirc;n RT thế hệ 2, nh&acirc;n Tensor thế hệ 3, Nvidia RTX IO, VRAM GDDR6X v&agrave; sản xuất tr&ecirc;n tiến tr&igrave;nh 8nm. Dễ d&agrave;ng tinh chỉnh th&ocirc;ng qua phần mềm ASUS độc quyền&nbsp;gi&uacute;p bạn khai th&aacute;c tối đa hiệu năng nhằm n&acirc;ng cao hiệu suất hoạt động cho cả bộ m&aacute;y trong suốt qu&aacute; tr&igrave;nh chơi game giải tr&iacute;.</p>

<h3><strong>SSD WD Black SN770 1TB M.2 NVMe PCIe Gen4</strong></h3>

<p>Được xem l&agrave; một trong những sự lựa chọn tốt nhất hiện nay d&agrave;nh cho game thủ cả về gi&aacute; th&agrave;nh&nbsp;lẫn&nbsp;hiệu năng,&nbsp;SSD WD Black SN770 1TB M.2 NVMe PCIe Gen4 đ&aacute;p ứng mọi&nbsp;nhu cầu về tốc độ của bạn với chuẩn giao tiếp&nbsp;PCIe 4.0, sử dụng c&ocirc;ng nghệ HMB&nbsp;v&agrave; giao diện NVMe để đạt hiệu quả cao.&nbsp;</p>

<p><img src="https://product.hstatic.net/1000026716/product/z3453602902388_cd4d84551922555986ca587b4522f8f1_40f78090bec246f1a90f2f0da44aa691_grande.jpg" /></p>

<p>&nbsp;</p>

<ul>
	<li>Tốc độ đọc/ghi tuần tự l&ecirc;n đến 5.000/ 4.000 MB/s, gấp nhiều&nbsp;lần tốc độ của&nbsp;<a href="https://gearvn.com/collections/ssd-sata-3" target="_blank">SSD SATA</a>.</li>
	<li>Độ bền vượt trội nhờ v&agrave;o c&ocirc;ng nghệ V-NAND 128-Layers.</li>
	<li>Được hỗ trợ tản nhiệt, gi&uacute;p ổ cứng hoạt&nbsp;m&aacute;t mẻ v&agrave; ổn định trong suốt qu&aacute; tr&igrave;nh sử dụng.</li>
	<li>Dễ d&agrave;ng theo d&otilde;i, quản l&yacute; v&agrave; duy tr&igrave; hiệu năng SSD qua phần mềm.</li>
</ul>

<h3><strong>Corsair RM1000e ATX 3.0 - 80 Plus Gold - Full Modular (1000W)</strong></h3>

<p><a href="https://gearvn.com/collections/psu-nguon-may-tinh" target="_blank">Nguồn PC</a>&nbsp;hỗ trợ d&agrave;nh cho những cổ m&aacute;y gaming đẳng cấp v&agrave; đắt tiền&nbsp;c&oacute; thể hỗ trợ GPU NVIDIA GeForce RTX 40/30/20 series&nbsp;v&agrave; AMD.&nbsp;Được chuẩn bị cho c&aacute;c y&ecirc;u cầu cao nhất, hỗ trợ IO của bộ nguồn Corsair RM1000e ATX 3.0 - 80 Plus Gold - Full Modular (1000W)&nbsp;c&oacute; thể hỗ trợ c&aacute;c c&aacute;ch kết nối kh&aacute;c nhau v&agrave; linh hoạt theo thiết kế của c&aacute;c card đồ họa&nbsp;kh&aacute;c nhau.</p>

<p><img src="https://product.hstatic.net/200000722513/product/thiet_ke_chua_co_ten_a532c354608f43eab3313b54626b3c70_5a71147440ae46bfad22d894f423d857_grande.png" /></p>

<p>Với c&ocirc;ng suất hoạt động tối đa l&ecirc;n đến 1000W mang đến hiệu quả&nbsp;trực tiếp đến hệ thống v&agrave; mức ti&ecirc;u thụ điện năng của bộ PC. Chứng nhận 80 PLUS Gold hứa hẹn ti&ecirc;u thụ năng lượng thấp hơn v&agrave; hiệu quả cao hơn.</p>

<h3><strong>Vỏ m&aacute;y t&iacute;nh Corsair 6500D Airflow TG Mid-Tower White</strong></h3>

<p><a href="https://gearvn.com/collections/case-thung-may-tinh" target="_blank">Case m&aacute;y t&iacute;nh</a>&nbsp;với k&iacute;ch thước Full-Tower&nbsp;trung b&igrave;nh thoải m&aacute;i cho người d&ugrave;ng lắp r&aacute;p c&aacute;c&nbsp;linh kiện m&aacute;y t&iacute;nh&nbsp;ph&ugrave; hợp.&nbsp;Case Corsair 6500D Airflow TG Mid-Tower White được thiết kế theo dạng hoa văn độc đ&aacute;o vừa mang lại t&iacute;nh thẩm mỹ cao vừa tạo c&aacute;c lỗ th&ocirc;ng gi&oacute; hiệu quả v&agrave; dễ d&agrave;ng th&aacute;o lắp.&nbsp;Điều n&agrave;y gi&uacute;p cho bộ m&aacute;y PC GVN Intel i9-14900K/ VGA RTX 4070 Ti Super th&ecirc;m phần ấn tượng, tạo n&ecirc;n vẻ ngo&agrave;i độc đ&aacute;o.</p>

<p><img src="https://product.hstatic.net/200000722513/product/6500d_airflow_white_hero_01_aa_e273b71954d64f4282aa89bdfe49c45f_grande.png" /></p>

<h3><strong>Tản nhiệt AIO Corsair iCUE LINK H150i RGB White</strong></h3>

<p>Tản nhiệt AIO&nbsp;Corsair iCUE LINK H150i RGB White với thiết kế mới gi&uacute;p to&agrave;n bộ&nbsp;<a href="https://gearvn.com/collections/linh-kien-may-tinh" target="_blank">linh kiện PC</a>&nbsp;tăng cường độ bền duy tr&igrave; hiệu suất hoạt động tốt. Đ&acirc;y được xem l&agrave; mảnh gh&eacute;p cuối c&ugrave;ng d&agrave;nh cho bộ m&aacute;y chơi game ho&agrave;n hảo.&nbsp;</p>

<p><img src="https://product.hstatic.net/200000722513/product/icue_link_h150i_rgb_white_render_01_8a6e9f0327c14091acc42d5e33bb56e3_grande.png" /></p>

<p>D&ograve;ng linh kiện m&aacute;y t&iacute;nh thế hệ mới sở hữu thiết kế pump mới với c&aacute;c linh kiện nổi bật v&agrave; chất lượng để tăng cường độ bền duy tr&igrave; hiệu suất hoạt động. Nếu bạn lo lắng về t&igrave;nh trạng rỉ nước ở c&aacute;c d&ograve;ng sản phẩm&nbsp;<a href="https://gearvn.com/collections/tan-nhiet-nuoc-240mm" target="_blank">tản nhiệt nước</a>&nbsp;sẽ ảnh hưởng đến tuổi thọ của hệ thống, với&nbsp;Tản nhiệt AIO Corsair iCUE LINK H150i RGB White&nbsp;bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m v&igrave;&nbsp;đ&atilde; được đ&atilde; sử dụng chất liệu cao su EPDM theo ti&ecirc;u chuẩn ngăn ngừa rỉ nước.</p>
', CAST(70990000 AS Decimal(18, 0)), NULL, N'pc_gvn_gr701_white_-_1_bcbdc8851d004e2e9c7e226a1ea263bf_grande.jpg', 5, 2, CAST(N'2025-02-03T21:50:09.857' AS DateTime), 1, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (22, N'Màn hình Asus ROG Strix XG27UCG 27" Fast IPS 4K 160Hz-FHD 320Hz chuyên game', N'<p><strong>Th&ocirc;ng tin chung:</strong></p>

<p><strong>- Nh&agrave; sản xuất:</strong>&nbsp;ASUS</p>

<p><strong>- Hỗ trợ đổi mới trong 7 ng&agrave;y.</strong></p>
', CAST(12790000 AS Decimal(18, 0)), NULL, N'asus_xg27ucg_gearvn_dc91678e3a604d00907d30432cca83ff_grande.jpg', 1, 7, CAST(N'2025-02-04T12:22:16.570' AS DateTime), 1, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (23, N'Chuột Logitech G Pro X Superlight 2 Dex Wireless Black', N'<h2>Th&ocirc;ng tin sản phẩm</h2>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết&nbsp;chuột Logitech G Pro X Superlight 2 Dex Wireless Black</strong>&nbsp;</h2>

<p><a href="https://gearvn.com/products/chuot-logitech-g-pro-x-superlight-2-dex-wireless-black">Logitech G Pro X Superlight 2 Dex Wireless</a>&nbsp;l&agrave; một thiết bị chuột kh&ocirc;ng d&acirc;y cao cấp, sở hữu ngoại h&igrave;nh t&acirc;n tiến mang lại cho người d&ugrave;ng trải nghiệm &ecirc;m tay. B&ecirc;n cạnh đ&oacute;, trọng lượng si&ecirc;u nhẹ kết hợp với thiết kế kh&ocirc;ng d&acirc;y đ&atilde; gi&uacute;p sản phẩm n&agrave;y chinh phục được c&aacute;c game thủ chuy&ecirc;n nghiệp hay những người y&ecirc;u th&iacute;ch chơi điện tử.</p>

<h2><strong>Thiết kế c&ocirc;ng th&aacute;i học, trọng lượng chỉ c&oacute; 60&nbsp;gram</strong></h2>

<p>Với thiết kế c&ocirc;ng th&aacute;i học độc đ&aacute;o v&agrave; h&agrave;ng loạt t&iacute;nh năng đỉnh cao kh&aacute;c&nbsp;<a href="https://gearvn.com/collections/chuot-may-tinh">chuột</a>&nbsp;Logitech G Pro X Superlight 2 Dex sẽ&nbsp;gi&uacute;p bạn đạt được độ ch&iacute;nh x&aacute;c tuyệt đối trong từng c&uacute; click. B&ecirc;n cạnh đ&oacute;, sản phẩm c&ograve;n sở hữu trọng lượng si&ecirc;u nhẹ 60g mang đến sự linh hoạt tối đa, gi&uacute;p bạn nhanh ch&oacute;ng th&iacute;ch nghi với mọi t&igrave;nh huống trong game.</p>

<p><img alt="GEARVN - Chuột Logitech G Pro X Superlight 2 Dex Wireless Black" src="https://file.hstatic.net/200000722513/file/gearvn-chuot-logitech-g-pro-x-superlight-2-dex-wireless-black-__3__1024x1024.jpg" /></p>

<h2><strong>Cảm biến Hero 2 mang lại hiệu suất vượt trội</strong></h2>

<p>Chuột Logitech G Pro X Superlight 2 Dex Wireless được trang bị bộ cảm biến HERO 2 đầy t&acirc;n tiến, mang lại độ ch&iacute;nh x&aacute;c c&ugrave;ng độ nhạy cao, để bạn dễ d&agrave;ng điều khiển trong mọi t&igrave;nh huống với những c&uacute; click chuột si&ecirc;u nhanh. B&ecirc;n cạnh đ&oacute;, việc kết nối kh&ocirc;ng d&acirc;y cũng n&acirc;ng cao tốc độ phản hồi, tần số gửi t&iacute;n hiệu c&oacute; khả năng l&ecirc;n tới 2000Hz cho độ trễ gần như xuống 0, đ&acirc;y quả thật l&agrave; một trợ thủ đắc lực cho c&aacute;c gamer.</p>
', CAST(3190000 AS Decimal(18, 0)), NULL, N'pro-x-superlight-2-dex-black-gal_8e2163b06e86419eb2f99ecb7dccda8f_grande.jpg', 14, 9, CAST(N'2025-02-04T12:24:12.623' AS DateTime), 1, 30)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [Gia], [GiaMoi], [HinhAnh], [MaHang], [MaDanhMuc], [NgayTao], [TrangThai], [SoLuong]) VALUES (24, N'Bàn phím Logitech G Pro X 60 Light Speed Black', N'<h2>Th&ocirc;ng tin sản phẩm</h2>

<p>&nbsp;</p>

<p>Trong thế giới c&ocirc;ng nghệ ng&agrave;y nay, việc tối ưu h&oacute;a kh&ocirc;ng gian l&agrave;m việc v&agrave; n&acirc;ng cao trải nghiệm sử dụng m&aacute;y t&iacute;nh l&agrave; nhu cầu cấp thiết. Một trong những sản phẩm đ&aacute;p ứng ho&agrave;n hảo c&aacute;c y&ecirc;u cầu n&agrave;y ch&iacute;nh l&agrave; b&agrave;n ph&iacute;m Logitech G Pro X 60 Light Speed . H&atilde;y c&ugrave;ng&nbsp;<a href="https://gearvn.com/">GEARVN&nbsp;</a>kh&aacute;m ph&aacute; những ưu điểm vượt trội của sản phẩm n&agrave;y.</p>

<table border="1" cellpadding="3" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Kết nối:</strong></p>
			</td>
			<td>
			<p>3 chế độ:<br />
			. Lightspeed Wireless<br />
			. Lightspeed Bluetooth<br />
			. C&oacute; d&acirc;y</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Kiểu d&aacute;ng:</strong></p>
			</td>
			<td>
			<p>Thiết kế 60% được lấy cảm hứng chuy&ecirc;n nghiệp</p>

			<p>KEYCONTROL</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Đ&egrave;n led:</strong></p>
			</td>
			<td>
			<p>RGB LIGHTSYNC</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>K&iacute;ch thước:</strong></p>
			</td>
			<td>
			<ul>
				<li>
				<p><strong>Chiều cao</strong>: 34 mm</p>
				</li>
				<li>
				<p><strong>Chi&ecirc;̀u r&ocirc;̣ng</strong>: 352 mm</p>
				</li>
				<li>
				<p><strong>Chiều d&agrave;y</strong>: 150 mm</p>
				</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h2><strong>Thiết kế nhỏ gọn</strong></h2>

<p><a href="https://gearvn.com/collections/ban-phim-may-tinh">B&agrave;n ph&iacute;m</a>&nbsp;với bố cục 60% loại bỏ cụm ph&iacute;m số v&agrave; ph&iacute;m chức năng, gi&uacute;p tiết kiệm diện t&iacute;ch b&agrave;n l&agrave;m việc v&agrave; tạo kh&ocirc;ng gian rộng r&atilde;i cho việc di chuyển chuột. Điều n&agrave;y đặc biệt ph&ugrave; hợp cho game thủ cần kh&ocirc;ng gian rộng r&atilde;i để thao t&aacute;c&nbsp;<a href="https://gearvn.com/collections/chuot-may-tinh">chuột&nbsp;</a>nhanh ch&oacute;ng hoặc những ai ưa th&iacute;ch thiết lập tối giản, gọn g&agrave;ng tr&ecirc;n b&agrave;n l&agrave;m việc của m&igrave;nh.</p>
', CAST(3800000 AS Decimal(18, 0)), NULL, N'5mcsgas4_32ac8fe0d75c469292dab3e5a70e9ca6_grande.jpg', 14, 8, CAST(N'2025-02-04T12:32:01.957' AS DateTime), 1, 18)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (1, N'admin', N'123456', 1, N'Admin', N'179 Nơ Trang Long P.12 Q.Bình Thạnh TPHCM', N'093750179', N'lenhan16587@gmail.com', CAST(N'2024-10-04T20:03:23.867' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (2, N'NV1', N'123456', 4, N'Nhân viên A', N'TPHCM', N'123455678', N'nhanvien1@gmail.com', CAST(N'2024-10-04T20:03:50.780' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (3, N'khachhang1', N'123456', 3, N'Khách hàng A', N'Bà rịa', N'123466111', N'khach@gmail.com', CAST(N'2024-10-04T20:04:19.923' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (4, N'trandangduc0', N'239596', 3, N'test1', N'256/A Bến Tre', N'0915456551', N'thanhtroll0915@gmail.com', CAST(N'2024-10-06T12:59:59.493' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (5, N'test123', N'123', 3, N'test123', N'256/A Bến Tre 2', N'1234567890', N'test@gmail.com', CAST(N'2024-10-06T13:49:47.503' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (6, N'NV2', N'123456', 2, N'Nhân viên B', N'TPHCM', N'111111111', N'nhanvien2@gmail.com', CAST(N'2024-10-06T16:08:25.107' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (7, N'khachabc', N'1234', 3, N'khachabc', N'abc ho chi minh q1', N'011111111111', N'khachabc@gmail.com', CAST(N'2024-10-06T18:27:51.777' AS DateTime), 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (1007, N'test', N'123', 4, N'test', N'256/A Bến Tre', N'0915456552', N'test1@gmail.com', CAST(N'2024-10-06T18:27:51.777' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [Username], [Password], [MaQuyen], [HoTen], [DiaChi], [SoDienThoai], [Email], [NgayTao], [TrangThai]) VALUES (1008, N'nv3', N'123', 2, N'nv3', N'256/A Bến Tre', N'0915456553', N'testnv3@gmail.com', CAST(N'2024-10-14T21:01:14.677' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([MaVoucher], [Code], [GiamGia], [NgayBatDau], [NgayKetThuc], [SoLuongSuDung], [SoLuongSuDungToiDa], [TrangThai], [MoTa]) VALUES (4, N'123', CAST(10 AS Decimal(18, 0)), CAST(N'2025-01-02T00:00:00.000' AS DateTime), CAST(N'2025-10-10T00:00:00.000' AS DateTime), 1, 12, 1, N'tet')
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[DanhMucSanPham] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DanhMucSanPham] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (getdate()) FOR [NgayDatHang]
GO
ALTER TABLE [dbo].[GioHang] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HangSanPham] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HangSanPham] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT ((0)) FOR [SoLuongSuDung]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhapKho] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhapKho_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho] CHECK CONSTRAINT [FK_ChiTietPhieuNhapKho_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaVoucher])
REFERENCES [dbo].[Voucher] ([MaVoucher])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangSanPham] ([MaHang])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
USE [master]
GO
ALTER DATABASE [ITStore] SET  READ_WRITE 
GO
