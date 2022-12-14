/****** Object:  Database [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI]    Script Date: 11/5/2022 9:47:42 PM ******/
CREATE DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI', FILENAME = N'D:\Working_space\MS_SQL_SERVER_project\DBI202_FINAL_ASSIGNMENT\DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI_log', FILENAME = N'D:\Working_space\MS_SQL_SERVER_project\DBI202_FINAL_ASSIGNMENT\DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET RECOVERY FULL 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET  MULTI_USER 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI', N'ON'
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET QUERY_STORE = OFF
GO
/****** Object:  UserDefinedFunction [dbo].[GET_CUSTOMER_PAY_TIME]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GET_CUSTOMER_PAY_TIME] (@customerID CHAR(10)) RETURNS INT
AS
    BEGIN
        DECLARE @numberOfPayTime INT;

        SELECT @numberOfPayTime = COUNT(invoiceNo)
        FROM tblInvoices
        WHERE customerID = @customerID
        GROUP BY customerID;

        RETURN @numberOfPayTime;
    END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_NUMBER_OF_SERVING_TIME_OF_STAFF]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GET_NUMBER_OF_SERVING_TIME_OF_STAFF] (@staffID CHAR(10)) RETURNS INT
AS
    BEGIN
        DECLARE @numberOfServingTime INT;

        SELECT @numberOfServingTime = COUNT(invoiceNo)
        FROM tblInvoices
        WHERE issuedStaffID = @staffID
        GROUP BY issuedStaffID;

        RETURN @numberOfServingTime;
    END
GO
/****** Object:  Table [dbo].[tblBatches]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBatches](
	[batchCode] [char](10) NOT NULL,
	[importDate] [date] NOT NULL,
 CONSTRAINT [PK_BATCH] PRIMARY KEY CLUSTERED 
(
	[batchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[customerID] [char](10) NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[customerPhone] [char](11) NOT NULL,
	[customerGender] [bit] NULL,
	[customerSocialCode] [char](12) NULL,
	[customerAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoiceDetails]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoiceDetails](
	[invoiceNo] [char](10) NOT NULL,
	[productID] [char](15) NOT NULL,
	[paidQuantity] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_INVOICE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[invoiceNo] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoices]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoices](
	[invoiceNo] [char](10) NOT NULL,
	[customerID] [char](10) NOT NULL,
	[issuedStaffID] [char](10) NOT NULL,
	[issuedDate] [datetime] NOT NULL,
	[methodID] [tinyint] NOT NULL,
	[specialOffer] [decimal](3, 2) NULL,
 CONSTRAINT [PK_INVOICE] PRIMARY KEY CLUSTERED 
(
	[invoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentMethod]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentMethod](
	[methodID] [tinyint] IDENTITY(1,1) NOT NULL,
	[methodName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_METHOD] PRIMARY KEY CLUSTERED 
(
	[methodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [char](15) NOT NULL,
	[productType] [nvarchar](40) NOT NULL,
	[productName] [nvarchar](40) NOT NULL,
	[manufacturer] [nvarchar](40) NOT NULL,
	[unitPrice] [decimal](8, 0) NOT NULL,
	[batchCode] [char](10) NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaffs]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaffs](
	[staffID] [char](10) NOT NULL,
	[staffName] [nvarchar](50) NOT NULL,
	[staffGender] [bit] NULL,
	[staffPhone] [char](11) NOT NULL,
	[staffSocialCode] [char](12) NULL,
 CONSTRAINT [PK_STAFF] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWarehouses]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWarehouses](
	[warehouseCode] [char](10) NOT NULL,
	[productID] [char](15) NOT NULL,
	[storedQuantity] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_WAREHOUSE] PRIMARY KEY CLUSTERED 
(
	[warehouseCode] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L01       ', CAST(N'2021-04-15' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L02       ', CAST(N'2021-04-28' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L03       ', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L04       ', CAST(N'2021-05-30' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L05       ', CAST(N'2021-06-06' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L06       ', CAST(N'2021-06-23' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L07       ', CAST(N'2021-07-19' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L08       ', CAST(N'2021-07-28' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L09       ', CAST(N'2022-09-20' AS Date))
INSERT [dbo].[tblBatches] ([batchCode], [importDate]) VALUES (N'L10       ', CAST(N'2022-10-15' AS Date))
GO
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH1    ', N'Trần Thị Tuyết Nhi', N'0904758666 ', 0, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH10   ', N'Lê Đức Duy', N'0877193009 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH11   ', N'Lê Thái Bảo', N'0877194009 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH12   ', N'Nguyễn Văn Sinh', N'0912002934 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH13   ', N'Hồ Đức Quang', N'0830499204 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH14   ', N'Lê Đức Duy', N'09200499304', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH15   ', N'Lê Đức Duy', N'0911223094 ', 1, N'201763533   ', NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH2    ', N'Nguyễn Hùng Dũng', N'0911234112 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH3    ', N'Thái Thành Trung', N'0903141524 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH4    ', N'Lê Huyền Anh', N'0124444123 ', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH5    ', N'Trần Quốc Trung', N'0800392094 ', 1, N'2018656333  ', NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH6    ', N'Hồ Cẩm Đào', N'07893993081', 0, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH7    ', N'Thái Hoàng Vũ', N'03451982948', 1, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH8    ', N'Nguyễn Thị Kim Liên', N'0902091039 ', 0, NULL, NULL)
INSERT [dbo].[tblCustomers] ([customerID], [customerName], [customerPhone], [customerGender], [customerSocialCode], [customerAddress]) VALUES (N'KHACH9    ', N'Hồ Hoàng Đạt', N'0937010830 ', 1, NULL, NULL)
GO
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO1       ', N'ENER1004708    ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO1       ', N'IP001101       ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO10      ', N'ANK122307      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO10      ', N'IP12PM02       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO11      ', N'IP012P02       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO12      ', N'IP012P02       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO13      ', N'ENER1004708    ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO13      ', N'IP11PM01       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO14      ', N'IP001302       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO14      ', N'IPADM608       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO15      ', N'IP001302       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO16      ', N'IP001302       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO16      ', N'IPADM608       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO17      ', N'IP012P02       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO17      ', N'IPADM608       ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO18      ', N'ENER1004708    ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO19      ', N'SAM12S22U04    ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO2       ', N'IP001202       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO2       ', N'IP001302       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO20      ', N'SAM12S22U04    ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO21      ', N'SAM12S2206     ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO22      ', N'XIA011L02      ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO23      ', N'ANK122407      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO23      ', N'XIA011L02      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO24      ', N'ANK122407      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO24      ', N'XIA011P03      ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO25      ', N'ANK122307      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO25      ', N'XIA011P03      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO26      ', N'SAMA5306       ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO3       ', N'ENER1004708    ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO3       ', N'SAM12S22U04    ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO3       ', N'SAMS7F08       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO4       ', N'XIA011P03      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO5       ', N'SAMA5306       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO5       ', N'SAMA7306       ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO6       ', N'XIA012P04      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO7       ', N'ANK122407      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO7       ', N'XIA012P04      ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO8       ', N'ANK122407      ', CAST(1 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO8       ', N'IP13PM03       ', CAST(2 AS Decimal(4, 0)))
INSERT [dbo].[tblInvoiceDetails] ([invoiceNo], [productID], [paidQuantity]) VALUES (N'NO9       ', N'IP13PM03       ', CAST(2 AS Decimal(4, 0)))
GO
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO1       ', N'KHACH1    ', N'NV01      ', CAST(N'2021-09-07T08:45:00.000' AS DateTime), 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO10      ', N'KHACH9    ', N'NV07      ', CAST(N'2021-09-23T09:20:00.000' AS DateTime), 3, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO11      ', N'KHACH10   ', N'NV08      ', CAST(N'2021-09-25T09:20:00.000' AS DateTime), 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO12      ', N'KHACH4    ', N'NV09      ', CAST(N'2021-10-03T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO13      ', N'KHACH5    ', N'NV10      ', CAST(N'2021-10-05T09:20:00.000' AS DateTime), 4, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO14      ', N'KHACH6    ', N'NV01      ', CAST(N'2021-10-07T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO15      ', N'KHACH8    ', N'NV02      ', CAST(N'2021-10-07T10:20:00.000' AS DateTime), 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO16      ', N'KHACH10   ', N'NV01      ', CAST(N'2021-10-07T15:20:00.000' AS DateTime), 1, CAST(0.05 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO17      ', N'KHACH12   ', N'NV03      ', CAST(N'2021-10-10T09:20:00.000' AS DateTime), 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO18      ', N'KHACH13   ', N'NV04      ', CAST(N'2021-10-11T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO19      ', N'KHACH12   ', N'NV06      ', CAST(N'2021-10-12T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO2       ', N'KHACH2    ', N'NV10      ', CAST(N'2021-09-12T08:35:00.000' AS DateTime), 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO20      ', N'KHACH14   ', N'NV07      ', CAST(N'2021-10-12T10:20:00.000' AS DateTime), 3, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO21      ', N'KHACH13   ', N'NV07      ', CAST(N'2021-10-13T09:20:00.000' AS DateTime), 3, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO22      ', N'KHACH14   ', N'NV08      ', CAST(N'2021-10-14T09:20:00.000' AS DateTime), 4, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO23      ', N'KHACH15   ', N'NV09      ', CAST(N'2022-05-12T09:20:00.000' AS DateTime), 5, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO24      ', N'KHACH15   ', N'NV10      ', CAST(N'2022-05-12T10:20:00.000' AS DateTime), 4, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO25      ', N'KHACH13   ', N'NV10      ', CAST(N'2022-05-15T09:40:00.000' AS DateTime), 4, CAST(0.05 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO26      ', N'KHACH11   ', N'NV06      ', CAST(N'2022-05-17T08:45:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO3       ', N'KHACH1    ', N'NV03      ', CAST(N'2021-09-12T09:00:00.000' AS DateTime), 2, CAST(0.05 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO4       ', N'KHACH3    ', N'NV01      ', CAST(N'2021-09-13T09:30:00.000' AS DateTime), 3, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO5       ', N'KHACH4    ', N'NV02      ', CAST(N'2021-09-13T10:00:00.000' AS DateTime), 4, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO6       ', N'KHACH5    ', N'NV03      ', CAST(N'2021-09-14T10:00:00.000' AS DateTime), 5, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO7       ', N'KHACH6    ', N'NV04      ', CAST(N'2021-09-17T09:20:00.000' AS DateTime), 3, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO8       ', N'KHACH7    ', N'NV05      ', CAST(N'2021-09-20T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[tblInvoices] ([invoiceNo], [customerID], [issuedStaffID], [issuedDate], [methodID], [specialOffer]) VALUES (N'NO9       ', N'KHACH8    ', N'NV06      ', CAST(N'2021-09-21T09:20:00.000' AS DateTime), 2, CAST(0.00 AS Decimal(3, 2)))
GO
SET IDENTITY_INSERT [dbo].[tblPaymentMethod] ON 

INSERT [dbo].[tblPaymentMethod] ([methodID], [methodName]) VALUES (1, N'CARD')
INSERT [dbo].[tblPaymentMethod] ([methodID], [methodName]) VALUES (2, N'IN CASH')
INSERT [dbo].[tblPaymentMethod] ([methodID], [methodName]) VALUES (5, N'INSTALLMENT')
INSERT [dbo].[tblPaymentMethod] ([methodID], [methodName]) VALUES (3, N'INTERNET BANKING')
INSERT [dbo].[tblPaymentMethod] ([methodID], [methodName]) VALUES (4, N'ONLINE')
SET IDENTITY_INSERT [dbo].[tblPaymentMethod] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'ANK122307      ', N'ACCESSORY', N'Anker PowerCore Select 10000mAh', N'Anker', CAST(670000 AS Decimal(8, 0)), N'L07       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'ANK122407      ', N'ACCESSORY', N'Anker PowerSlim 10000mAh', N'Anker', CAST(590000 AS Decimal(8, 0)), N'L07       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'ENER1004708    ', N'ACCESSORY', N'Energizer 3 cổng 2 USB-A 10000mAh', N'Energizer', CAST(650000 AS Decimal(8, 0)), N'L08       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP001101       ', N'PHONE', N'IPhone 11', N'Apple', CAST(11290000 AS Decimal(8, 0)), N'L01       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP001202       ', N'PHONE', N'IPhone 12', N'Apple', CAST(16390000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP001302       ', N'PHONE', N'IPhone 13', N'Apple', CAST(18090000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP001409       ', N'PHONE', N'IPhone 14', N'Apple', CAST(21900000 AS Decimal(8, 0)), N'L09       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP011P01       ', N'PHONE', N'IPhone 11 PRO', N'Apple', CAST(13490000 AS Decimal(8, 0)), N'L01       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP012P02       ', N'PHONE', N'IPhone 12 PRO', N'Apple', CAST(19000000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP014P09       ', N'PHONE', N'IPhone 14 PRO', N'Apple', CAST(29990000 AS Decimal(8, 0)), N'L09       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP11PM01       ', N'PHONE', N'IPhone 11 PROMAX', N'Apple', CAST(18900000 AS Decimal(8, 0)), N'L01       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP12PM02       ', N'PHONE', N'IPhone 12 PROMAX', N'Apple', CAST(25590000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP13PM03       ', N'PHONE', N'IPhone 13 PROMAX', N'Apple', CAST(28780000 AS Decimal(8, 0)), N'L03       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IP14PM10       ', N'PHONE', N'IPhone 14 PROMAX', N'Apple', CAST(32940000 AS Decimal(8, 0)), N'L10       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'IPADM608       ', N'TABLET', N'Ipad mini 6', N'Apple', CAST(12490000 AS Decimal(8, 0)), N'L08       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAM12S2206     ', N'PHONE', N'Samsung Galaxy S22', N'Samsung', CAST(17590000 AS Decimal(8, 0)), N'L06       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAM12S22P05    ', N'PHONE', N'Samsung Galaxy S22 PLUS', N'Samsung', CAST(21290000 AS Decimal(8, 0)), N'L05       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAM12S22U04    ', N'PHONE', N'Samsung Galaxy S22 ULTRA', N'Samsung', CAST(24990000 AS Decimal(8, 0)), N'L04       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAMA3306       ', N'PHONE', N'Samsung Galaxy A33', N'Samsung', CAST(6900000 AS Decimal(8, 0)), N'L06       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAMA5306       ', N'PHONE', N'Samsung Galaxy A53', N'Samsung', CAST(8050000 AS Decimal(8, 0)), N'L06       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAMA7306       ', N'PHONE', N'Samsung Galaxy A73', N'Samsung', CAST(10090000 AS Decimal(8, 0)), N'L06       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'SAMS7F08       ', N'TABLET', N'Samsung Galaxy Tab S7 FE', N'Samsung', CAST(1230000 AS Decimal(8, 0)), N'L08       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA01102       ', N'PHONE', N'Xiaomi 11', N'Xiaomi', CAST(14590000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA011L02      ', N'PHONE', N'Xiaomi 11 LITE', N'Xiaomi', CAST(9490000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA011P03      ', N'PHONE', N'Xiaomi 11T PRO', N'Xiaomi', CAST(14590000 AS Decimal(8, 0)), N'L03       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA011T02      ', N'PHONE', N'Xiaomi 11T', N'Xiaomi', CAST(13590000 AS Decimal(8, 0)), N'L02       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA01203       ', N'PHONE', N'Xiaomi 12', N'Xiaomi', CAST(16190000 AS Decimal(8, 0)), N'L03       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA012P04      ', N'PHONE', N'Xiaomi 12 PRO', N'Xiaomi', CAST(22390000 AS Decimal(8, 0)), N'L04       ')
INSERT [dbo].[tblProducts] ([productID], [productType], [productName], [manufacturer], [unitPrice], [batchCode]) VALUES (N'XIA012T03      ', N'PHONE', N'Xiaomi 12T', N'Xiaomi', CAST(16990000 AS Decimal(8, 0)), N'L03       ')
GO
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV01      ', N'Nguyễn Văn A', 1, N'0919222903 ', N'2123456789  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV02      ', N'Lê Trung Tín', 1, N'0933222913 ', N'2123555555  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV03      ', N'Hà Thị Thu Thảo', 0, N'0986444589 ', N'2123607888  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV04      ', N'Nguyễn Trung Quân', 1, N'094622564  ', N'2121889163  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV05      ', N'Hồ Thị Bảo Nguyên', 0, N'0973123123 ', N'2872373411  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV06      ', N'Trần Khả Hân', 0, N'0977665506 ', N'2014646330  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV07      ', N'Nguyễn Thanh Trung', 1, N'0977666513 ', N'2181341346  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV08      ', N'Lê Hà Anh', 1, N'0997643496 ', N'2001149746  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV09      ', N'Nguyễn Văn Hoàng', 1, N'0974616499 ', N'2153555601  ')
INSERT [dbo].[tblStaffs] ([staffID], [staffName], [staffGender], [staffPhone], [staffSocialCode]) VALUES (N'NV10      ', N'Thái Bảo Đạt', 1, N'0988666523 ', N'2016886116  ')
GO
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP001101       ', CAST(78 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP001202       ', CAST(79 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP001302       ', CAST(46 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP001409       ', CAST(90 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP011P01       ', CAST(80 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP012P02       ', CAST(72 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP11PM01       ', CAST(79 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP12PM02       ', CAST(59 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO1      ', N'IP13PM03       ', CAST(46 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'IP014P09       ', CAST(100 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'IP14PM10       ', CAST(80 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'SAM12S22U04    ', CAST(41 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA01102       ', CAST(50 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA011L02      ', CAST(37 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA011P03      ', CAST(46 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA011T02      ', CAST(40 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA01203       ', CAST(60 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA012P04      ', CAST(47 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO2      ', N'XIA012T03      ', CAST(50 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'ANK122307      ', CAST(98 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'ANK122407      ', CAST(96 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'ENER1004708    ', CAST(144 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'IPADM608       ', CAST(56 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAM12S2206     ', CAST(79 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAM12S22P05    ', CAST(80 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAMA3306       ', CAST(60 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAMA5306       ', CAST(57 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAMA7306       ', CAST(59 AS Decimal(4, 0)))
INSERT [dbo].[tblWarehouses] ([warehouseCode], [productID], [storedQuantity]) VALUES (N'KHO3      ', N'SAMS7F08       ', CAST(59 AS Decimal(4, 0)))
GO
/****** Object:  Index [UQ__tblBatch__3F8AB21A2B6AF92B]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblBatches] ADD UNIQUE NONCLUSTERED 
(
	[importDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCusto__311068C48E0DBA05]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblCustomers] ADD UNIQUE NONCLUSTERED 
(
	[customerPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tblInvoi__BBD8D1CDA2ABE368]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblInvoices] ADD UNIQUE NONCLUSTERED 
(
	[issuedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblPayme__DF66BADD9A9AD88F]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblPaymentMethod] ADD UNIQUE NONCLUSTERED 
(
	[methodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblStaff__55FF6B6BD48EDF95]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblStaffs] ADD UNIQUE NONCLUSTERED 
(
	[staffSocialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblStaff__61496E387C438CBD]    Script Date: 11/5/2022 9:47:42 PM ******/
ALTER TABLE [dbo].[tblStaffs] ADD UNIQUE NONCLUSTERED 
(
	[staffPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblInvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_DETAIL_INVOICE] FOREIGN KEY([invoiceNo])
REFERENCES [dbo].[tblInvoices] ([invoiceNo])
GO
ALTER TABLE [dbo].[tblInvoiceDetails] CHECK CONSTRAINT [FK_DETAIL_INVOICE]
GO
ALTER TABLE [dbo].[tblInvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_DETAIL_PRODUCT] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblInvoiceDetails] CHECK CONSTRAINT [FK_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[tblInvoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_CUSTOMER] FOREIGN KEY([customerID])
REFERENCES [dbo].[tblCustomers] ([customerID])
GO
ALTER TABLE [dbo].[tblInvoices] CHECK CONSTRAINT [FK_INVOICE_CUSTOMER]
GO
ALTER TABLE [dbo].[tblInvoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_PAYMENTMETHOD] FOREIGN KEY([methodID])
REFERENCES [dbo].[tblPaymentMethod] ([methodID])
GO
ALTER TABLE [dbo].[tblInvoices] CHECK CONSTRAINT [FK_INVOICE_PAYMENTMETHOD]
GO
ALTER TABLE [dbo].[tblInvoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_STAFF] FOREIGN KEY([issuedStaffID])
REFERENCES [dbo].[tblStaffs] ([staffID])
GO
ALTER TABLE [dbo].[tblInvoices] CHECK CONSTRAINT [FK_INVOICE_STAFF]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_BATCH] FOREIGN KEY([batchCode])
REFERENCES [dbo].[tblBatches] ([batchCode])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_PRODUCT_BATCH]
GO
ALTER TABLE [dbo].[tblWarehouses]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSE_PRODUCT] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblWarehouses] CHECK CONSTRAINT [FK_WAREHOUSE_PRODUCT]
GO
ALTER TABLE [dbo].[tblInvoiceDetails]  WITH CHECK ADD  CONSTRAINT [CHECK_QUANITY] CHECK  (([paidQuantity]>(0)))
GO
ALTER TABLE [dbo].[tblInvoiceDetails] CHECK CONSTRAINT [CHECK_QUANITY]
GO
ALTER TABLE [dbo].[tblWarehouses]  WITH CHECK ADD  CONSTRAINT [CHECK_STORED_QUANTITY] CHECK  (([storedQuantity]>(0)))
GO
ALTER TABLE [dbo].[tblWarehouses] CHECK CONSTRAINT [CHECK_STORED_QUANTITY]
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_CUSTOMER_BUY_IN_DAY]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_CUSTOMER_BUY_IN_DAY] (@date DATE)
AS
    SELECT  c.customerID,
            c.customerName,
            p.productName,
            p.unitPrice,
            i.paidQuantity,
            (p.unitPrice * i.paidQuantity) AS N'thành tiền'
    FROM tblProducts p, tblInvoiceDetails i, tblInvoices inv, tblCustomers c
    WHERE i.productID = p.productID 
    AND inv.customerID = c.customerID
    AND i.invoiceNo = inv.invoiceNo 
    AND CAST(inv.issuedDate AS DATE) = @date
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_CUSTOMER_INFO]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_CUSTOMER_INFO] (@customerID CHAR(10))
AS
    SELECT *
    FROM tblCustomers
    WHERE customerID = @customerID;
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_PRODUCT_BUY_IN_DAY]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_PRODUCT_BUY_IN_DAY] (@date DATE)
AS
    SELECT  p.productID, 
            p.productName,
            SUM(paidQuantity) AS N'số lượng bán ra'
    FROM tblProducts p, tblInvoiceDetails i, tblInvoices inv
    WHERE i.productID = p.productID AND i.invoiceNo = inv.invoiceNo AND CAST(inv.issuedDate AS DATE) = @date
    GROUP BY p.productID, p.productName
    ORDER BY SUM(paidQuantity) DESC
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_PRODUCT_INFO]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_PRODUCT_INFO] (@productID CHAR(15))
AS
    SELECT  p.productID, 
            p.productName,
            p.productType, 
            p.manufacturer, 
            p.batchCode,
            p.unitPrice,
            w.storedQuantity,
            CONVERT(nvarchar ,b.importDate, 103) AS 'import date'
    FROM tblProducts p, tblWarehouses w, tblBatches b
    WHERE p.productID = @productID AND p.productID = w.productID AND p.batchCode = b.batchCode
GO
/****** Object:  StoredProcedure [dbo].[GET_CUSTOMER_WITH_SAME_PAYMENT_METHOD]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_CUSTOMER_WITH_SAME_PAYMENT_METHOD](@methodID TINYINT)
AS
    SELECT C.customerID, c.customerName, pay.methodName
    FROM tblInvoices i, tblPaymentMethod pay, tblCustomers c
    WHERE i.customerID = c.customerID AND pay.methodID = i.methodID AND pay.methodID = @methodID
GO
/****** Object:  StoredProcedure [dbo].[GET_LIST_OF_PRODUCT_TYPE]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_LIST_OF_PRODUCT_TYPE]
AS
    SELECT DISTINCT productType
    FROM tblProducts
GO
/****** Object:  StoredProcedure [dbo].[GET_PRODUCT_WITH_SAME_MANUFACTURER]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_PRODUCT_WITH_SAME_MANUFACTURER] (@manufacturer NVARCHAR(40))
AS
    SELECT  p.productID, 
            p.productName,
            p.productType,
            p.batchCode,
            p.unitPrice,
            w.storedQuantity
    FROM tblProducts p, tblWarehouses w, tblBatches b
    WHERE p.productID = w.productID AND p.batchCode = b.batchCode AND p.manufacturer = @manufacturer
GO
/****** Object:  StoredProcedure [dbo].[GET_TOP_N_SALE_PRODUCT]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TOP_N_SALE_PRODUCT] (@number INT)
AS
    SELECT
        i.productID, 
        p.productName, 
        SUM(paidQuantity) AS N'số lượng bán'
    FROM tblInvoiceDetails I, tblProducts p
    WHERE I.productID = p.productID
    GROUP BY i.productID, p.productName
    ORDER BY SUM(paidQuantity) DESC
    OFFSET 0 ROW
    FETCH NEXT @number ROWS ONLY
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PRODUCT_PRICE]    Script Date: 11/5/2022 9:47:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_PRODUCT_PRICE] (@productID CHAR(15), @newPrice DECIMAL(8,0))
AS
    UPDATE tblProducts
    SET unitPrice = @newPrice
    WHERE productID = @productID
GO
ALTER DATABASE [DBI202_QUAN_LY_CUA_HANG_DIEN_THOAI] SET  READ_WRITE 
GO
