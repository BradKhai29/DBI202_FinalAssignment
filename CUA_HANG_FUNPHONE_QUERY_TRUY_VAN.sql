/* Hiện thị đầy đủ thông tin của các hóa đơn hiện tại */
SELECT  I.invoiceNo AS N'mã hóa đơn', 
        P.productName AS N'tên mặt hàng', 
        i.paidQuantity AS N'số lượng', 
        p.unitPrice AS N'đơn giá', 
        I.paidQuantity * P.unitPrice AS N'Thành tiền'
FROM tblInvoiceDetails I, tblProducts P
WHERE I.productID = P.productID
ORDER BY invoiceNo

/* Hiển thị tổng tiền của từng hóa đơn */
SELECT  I.invoiceNo AS N'mã hóa đơn', 
        SUM(I.paidQuantity * P.unitPrice) AS N'Tổng tiền'
FROM tblInvoiceDetails I, tblProducts P
WHERE I.productID = P.productID
GROUP BY invoiceNo
ORDER BY invoiceNo

/* In ra top 3 sản phẩm bán chạy nhất của cửa hàng */
SELECT TOP 3
    i.productID, p.productName, SUM(paidQuantity) AS N'số lượng bán'
FROM tblInvoiceDetails I, tblProducts p
WHERE I.productID = p.productID
GROUP BY i.productID, p.productName
ORDER BY SUM(paidQuantity) DESC