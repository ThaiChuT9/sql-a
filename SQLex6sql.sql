-- Create a new table called '[Customer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Customer]
(
    [CustomerID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    [Address] NVARCHAR(50) NOT NULL,
    [Phone] NVARCHAR(15) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Product]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL
DROP TABLE [dbo].[Product]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Product]
(
    [ProductID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [ProductName] NVARCHAR(150) NOT NULL,
    [Desc] NVARCHAR(500) NOT NULL,
    [Unit] INT,
    [Price] MONEY,
    [Status] NVARCHAR(50)
    -- Specify more columns here
);
GO

-- Create a new table called '[Orders]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Orders]', 'U') IS NOT NULL
DROP TABLE [dbo].[Orders]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Orders]
(
    [OrderID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [CustomerID] INT FOREIGN KEY REFERENCES Customer(CustomerID),
    [OrderDate] DATE NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[OrderDetail]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[OrderDetail]', 'U') IS NOT NULL
DROP TABLE [dbo].[OrderDetail]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[OrderDetail]
(
    [OrderDetailID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [OrderID] INT FOREIGN KEY REFERENCES Orders(OrderID),
    [ProductID] INT FOREIGN KEY REFERENCES Product(ProductID),
    [Price] MONEY,
    [Quantity] INT,
    -- Specify more columns here
);
GO

-- Insert rows into table 'Customer' in schema '[dbo]'
INSERT INTO [dbo].[Customer]
( -- Columns to insert data into
 Name, Address, Phone
)
VALUES
(N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321'),
(N'Trần Thị Bích', N'222 Trường Chinh, Đống Đa, Hà Nội', '123456789'),
(N'Lê Văn Cường', N'333 Kim Mã, Ba Đình, Hà Nội', '234567891'),
(N'Phạm Thị Dung', N'444 Lê Duẩn, Hoàn Kiếm, Hà Nội', '345678912'),
(N'Hoàng Minh Tâm', N'555 Nguyễn Lương Bằng, Đống Đa, Hà Nội', '456789123'),
(N'Nguyễn Thị Hồng', N'666 Xuân Thủy, Cầu Giấy, Hà Nội', '567891234'),
(N'Vũ Văn Hùng', N'777 Phạm Hùng, Nam Từ Liêm, Hà Nội', '678912345'),
(N'Đỗ Thị Mai', N'888 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', '789123456'),
(N'Phan Văn Long', N'999 Giải Phóng, Hoàng Mai, Hà Nội', '891234567'),
(N'Nguyễn Hữu Toàn', N'1010 Láng Hạ, Đống Đa, Hà Nội', '912345678');
-- Add more rows here
GO

-- Insert rows into table 'Product' in schema '[dbo]'
INSERT INTO [dbo].[Product]
( -- Columns to insert data into
 ProductName, [Desc], Unit, Price, [Status]
)
VALUES
(N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 1000, N'Available'),
(N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, N'Available'),
(N'Porscher 911', N'Faze Ropz', N'Chiếc', 20000000, N'Available'),
(N'Porscher Taycan', N'Faze Ropz', N'Chiếc', 21000000, N'Available'),
(N'Máy In Samsung 450', N'Máy in đang ế', N'Chiếc', 100, N'Available');
GO

INSERT INTO [dbo].[Orders]
( -- Columns to insert data into
 CustomerID, OrderDate
)
VALUES
(1, '2009-11-18'),
(3, '2029-11-20'),
(5, '2100-12-26');
GO

INSERT INTO [dbo].[OrderDetail]
( -- Columns to insert data into
 OrderID, ProductID, Price, Quantity
)
VALUES
(1, 2, 1000, 1),
(1, 3, 200, 2),
(1, 4, 100, 1),
(2, 2, 1000, 1),
(2, 6, 200, 2),
(2, 5, 19000, 1);
GO

INSERT INTO [dbo].[OrderDetail]
( -- Columns to insert data into
 OrderID, ProductID, Price, Quantity
)
VALUES
(3, 3, 1000, 1),
(3, 6, 200, 2),
(3, 5, 19000, 1);
GO

-- Cau 4
SELECT DISTINCT c.Name 
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT DISTINCT ProductName 
FROM Product;

SELECT * FROM Orders;
------------------------------

-- Cau 5
SELECT Name
FROM Customer 
ORDER BY Name;

SELECT ProductName, Price FROM Product
ORDER BY Price DESC

SELECT p.ProductName AS CustomerOrder
FROM OrderDetail od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Product p ON od.ProductID = p.ProductID
WHERE c.Name = N'Nguyễn Văn An';
------------------------------

-- Cau 6
SELECT APPROX_COUNT_DISTINCT(CustomerID) AS CustomerCount 
FROM Orders

SELECT APPROX_COUNT_DISTINCT(ProductID) AS ItemSold
FROM OrderDetail

SELECT OrderID, SUM(Price * Quantity) AS TotalPrice 
FROM OrderDetail
GROUP BY OrderID
------------------------------

-- Cau 7
UPDATE Product 
SET Price = ABS(Price);

ALTER TABLE Product
ADD MarketDate DATE

-- Cau 8
-- a
CREATE INDEX idx_ProductName ON Product(ProductName);
CREATE INDEX idx_CustomerName ON Customer(Name);

-- b
CREATE VIEW view_KhachHang AS
SELECT Name, Address, Phone
FROM Customer;

CREATE VIEW View_SanPham AS
SELECT ProductName, Price 
FROM Product;

CREATE VIEW View_KhachHang_SanPham AS
SELECT c.Name, c.Phone, p.ProductName, od.Quantity, o.OrderDate
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetail od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID;

SELECT * FROM View_KhachHang_SanPham

-- c
CREATE PROCEDURE SP_TimKH_MaKH(@CustomerID INT)
AS
SELECT * FROM Customer WHERE CustomerID = @CustomerID

CREATE PROCEDURE SP_TimKH_MaHD(@OrderID INT)
AS
SELECT c.Name, c.Address, c.Phone, o.OrderDate 
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
WHERE o.OrderID = @OrderID

CREATE PROCEDURE SP_SanPham_MaKH(@CustomerID INT)
AS
SELECT p.ProductName, p.[Desc], od.Quantity, od.Price
FROM OrderDetail od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Product p ON od.ProductID = p.ProductID
WHERE o.CustomerID = @CustomerID
------------------------------
