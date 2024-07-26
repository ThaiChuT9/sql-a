CREATE TABLE Productt (
    productId INT PRIMARY KEY IDENTITY(1,1),
    productName VARCHAR(150),
    productCode VARCHAR(50),
    MFGdate DATE
);

CREATE TABLE Conductor (
    conductorId INT PRIMARY KEY IDENTITY(1,1),
    conductorName VARCHAR(100),
    conductorCode VARCHAR(50)
);

CREATE TABLE WhoProduct (
    wID INT PRIMARY KEY IDENTITY(1,1),
    conductorId INT REFERENCES Conductor(conductorId),
    productId INT REFERENCES Productt(productId)
);

INSERT INTO Productt(productName, productCode, MFGdate)
VALUES 
('Máy tính xách tay Z37','Z37','2019-07-20'),
('Máy tính xách chân X37','X37','2028-09-22'),
('Bảng tính xách tay Y37','Y37','2001-12-26'),
('Tính nhẩm xách tay P37','P37','2100-07-20'),
('Điện thoại L0kia A900', 'A900', '2019-05-10'),
('Máy in C103', 'C103', '2018-07-15'),
('Máy ảnh số 500', '500D', '2020-01-20'),
('Máy xách tay chân Z360','Z360','2222-02-22');

INSERT INTO Conductor(conductorName, conductorCode)
VALUES
('Nguyễn Văn An', '987688'),
('Trần Thị Bích', '876543'),
('Lê Văn Cường', '765432'),
('Phạm Thị Dung', '654321'),
('Hoàng Minh Tâm', '543210'),
('Trần Văn Thái', '654329'),
('Nguyễn Quang Hải', '954321'),
('Nừng Nững', '690321');

INSERT INTO WhoProduct (productId, conductorId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1),
(7, 7),
(8, 8),
(8, 6),
(8, 1);

-- Cau 4
SELECT DISTINCT productName AS CacLoaiSanPham FROM Productt

SELECT * FROM Productt

SELECT * FROM Conductor

-- Cau 5
SELECT DISTINCT productName AS CacLoaiSanPham FROM Productt
ORDER BY productName ASC

SELECT * FROM Conductor
ORDER BY conductorName ASC

SELECT * FROM Productt
WHERE productCode = 'Z37'

SELECT p.* FROM Productt p
JOIN WhoProduct w ON w.productId = p.productId
JOIN Conductor c ON w.conductorId = c.conductorId
WHERE c.conductorName = 'Nguyễn Văn An'

-- Cau 6
SELECT productName, COUNT(*) AS SoloaiSP FROM Productt
GROUP BY productName

SELECT AVG(SoloaiSP) AS TBSoloaiSP
FROM (
    SELECT productName, COUNT(*) AS SoloaiSP FROM Productt
    GROUP BY productName
) AS Subquery

SELECT p.*, c.* FROM Productt p
JOIN WhoProduct w ON w.productId = p.productId
JOIN Conductor c ON w.conductorId = c.conductorId

-- Cau 7
UPDATE Productt 
SET MFGdate = GETDATE() 
WHERE MFGdate > GETDATE();

ALTER TABLE Productt
ADD Versions VARCHAR(10)

-- Câu 8
-- a
CREATE INDEX idx_ConductorName ON Conductor(conductorName)

-- b
CREATE VIEW view_SP AS
SELECT productName, productCode, MFGdate
FROM Productt

CREATE VIEW view_SP_NCTN AS
SELECT p.productCode, p.MFGdate, c.conductorName  
FROM Productt p
JOIN WhoProduct w ON w.productId = p.productId
JOIN Conductor c ON w.conductorId = c.conductorId

CREATE VIEW view_Top_SP AS
SELECT TOP 5 productName, MFGdate
FROM Productt
ORDER BY MFGdate DESC