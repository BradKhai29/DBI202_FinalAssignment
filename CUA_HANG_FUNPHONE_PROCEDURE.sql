CREATE PROCEDURE GET_CUSTOMER_WITH_SAME_PAYMENT_METHOD (@methodID TINYINT)
AS
    SELECT C.customerID, c.customerName, pay.methodName
    FROM tblInvoices i, tblPaymentMethod pay, tblCustomers c
    WHERE i.customerID = c.customerID AND pay.methodID = i.methodID AND pay.methodID = @methodID
GO


CREATE PROCEDURE DISPLAY_CUSTOMER_INFO (@customerID CHAR(10))
AS
    SELECT *
    FROM tblCustomers
    WHERE customerID = @customerID;
GO


CREATE PROCEDURE DISPLAY_PRODUCT_INFO (@productID CHAR(15))
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

CREATE PROCEDURE UPDATE_PRODUCT_PRICE (@productID CHAR(15), @newPrice DECIMAL(8,0))
AS
    UPDATE tblProducts
    SET unitPrice = @newPrice
    WHERE productID = @productID
GO

CREATE PROCEDURE GET_PRODUCT_WITH_SAME_MANUFACTURER (@manufacturer NVARCHAR(40))
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

/* Thống kê những sản phẩm đã bán trong ngày cùng với số lượng bán ra */
CREATE PROCEDURE DISPLAY_PRODUCT_BUY_IN_DAY (@date DATE)
AS
    SELECT  p.productID, 
            p.productName,
            SUM(paidQuantity) AS N'số lượng bán ra'
    FROM tblProducts p, tblInvoiceDetails i, tblInvoices inv
    WHERE i.productID = p.productID AND i.invoiceNo = inv.invoiceNo AND CAST(inv.issuedDate AS DATE) = @date
    GROUP BY p.productID, p.productName
    ORDER BY SUM(paidQuantity) DESC
GO


/* Thống kê những khách hàng đã mua trong ngày cùng với tổng tiền hóa đơn*/
CREATE PROCEDURE DISPLAY_CUSTOMER_BUY_IN_DAY (@date DATE)
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

CREATE PROCEDURE GET_LIST_OF_PRODUCT_TYPE
AS
    SELECT DISTINCT productType
    FROM tblProducts
GO

CREATE PROCEDURE GET_TOP_N_SALE_PRODUCT (@number INT)
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

CREATE FUNCTION GET_CUSTOMER_PAY_TIME (@customerID CHAR(10)) RETURNS INT
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


CREATE FUNCTION GET_NUMBER_OF_SERVING_TIME_OF_STAFF (@staffID CHAR(10)) RETURNS INT
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