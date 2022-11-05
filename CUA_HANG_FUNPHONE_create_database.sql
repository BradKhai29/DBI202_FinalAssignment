/* Hiển thị mức ưu đãi khuyến mãi theo phần trăm dưới dạng số thập phân
VD: 75% = 0.75       hoặc là     90% = 0.9        
> Gender has 2 types: male (1) and female (0) 
> PaymentMethod has 4 types: CARD (1), INCASH (2), INTERNET_BANKING (3), ONLINE (4) ,INSTALLMENT (5) */
/* productType will have 3 types: PHONE, TABLET, ACCESSORY */

/* Create database relations section */

CREATE TABLE [dbo].[tblBatches]
(
    batchCode CHAR(10) CONSTRAINT PK_BATCH PRIMARY KEY,
    importDate DATE UNIQUE NOT NULL
)
GO

CREATE TABLE [dbo].[tblProducts]
(
    productID CHAR(15) CONSTRAINT PK_PRODUCT PRIMARY KEY,
    productType NVARCHAR(40) NOT NULL,
    productName NVARCHAR(40) NOT NULL,
    manufacturer NVARCHAR(40) NOT NULL, 
    unitPrice DECIMAL(8,0) NOT NULL,
    batchCode CHAR(10) NOT NULL,
    CONSTRAINT FK_PRODUCT_BATCH FOREIGN KEY(batchCode) REFERENCES tblBatches(batchCode)
)
GO

CREATE TABLE [dbo].[tblWarehouses]
(
    warehouseCode CHAR(10) NOT NULL,
    productID CHAR(15) NOT NULL,
    storedQuantity DECIMAL(4, 0) NOT NULL,
    CONSTRAINT PK_WAREHOUSE PRIMARY KEY (warehouseCode, productID),
    CONSTRAINT FK_WAREHOUSE_PRODUCT FOREIGN KEY(productID) REFERENCES tblProducts(productID),
    CONSTRAINT CHECK_STORED_QUANTITY CHECK (storedQuantity > 0)
)
GO

CREATE TABLE [dbo].[tblStaffs]
(
    staffID CHAR(10) NOT NULL,
    staffName NVARCHAR(50) NOT NULL, 
    staffGender BIT NULL, 
    staffPhone CHAR(11) UNIQUE NOT NULL, 
    staffSocialCode CHAR(12) UNIQUE NULL, 
    CONSTRAINT PK_STAFF PRIMARY KEY(staffID)
)
GO

CREATE TABLE [dbo].[tblCustomers]
(
    customerID CHAR(10) NOT NULL,
    customerName NVARCHAR(50) NOT NULL,
    customerPhone CHAR(11) UNIQUE NOT NULL, 
    customerGender BIT NULL, 
    customerSocialCode CHAR(12) NULL, 
    customerAddress NVARCHAR(50) NULL,
    CONSTRAINT PK_CUSTOMER PRIMARY KEY(customerID)
)
GO

CREATE TABLE [dbo].[tblPaymentMethod]
(
    methodID TINYINT IDENTITY(1,1) NOT NULL,
    methodName NVARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT PK_METHOD PRIMARY KEY(methodID)
)
GO

CREATE TABLE [dbo].[tblInvoices]
(
    invoiceNo CHAR(10) CONSTRAINT PK_INVOICE PRIMARY KEY, 
    customerID CHAR(10) NOT NULL,
    issuedStaffID CHAR(10) NOT NULL, 
    issuedDate DATETIME UNIQUE NOT NULL, 
    methodID TINYINT NOT NULL,
    specialOffer DECIMAL(3,2) NULL,
    CONSTRAINT FK_INVOICE_CUSTOMER FOREIGN KEY(customerID) REFERENCES tblCustomers(customerID),
    CONSTRAINT FK_INVOICE_STAFF FOREIGN KEY(issuedStaffID) REFERENCES tblStaffs(staffID),
    CONSTRAINT FK_INVOICE_PAYMENTMETHOD FOREIGN KEY(methodID) REFERENCES tblPaymentMethod(methodID)
)
GO

CREATE TABLE [dbo].[tblInvoiceDetails]
(
    invoiceNo CHAR(10) NOT NULL, 
    productID CHAR(15) NOT NULL,
    paidQuantity DECIMAL(4,0) NOT NULL,
    CONSTRAINT PK_INVOICE_DETAIL PRIMARY KEY(invoiceNo, productID),
    CONSTRAINT FK_DETAIL_INVOICE FOREIGN KEY(invoiceNo) REFERENCES tblInvoices(invoiceNo),
    CONSTRAINT FK_DETAIL_PRODUCT FOREIGN KEY(productID) REFERENCES tblProducts(productID),
    CONSTRAINT CHECK_QUANITY CHECK (paidQuantity > 0)
)
GO

/* Constraints section */

/* DROP TABLE tblInvoiceDetails
DROP TABLE tblInvoices
DROP TABLE tblPaymentMethod
DROP TABLE tblStaffs
DROP TABLE tblCustomers
DROP TABLE tblWarehouses
DROP TABLE tblProducts
DROP TABLE tblBatches */


-- DELETE tblBatches
INSERT INTO [dbo].[tblBatches]
VALUES
    ('L01', '2021/04/15'),
    ('L02', '2021/04/28'),
    ('L03', '2021/05/15'),
    ('L04', '2021/05/30'),
    ('L05', '2021/06/06'),
    ('L06', '2021/06/23'),
    ('L07', '2021/07/19'),
    ('L08', '2021/07/28'),
    ('L09', '2022/09/20'),
    ('L10', '2022/10/25')
GO

-- DELETE tblProducts
INSERT INTO tblProducts
VALUES 
    ('IP001101', 'PHONE', 'IPhone 11', 'Apple', CAST(11290000 AS DECIMAL(8, 0)), 'L01'),
    ('IP011P01', 'PHONE', 'IPhone 11 PRO', 'Apple', CAST(13490000 AS DECIMAL(8, 0)), 'L01'),
    ('IP11PM01', 'PHONE', 'IPhone 11 PROMAX', 'Apple', CAST(18900000 AS DECIMAL(8, 0)), 'L01'),
    ('IP001202', 'PHONE', 'IPhone 12', 'Apple', CAST(16390000 AS DECIMAL(8, 0)), 'L02'),
    ('IP012P02', 'PHONE', 'IPhone 12 PRO', 'Apple', CAST(19000000 AS DECIMAL(8, 0)), 'L02'),
    ('IP12PM02', 'PHONE', 'IPhone 12 PROMAX', 'Apple', CAST(25590000 AS DECIMAL(8, 0)), 'L02'),
    ('IP001302', 'PHONE', 'IPhone 13', 'Apple', CAST(18090000 AS DECIMAL(8, 0)), 'L02'),
    ('IP13PM03', 'PHONE', 'IPhone 13 PROMAX', 'Apple', CAST(28780000 AS DECIMAL(8, 0)), 'L03'),
    ('IP001409', 'PHONE', 'IPhone 14', 'Apple', CAST(21900000 AS DECIMAL(8, 0)), 'L10'),
    ('IP014P09', 'PHONE', 'IPhone 14 PRO', 'Apple', CAST(29990000 AS DECIMAL(8, 0)), 'L10'),
    ('IP14PM10', 'PHONE', 'IPhone 14 PROMAX', 'Apple', CAST(32940000 AS DECIMAL(8, 0)), 'L10'),
    ('XIA01102', 'PHONE', 'Xiaomi 11', 'Xiaomi', CAST(14590000  AS DECIMAL(8, 0)), 'L02'),
    ('XIA011L02', 'PHONE', 'Xiaomi 11 LITE', 'Xiaomi', CAST(9490000 AS DECIMAL(8, 0)), 'L02'),
    ('XIA011T02', 'PHONE', 'Xiaomi 11T', 'Xiaomi', CAST(13590000 AS DECIMAL(8, 0)), 'L02'),
    ('XIA011P03', 'PHONE', 'Xiaomi 11T PRO', 'Xiaomi', CAST(14590000 AS DECIMAL(8, 0)), 'L03'),
    ('XIA01203', 'PHONE', 'Xiaomi 12', 'Xiaomi', CAST(16190000 AS DECIMAL(8, 0)), 'L03'),
    ('XIA012T03', 'PHONE', 'Xiaomi 12T', 'Xiaomi', CAST(16990000 AS DECIMAL(8, 0)), 'L03'),
    ('XIA012P04', 'PHONE', 'Xiaomi 12 PRO', 'Xiaomi', CAST(22390000 AS DECIMAL(8, 0)), 'L04'),
    ('SAM12S22U04', 'PHONE', 'Samsung Galaxy S22 ULTRA', 'Samsung', CAST(24990000 AS DECIMAL(8, 0)), 'L04'),
    ('SAM12S22P05', 'PHONE', 'Samsung Galaxy S22 PLUS', 'Samsung', CAST(21290000 AS DECIMAL(8, 0)), 'L05'),
    ('SAM12S2206', 'PHONE', 'Samsung Galaxy S22', 'Samsung', CAST(17590000 AS DECIMAL(8, 0)), 'L06'),
    ('SAMA7306', 'PHONE', 'Samsung Galaxy A73', 'Samsung', CAST(10090000 AS DECIMAL(8, 0)), 'L06'),
    ('SAMA5306', 'PHONE', 'Samsung Galaxy A53', 'Samsung', CAST(8050000 AS DECIMAL(8, 0)), 'L06'),
    ('SAMA3306', 'PHONE', 'Samsung Galaxy A33', 'Samsung', CAST(6900000 AS DECIMAL(8, 0)), 'L06'),
    ('ANK122307', 'ACCESSORY', 'Anker PowerCore Select 10000mAh', 'Anker', CAST(670000 AS DECIMAL(8, 0)), 'L07'),
    ('ANK122407', 'ACCESSORY', 'Anker PowerSlim 10000mAh', 'Anker', CAST(590000 AS DECIMAL(8, 0)), 'L07'),
    ('ENER1004708', 'ACCESSORY', N'Energizer 3 cổng 2 USB-A 10000mAh', 'Energizer', CAST(650000 AS DECIMAL(8, 0)), 'L08'),
    ('IPADM608', 'TABLET', 'Ipad mini 6', 'Apple', CAST(12490000 AS DECIMAL(8, 0)), 'L08'),
    ('SAMS7F08', 'TABLET', 'Samsung Galaxy Tab S7 FE', 'Samsung', CAST(1230000 AS DECIMAL(8, 0)), 'L08')
GO

-- DELETE tblWarehouses
INSERT INTO tblWarehouses
VALUES
    ('KHO1', 'IP001101', CAST(80 AS DECIMAL(4, 0))),
    ('KHO1', 'IP011P01', CAST(80 AS DECIMAL(4, 0))),
    ('KHO1', 'IP11PM01', CAST(80 AS DECIMAL(4, 0))),
    ('KHO1', 'IP001202', CAST(80 AS DECIMAL(4, 0))),
    ('KHO1', 'IP012P02', CAST(75 AS DECIMAL(4, 0))),
    ('KHO1', 'IP12PM02', CAST(60 AS DECIMAL(4, 0))),
    ('KHO1', 'IP001302', CAST(50 AS DECIMAL(4, 0))),
    ('KHO1', 'IP13PM03', CAST(50 AS DECIMAL(4, 0))),
    ('KHO1', 'IP001409', CAST(90 AS DECIMAL(4, 0))),
    ('KHO2', 'IP014P09', CAST(100 AS DECIMAL(4, 0))),
    ('KHO2', 'IP14PM10', CAST(80 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA01102', CAST(50 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA011L02', CAST(40 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA011T02', CAST(40 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA011P03', CAST(50 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA01203', CAST(60 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA012T03', CAST(50 AS DECIMAL(4, 0))),
    ('KHO2', 'XIA012P04', CAST(50 AS DECIMAL(4, 0))),
    ('KHO2', 'SAM12S22U04',CAST(45 AS DECIMAL(4, 0))),
    ('KHO3', 'SAM12S22P05',CAST(80 AS DECIMAL(4, 0))),
    ('KHO3', 'SAM12S2206', CAST(80 AS DECIMAL(4, 0))),
    ('KHO3', 'SAMA7306', CAST(60 AS DECIMAL(4, 0))),
    ('KHO3', 'SAMA5306', CAST(60 AS DECIMAL(4, 0))),
    ('KHO3', 'SAMA3306', CAST(60 AS DECIMAL(4, 0))),
    ('KHO3', 'ANK122307', CAST(100 AS DECIMAL(4, 0))),
    ('KHO3', 'ANK122407', CAST(100 AS DECIMAL(4, 0))),
    ('KHO3', 'ENER1004708', CAST(150 AS DECIMAL(4, 0))),
    ('KHO3', 'IPADM608', CAST(60 AS DECIMAL(4, 0))),
    ('KHO3', 'SAMS7F08', CAST(60 AS DECIMAL(4, 0)))
GO

-- DELETE tblStaffs
INSERT INTO tblStaffs
VALUES 
    ('NV01', N'Nguyễn Văn A', 1, '0919222903', '2123456789'),
    ('NV02', N'Lê Trung Tín', 1, '0933222913', '2123555555'),
    ('NV03', N'Hà Thị Thu Thảo', 0, '0986444589', '2123607888'),
    ('NV04', N'Nguyễn Trung Quân', 1, '094622564', '2121889163'),
    ('NV05', N'Hồ Thị Bảo Nguyên', 0, '0973123123', '2872373411'),
    ('NV06', N'Trần Khả Hân', 0, '0977665506', '2014646330'),
    ('NV07', N'Nguyễn Thanh Trung', 1, '0977666513', '2181341346'),
    ('NV08', N'Lê Hà Anh', 1, '0997643496', '2001149746'),
    ('NV09', N'Nguyễn Văn Hoàng', 1, '0974616499', '2153555601'),
    ('NV10', N'Thái Bảo Đạt', 1, '0988666523', '2016886116')
GO

-- DELETE tblCustomers
INSERT INTO tblCustomers
VALUES 
    ('KHACH1', N'Trần Thị Tuyết Nhi', '0904758666', 0, null, null),
    ('KHACH2', N'Nguyễn Hùng Dũng', '0911234112', 1, null, null),
    ('KHACH3', N'Thái Thành Trung', '0903141524', 1, null, null),
    ('KHACH4', N'Lê Huyền Anh', '0124444123', 1, null, null),
    ('KHACH5', N'Trần Quốc Trung', '0800392094', 1, '2018656333', null),
    ('KHACH6', N'Hồ Cẩm Đào', '07893993081', 0, null, null),
    ('KHACH7', N'Thái Hoàng Vũ', '03451982948', 1, null, null),
    ('KHACH8', N'Nguyễn Thị Kim Liên', '0902091039', 0, null, null),
    ('KHACH9', N'Hồ Hoàng Đạt', '0937010830', 1, null, null),
    ('KHACH10', N'Lê Đức Duy', '0877193009', 1, null, null),
    ('KHACH11', N'Lê Thái Bảo', '0877194009', 1, null, null),
    ('KHACH12', N'Nguyễn Văn Sinh', '0912002934', 1, null, null),
    ('KHACH13', N'Hồ Đức Quang', '0830499204', 1, null, null),
    ('KHACH14', N'Lê Đức Duy', '09200499304', 1, null, null),
    ('KHACH15', N'Lê Đức Duy', '0911223094', 1, '201763533', null)
GO

INSERT INTO tblPaymentMethod
VALUES 
    ('CARD'),
    ('IN CASH'),
    ('INTERNET BANKING'),
    ('ONLINE'),
    ('INSTALLMENT')
GO
    
-- DELETE tblInvoices
INSERT INTO tblInvoices
VALUES
    ('NO1', 'KHACH1', 'NV01', '2021/9/7 08:45:00', 1, 0),
    ('NO2', 'KHACH2', 'NV10', '2021/9/12 08:35:00', 1, 0),
    ('NO3', 'KHACH1', 'NV03', '2021/9/12 09:00:00', 2, CAST(0.05 AS DECIMAL(3,2))),
    ('NO4', 'KHACH3', 'NV01', '2021/9/13 09:30:00', 3, 0),
    ('NO5', 'KHACH4', 'NV02', '2021/9/13 10:00:00', 4, 0),
    ('NO6', 'KHACH5', 'NV03', '2021/9/14 10:00:00', 5, 0),
    ('NO7', 'KHACH6', 'NV04', '2021/9/17 09:20:00', 3, 0),
    ('NO8', 'KHACH7', 'NV05', '2021/9/20 09:20:00', 2, 0),
    ('NO9', 'KHACH8', 'NV06', '2021/9/21 09:20:00', 2, 0),
    ('NO10', 'KHACH9', 'NV07', '2021/9/23 09:20:00', 3, 0),
    ('NO11', 'KHACH10', 'NV08', '2021/9/25 09:20:00', 1, 0),
    ('NO12', 'KHACH4', 'NV09', '2021/10/3 09:20:00', 2, 0),
    ('NO13', 'KHACH5', 'NV10', '2021/10/5 09:20:00', 4, 0),
    ('NO14', 'KHACH6', 'NV01', '2021/10/7 09:20:00', 2, 0),
    ('NO15', 'KHACH8', 'NV02', '2021/10/7 10:20:00', 1, 0),
    ('NO16', 'KHACH10', 'NV01', '2021/10/7 15:20:00', 1, CAST(0.05 AS DECIMAL(3,2))),
    ('NO17', 'KHACH12', 'NV03', '2021/10/10 09:20:00', 1, 0),
    ('NO18', 'KHACH13', 'NV04', '2021/10/11 09:20:00', 2, 0),
    ('NO19', 'KHACH12', 'NV06', '2021/10/12 09:20:00', 2, 0),
    ('NO20', 'KHACH14', 'NV07', '2021/10/12 10:20:00', 3, 0),
    ('NO21', 'KHACH13', 'NV07', '2021/10/13 09:20:00', 3, 0),
    ('NO22', 'KHACH14', 'NV08', '2021/10/14 09:20:00', 4, 0),
    ('NO23', 'KHACH15', 'NV09', '2022/5/12 09:20:00', 5, 0),
    ('NO24', 'KHACH15', 'NV10', '2022/5/12 10:20:00', 4, 0),
    ('NO25', 'KHACH13', 'NV10', '2022/5/15 09:40:00', 4, CAST(0.05 AS DECIMAL(3,2))),
    ('NO26', 'KHACH11', 'NV06', '2022/5/17 08:45:00', 2, 0)
GO

-- DELETE tblInvoiceDetails
INSERT INTO tblInvoiceDetails VALUES    ('NO1', 'IP001101', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO1', 'ENER1004708', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO2', 'IP001202', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO2', 'IP001302', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO3', 'SAM12S22U04', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO3', 'SAMS7F08', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO3', 'ENER1004708', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO4', 'XIA011P03', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO5', 'SAMA7306', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO5', 'SAMA5306', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO6', 'XIA012P04', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO7', 'XIA012P04', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO7', 'ANK122407', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO8', 'IP13PM03', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO8', 'ANK122407', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO9', 'IP13PM03', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO10', 'IP12PM02', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO10', 'ANK122307', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO11', 'IP012P02', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO12', 'IP012P02', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO13', 'IP11PM01', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO13', 'ENER1004708', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO14', 'IPADM608', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO14', 'IP001302', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO15', 'IP001302', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO16', 'IP001302', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO16', 'IPADM608', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO17', 'IPADM608', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO17', 'IP012P02', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO18', 'ENER1004708', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO19', 'SAM12S22U04', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO20', 'SAM12S22U04', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO21', 'SAM12S2206', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO22', 'XIA011L02', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO23', 'XIA011L02', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO23', 'ANK122407', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO24', 'XIA011P03', 2)
INSERT INTO tblInvoiceDetails VALUES    ('NO24', 'ANK122407', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO25', 'XIA011P03', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO25', 'ANK122307', 1)
INSERT INTO tblInvoiceDetails VALUES    ('NO26', 'SAMA5306', 2)
