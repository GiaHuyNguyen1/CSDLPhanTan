USE [master]
GO
/****** Object:  Database [QLNHAPDOTHETHAO]    Script Date: 4/22/2021 22:12:18 ******/
CREATE DATABASE [QLNHAPDOTHETHAO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNHAPDOTHETHAO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLNHAPDOTHETHAO.mdf' , SIZE = 17472KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNHAPDOTHETHAO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLNHAPDOTHETHAO_log.ldf' , SIZE = 12608KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNHAPDOTHETHAO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET  MULTI_USER 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNHAPDOTHETHAO', N'ON'
GO
USE [QLNHAPDOTHETHAO]
GO
/****** Object:  User [HTKN]    Script Date: 4/22/2021 22:12:19 ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 4/22/2021 22:12:19 ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_75CC84F367414E53A3A92D44674E37A7]    Script Date: 4/22/2021 22:12:19 ******/
CREATE ROLE [MSmerge_75CC84F367414E53A3A92D44674E37A7]
GO
/****** Object:  DatabaseRole [MSmerge_1DEF16A0492F4F519C01506D8C5289DA]    Script Date: 4/22/2021 22:12:19 ******/
CREATE ROLE [MSmerge_1DEF16A0492F4F519C01506D8C5289DA]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_75CC84F367414E53A3A92D44674E37A7]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_1DEF16A0492F4F519C01506D8C5289DA]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 4/22/2021 22:12:19 ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  StoredProcedure [dbo].[KTDN]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KTDN](@manv char(10),@tennv char(10))
AS
	BEGIN
		IF EXISTS (SELECT 1 FROM NHANVIEN NV WHERE NV.MANV=@manv AND NV.TENNV=@tennv)
		BEGIN
			RETURN 1;	
		END
		ELSE 
			RETURN 0;
	END

GO
/****** Object:  StoredProcedure [dbo].[KTR_MANHAP]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KTR_MANHAP](@manhapkho char(10))
AS
	BEGIN
		IF EXISTS (SELECT 1 FROM NHAPKHO  WHERE NHAPKHO.MANHAP= @manhapkho)
		BEGIN
		RETURN 1;
		END
		IF EXISTS (SELECT 1 FROM LINK.QLNHAPDOTHETHAO.DBO.NHAPKHO NV WHERE NV.MANHAP=@manhapkho)
		BEGIN	
			RETURN 1;
			END
			RETURN 0;
		 
	END
GO
/****** Object:  StoredProcedure [dbo].[KTR_MANV]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KTR_MANV](@manv char(10))
AS
	BEGIN
		IF EXISTS (SELECT 1 FROM NHANVIEN WHERE NHANVIEN.MANV = @manv)
		BEGIN
		RETURN 1;
		END
		IF EXISTS (SELECT 1 FROM LINK.QLNHAPDOTHETHAO.DBO.NHANVIEN NV WHERE NV.MANV =@manv)
		BEGIN	
			RETURN 1;
			END
			RETURN 0;
		 
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoTaiKhoan]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TaoTaiKhoan] @login varchar(50),
	@pass varchar(50),
	@username varchar(50),
	@role varchar(50)
AS
BEGIN
	DECLARE @RET INT
	EXEC @RET = SP_ADDLOGIN @login,@pass,'QLNHAPDOTHETHAO'
	
	IF(@RET =1) --LOGIN NAME TRUNG
	RETURN 1
	
	EXEC @RET = SP_GRANTDBACCESS @login,@username
	IF (@RET =1) --USER TRUNG
	BEGIN
		EXEC SP_DROPLOGIN @login
		RETURN 2
	END
	EXEC sp_addrolemember @role,@username
	IF(@ROLE='CONGTY')
		BEGIN
			
			EXEC sp_addsrvrolemember @login,'SecurityAdmin'
			EXEC sp_addsrvrolemember @login, 'ProcessAdmin'
		END

	IF (@role ='CHINHANH')
		BEGIN
			EXEC sp_addsrvrolemember @login,'sysadmin'
			EXEC sp_addsrvrolemember @login,'SecurityAdmin'
			EXEC sp_addsrvrolemember @login, 'ProcessAdmin'
		END
	IF(@ROLE ='USER')
		BEGIN
			EXEC sp_addsrvrolemember @login,'ProcessAdmin'
		END
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMaCN]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateMaCN](@manv char(10), @tennv nvarchar(100), @diachi nvarchar(100), @sdt char(10),@macn char(10))
as
	begin
	DELETE FROM NHANVIEN WHERE MANV = @manv
	INSERT INTO LINK.QLNHAPDOTHETHAO.DBO.NHANVIEN(MANV,TENNV,DIACHI,SDT,MACN) values (@manv,@tennv,@diachi,@sdt,@macn)
	end


GO
/****** Object:  Table [dbo].[CHINHANH]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHINHANH](
	[MACN] [char](10) NOT NULL,
	[TENCN] [nvarchar](100) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETNHAP]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETNHAP](
	[MANHAP] [char](10) NOT NULL,
	[MASP] [char](10) NOT NULL,
	[SL] [int] NULL,
	[THANHTIEN] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CT] PRIMARY KEY CLUSTERED 
(
	[MANHAP] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTKHO]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTKHO](
	[MAKHO] [char](10) NOT NULL,
	[MASP] [char](10) NOT NULL,
	[SL] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CTKHO] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHO]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHO](
	[MAKHO] [char](10) NOT NULL,
	[TENKHO] [nvarchar](100) NULL,
	[MACN] [char](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [char](10) NOT NULL,
	[TENNV] [nvarchar](100) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
	[MACN] [char](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHAPKHO]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHAPKHO](
	[MANHAP] [char](10) NOT NULL,
	[MAKHO] [char](10) NULL,
	[TONGTIEN] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NHAPKHO] PRIMARY KEY CLUSTERED 
(
	[MANHAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 4/22/2021 22:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MASP] [char](10) NOT NULL,
	[TENSP] [nvarchar](50) NULL,
	[DVT] [char](10) NULL,
	[DONGIABAN] [float] NULL,
	[GHICHU] [nvarchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHINHANH] ([MACN], [TENCN], [DIACHI], [SDT], [rowguid]) VALUES (N'CN01      ', N'CHI NHANH HCM', N'423 LE TRONG TAN', N'0965848775', N'2962cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHINHANH] ([MACN], [TENCN], [DIACHI], [SDT], [rowguid]) VALUES (N'CN02      ', N'CHI NHANH HN', N'423 LE DUC THO', N'0965848225', N'2a62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'MP66      ', N'SP02      ', 2, 1233, N'1614cd49-a9a2-eb11-9e07-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'MP77      ', N'SP01      ', 7, 70000, N'5c7fb9e0-aca2-eb11-9e07-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP01    ', N'SP01      ', 12, 500000, N'4162cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP01    ', N'SP02      ', 12, 500000, N'4262cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP01    ', N'SP03      ', 12, 500000, N'4362cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP01    ', N'SP06      ', 5, 12000, N'e112c250-c39d-eb11-9e03-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP02    ', N'SP04      ', 12, 500000, N'4462cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP02    ', N'SP05      ', 12, 1000000, N'4562cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP03    ', N'SP02      ', 12, 500000, N'4662cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP03    ', N'SP04      ', 12, 1000000, N'4762cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP05    ', N'SP03      ', 5, 250000, N'34ef2eba-e7a1-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP06    ', N'SP05      ', 5, 12000, N'61235763-c39d-eb11-9e03-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP07    ', N'SP01      ', 5, 30000, N'c9bceffe-e7a1-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP07    ', N'SP02      ', 5, 50000, N'cf2e9cda-c49d-eb11-9e03-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP07    ', N'SP03      ', 5, 50000, N'05f9ccca-e7a1-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP10    ', N'SP03      ', 5, 150000, N'3d5f3315-e8a1-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP11    ', N'SP01      ', 6, 300000, N'b1cbfa75-e8a1-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP12    ', N'SP01      ', 12, 144000, N'46d34d60-05a2-eb11-9e06-2047471d8391')
INSERT [dbo].[CHITIETNHAP] ([MANHAP], [MASP], [SL], [THANHTIEN], [rowguid]) VALUES (N'NHAP50    ', N'SP04      ', 5, 30000, N'1b186ebd-a6a2-eb11-9e07-2047471d8391')
INSERT [dbo].[CTKHO] ([MAKHO], [MASP], [SL], [rowguid]) VALUES (N'KHO01     ', N'SP01      ', 1000, N'3e62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CTKHO] ([MAKHO], [MASP], [SL], [rowguid]) VALUES (N'KHO01     ', N'SP02      ', 100, N'3f62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[CTKHO] ([MAKHO], [MASP], [SL], [rowguid]) VALUES (N'KHO02     ', N'SP03      ', 3000, N'4062cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[KHO] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'KHO01     ', N'KHO TPHCM1', N'CN01      ', N'3162cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[KHO] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'KHO02     ', N'KHO TPHCM2', N'CN01      ', N'3262cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[KHO] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'KHO03     ', N'KHO HN1', N'CN02      ', N'3362cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[KHO] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'KHO04     ', N'KHO HN2', N'CN02      ', N'3462cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'?12       ', N'12', N'âs', N'á         ', N'CN02      ', N'baa2b174-7ea2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'á         ', N'ss22', N'ss', N'sss       ', N'CN02      ', N'0789430b-7ea2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'áâ        ', N'dá', N'dasd', N'dasdasd   ', N'CN02      ', N'e9eb3158-7ea2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'AS        ', N'ss', N'as', N'ss        ', N'CN02      ', N'f29200f2-a8a2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV02      ', N'HUY', N'42 LE DUC THO', N'0235661113', N'CN01      ', N'3662cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV03      ', N'DUYEN', N'âsas', N'âs        ', N'CN01      ', N'03ff748a-7ca2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV04      ', N'THUAN', N'43 LE TRONG TAN', N'0234122333', N'CN02      ', N'3862cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV05      ', N'HUYEN', N'23 NGUYEN VAN LUONG', N'0235111333', N'CN02      ', N'3e093dcb-7da2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV09      ', N'DAO', N'sa', N'sas       ', N'CN02      ', N'84f21468-a7a2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV333     ', N'sasas', N'sasa', N'asas      ', N'CN02      ', N'09715668-aca2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV50      ', N'ss', N'sa', N'saas      ', N'CN02      ', N'1f966f27-a9a2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV], [DIACHI], [SDT], [MACN], [rowguid]) VALUES (N'NV7       ', N'HUY', N'sa2', N'sa2as2    ', N'CN02      ', N'38004bb4-7ea2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'MP66      ', N'KHO01     ', 2466, N'1514cd49-a9a2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'MP77      ', N'KHO01     ', 490000, N'5b7fb9e0-aca2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP01    ', N'KHO01     ', 12000000, N'3a62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP02    ', N'KHO02     ', 10000000, N'3b62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP03    ', N'KHO02     ', 14000000, N'3c62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP04    ', N'KHO03     ', 11000000, N'3d62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP05    ', N'KHO03     ', 250000, N'4f30c4b3-e7a1-eb11-9e06-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP06    ', N'KHO01     ', NULL, N'60235763-c39d-eb11-9e03-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP07    ', N'KHO01     ', 250000, N'38be3cd4-c49d-eb11-9e03-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP10    ', N'KHO03     ', NULL, N'3c5f3315-e8a1-eb11-9e06-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP11    ', N'KHO03     ', 300000, N'b0cbfa75-e8a1-eb11-9e06-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP12    ', N'KHO03     ', 144000, N'45d34d60-05a2-eb11-9e06-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP50    ', N'KHO01     ', 150000, N'bf8a55a7-a6a2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP66    ', N'KHO01     ', NULL, N'6f658311-aca2-eb11-9e07-2047471d8391')
INSERT [dbo].[NHAPKHO] ([MANHAP], [MAKHO], [TONGTIEN], [rowguid]) VALUES (N'NHAP88    ', N'KHO01     ', NULL, N'9d4f8c7f-aca2-eb11-9e07-2047471d8391')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP01      ', N'GIÀY Pan Vigor X Nagoya LTD IC', N'DOI       ', 2100000, N'', N'2b62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP02      ', N'GIÀY Pan Vigor X Nagoya LTD IC', N'DOI       ', 2100000, N'', N'2c62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP03      ', N'GIÀY Pan Vigor V Tokyo LTD IC', N'DOi       ', 4100000, N'', N'2d62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP04      ', N'GIÀY Pan Vigor VII Nagoya LTD IC', N'DOI       ', 2100000, N'', N'2e62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP05      ', N'GIÀY Pan Vigor V Nagoya LTD IC', N'DOI       ', 5000000, N'', N'2f62cf50-549b-eb11-9dfd-acd1b8d1dfda')
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [DVT], [DONGIABAN], [GHICHU], [rowguid]) VALUES (N'SP06      ', N'GIÀY Pan Vigor B Naka LTD IC', N'DOI       ', 600000, N'', N'3062cf50-549b-eb11-9dfd-acd1b8d1dfda')
/****** Object:  Index [MSmerge_index_245575913]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_245575913] ON [dbo].[CHINHANH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_597577167]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_597577167] ON [dbo].[CHITIETNHAP]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_405576483]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_405576483] ON [dbo].[CTKHO]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_357576312]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_357576312] ON [dbo].[KHO]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_277576027]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_277576027] ON [dbo].[NHANVIEN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_469576711]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_469576711] ON [dbo].[NHAPKHO]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_325576198]    Script Date: 4/22/2021 22:12:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_325576198] ON [dbo].[SANPHAM]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHINHANH] ADD  CONSTRAINT [MSmerge_df_rowguid_DFD2ED29F3504E2080D8B3CAE46CCCD9]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CHITIETNHAP] ADD  CONSTRAINT [MSmerge_df_rowguid_5514DBC065624A1284100E0F47F6492C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CTKHO] ADD  CONSTRAINT [MSmerge_df_rowguid_430E8F19C94441E58CF14E2857B41651]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KHO] ADD  CONSTRAINT [MSmerge_df_rowguid_FA7E4089A048435D805203B58BB487D4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_2CA4C92E72D74EF2A9AB8001F0379BD2]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NHAPKHO] ADD  CONSTRAINT [MSmerge_df_rowguid_32D9A8CF82314F0E82C9466F00CBA824]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [MSmerge_df_rowguid_11C7F14282F84203B85C97929A72DFBE]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CHITIETNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CT_NHAP] FOREIGN KEY([MANHAP])
REFERENCES [dbo].[NHAPKHO] ([MANHAP])
GO
ALTER TABLE [dbo].[CHITIETNHAP] CHECK CONSTRAINT [FK_CT_NHAP]
GO
ALTER TABLE [dbo].[CHITIETNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTK_SP] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[CHITIETNHAP] CHECK CONSTRAINT [FK_CTK_SP]
GO
ALTER TABLE [dbo].[CTKHO]  WITH CHECK ADD  CONSTRAINT [FK_CT_KHO] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[KHO] ([MAKHO])
GO
ALTER TABLE [dbo].[CTKHO] CHECK CONSTRAINT [FK_CT_KHO]
GO
ALTER TABLE [dbo].[CTKHO]  WITH CHECK ADD  CONSTRAINT [FK_CT_SP] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[CTKHO] CHECK CONSTRAINT [FK_CT_SP]
GO
ALTER TABLE [dbo].[KHO]  WITH CHECK ADD  CONSTRAINT [FK_KHO] FOREIGN KEY([MACN])
REFERENCES [dbo].[CHINHANH] ([MACN])
GO
ALTER TABLE [dbo].[KHO] CHECK CONSTRAINT [FK_KHO]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NV] FOREIGN KEY([MACN])
REFERENCES [dbo].[CHINHANH] ([MACN])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NV]
GO
ALTER TABLE [dbo].[NHAPKHO]  WITH CHECK ADD  CONSTRAINT [FK_NAP_KHO] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[KHO] ([MAKHO])
GO
ALTER TABLE [dbo].[NHAPKHO] CHECK CONSTRAINT [FK_NAP_KHO]
GO
USE [master]
GO
ALTER DATABASE [QLNHAPDOTHETHAO] SET  READ_WRITE 
GO
