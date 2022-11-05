/* TRIGGER SẼ BAO GỒM:
    + KHI CẬP NHẬT BÊN BẢNG HÓA ĐƠN THÌ SỐ LƯỢNG HÀNG CÒN TRONG KHO SẼ GIẢM THEO
    + CÙNG KHÁCH HÀNG THÌ HÓA ĐƠN SAU PHẢI CÓ NGÀY NHẬP ĐƠN LỚN HƠN NGÀY NHẬP ĐƠN TRC
    + NẾU KHÁCH HÀNG LỰA CHỌN PHƯƠNG THỨC THANH TOÁN LÀ TRẢ GÓP (INSTALLMENT) THÌ KHÁCH PHẢI CUNG CẤP
    THÔNG TIN VỀ CMND
 */

CREATE TRIGGER UPDATE_SO_LUONG_TRONG_KHO ON tblInvoices FOR UPDATE, INSERT, DELETE
AS
    BEGIN
    DECLARE @paidProductID CHAR(15), @paidAmount DECIMAL(4,0);
    DECLARE @deleteProductID CHAR(15), @deleteAmount DECIMAL(4,0);

    SELECT  @paidProductID = productID,
            @paidAmount = paidQuantity
    FROM inserted;

    SELECT  @deleteProductID = productID,
            @deleteAmount = paidQuantity
    FROM deleted;

    DECLARE @remainedAmount DECIMAL(4,0);

    
    BEGIN
        UPDATE tblWarehouses
        SET storedQuantity = storedQuantity - @paidAmount, @remainedAmount = storedQuantity
        WHERE productID = @paidProductID;
    END

    IF(@deleteAmount > 0)
    BEGIN
        UPDATE tblWarehouses
        SET storedQuantity = storedQuantity + @deleteAmount
        WHERE productID = @deleteProductID;
    END

    IF(@remainedAmount < 0)
        BEGIN
            RAISERROR(N'SỐ LƯỢNG HÀNG CÒN TRONG KHO KHÔNG ĐỦ HOẶC ĐÃ HẾT', 16, 1);
            ROLLBACK;
        END
    END
GO

CREATE TRIGGER CHECK_ISSUED_DATE ON tblInvoices FOR INSERT
AS
    BEGIN
        DECLARE @customerID CHAR(10),
                @insertIssuedDate DATETIME,
                @insertInvoiceNo CHAR(10);

        DECLARE @mostRecentDate DATETIME;

        SELECT  @customerID = customerID,
                @insertIssuedDate = issuedDate,
                @insertInvoiceNo = invoiceNo
        FROM inserted;

        SELECT @mostRecentDate = MAX(issuedDate)
        FROM tblInvoices
        WHERE customerID = @customerID AND (invoiceNo != @insertInvoiceNo)
        GROUP BY customerID

        IF(@mostRecentDate > @insertIssuedDate)
            BEGIN
                RAISERROR(N'NGÀY XUẤT HÓA ĐƠN KHÔNG HỢP LỆ, PHẢI LỚN HƠN LẦN MUA GẦN NHẤT CỦA KHÁCH HÀNG', 16, 1);
                ROLLBACK;
            END
    END
GO

CREATE TRIGGER CHECK_INSTALLMENT ON tblInvoices FOR INSERT, UPDATE
AS
    BEGIN
        DECLARE @customerID CHAR(10),
                @methodID   TINYINT,
                @methodName NVARCHAR(20),
                @CMND CHAR(12);


        SELECT  @customerID = customerID,
                @methodID = methodID
        FROM inserted;  

        SELECT @methodName = methodName
        FROM tblPaymentMethod
        WHERE methodID = @methodID;

        SELECT @CMND = customerSocialCode
        FROM tblCustomers
        WHERE customerID = @customerID;


        IF(@methodName = 'INSTALLMENT' AND @CMND IS NULL)
            BEGIN
            RAISERROR(N'KHÁCH HÀNG CHỈ ĐƯỢC MUA TRẢ GÓP KHI CÓ CMND', 16, 1);
            ROLLBACK
            END
    END
GO