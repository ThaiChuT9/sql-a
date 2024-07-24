-- Create a new table called '[PhongBan]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[PhongBan]', 'U') IS NOT NULL
DROP TABLE [dbo].[PhongBan]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[PhongBan]
(
    [MaPB] VARCHAR(7) NOT NULL PRIMARY KEY, -- Primary Key column
    [TenPB] NVARCHAR(50) NOT NULL,
);
GO

-- Create a new table called '[NhanVien]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[NhanVien]', 'U') IS NOT NULL
DROP TABLE [dbo].[NhanVien]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[NhanVien]
(
    [MaNV] VARCHAR(7) NOT NULL PRIMARY KEY, -- Primary Key column
    [TenNV] NVARCHAR(50),
    [Ngaysinh] DATETIME,
    [soCMND] CHAR(9),
    [GioiTinh] CHAR(1),
    [DiaChi] NVARCHAR(100),
    [NgayVaoLam] DATETIME,
    [MaPB] VARCHAR(7) FOREIGN KEY REFERENCES PhongBan(MaPB)
    -- Specify more columns here
);
GO

-- Create a new table called '[LuongDA]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[LuongDA]', 'U') IS NOT NULL
DROP TABLE [dbo].[LuongDA]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[LuongDA]
(
    [MaDA] VARCHAR(8) PRIMARY KEY, -- Primary Key column
    [MaNV] VARCHAR(7) FOREIGN KEY REFERENCES NhanVien(MaNV),
    [NgayNhan] DATETIME,
    [SoTien] MONEY CHECK (SoTien > 0)
);
GO


INSERT INTO [dbo].[PhongBan] ([MaPB], [TenPB])
VALUES 
('PB0001', N'Phòng Kế Toán'),
('PB0002', N'Phòng Nhân Sự'),
('PB0003', N'Phòng IT'),
('PB0004', N'Phòng Marketing'),
('PB0005', N'Phòng Bán Hàng');


INSERT INTO [dbo].[NhanVien] ([MaNV], [TenNV], [Ngaysinh], [soCMND], [GioiTinh], [DiaChi], [NgayVaoLam], [MaPB])
VALUES 
('NV0001', N'Nguyễn Văn A', '1985-01-15', '123456789', 'M', N'Hà Nội', '2010-05-01', 'PB0001'),
('NV0002', N'Trần Thị B', '1990-02-20', '987654321', 'F', N'Hồ Chí Minh', '2012-08-15', 'PB0002'),
('NV0003', N'Phạm Văn C', '1988-03-25', '135792468', 'M', N'Đà Nẵng', '2014-11-20', 'PB0003'),
('NV0004', N'Lê Thị D', '1992-04-30', '246813579', 'F', N'Hải Phòng', '2016-03-10', 'PB0004'),
('NV0005', N'Hoàng Văn E', '1985-05-05', '112233445', 'M', N'Cần Thơ', '2018-06-25', 'PB0005');


INSERT INTO [dbo].[LuongDA] ([MaDA], [MaNV], [NgayNhan], [SoTien])
VALUES 
('DA00001', 'NV0001', '2023-01-01', 5000000),
('DA00002', 'NV0002', '2023-02-01', 6000000),
('DA00003', 'NV0003', '2023-03-01', 5500000),
('DA00004', 'NV0004', '2023-04-01', 7000000),
('DA00005', 'NV0005', '2023-05-01', 7500000);

SELECT 
    L.[MaDA],
    L.[NgayNhan],
    L.[SoTien],
    N.[MaNV],
    N.[TenNV],
    N.[Ngaysinh],
    N.[soCMND],
    N.[GioiTinh],
    N.[DiaChi],
    N.[NgayVaoLam],
    P.[MaPB],
    P.[TenPB]
FROM 
    [dbo].[LuongDA] L
INNER JOIN 
    [dbo].[NhanVien] N ON L.[MaNV] = N.[MaNV]
INNER JOIN 
    [dbo].[PhongBan] P ON N.[MaPB] = P.[MaPB];

SELECT
    [MaNV],
    [TenNV],
    [Ngaysinh],
    [soCMND],
    [GioiTinh],
    [DiaChi],
    [NgayVaoLam],
    [MaPB]
FROM
    [dbo].[NhanVien]
WHERE
    [GioiTinh] = 'F'

SELECT * FROM LuongDA

SELECT 
    N.[MaNV], 
    N.[TenNV], 
    SUM(L.[SoTien]) AS [TongLuong]
FROM 
    [dbo].[NhanVien] N
INNER JOIN 
    [dbo].[LuongDA] L ON N.[MaNV] = L.[MaNV]
GROUP BY 
    N.[MaNV], 
    N.[TenNV];

SELECT
    N.[MaNV],
    N.[TenNV],
    N.[Ngaysinh],
    N.[NgayVaoLam],
    N.[soCMND],
    N.[DiaChi],
    N.[MaPB],
    P.[TenPB]
FROM
    dbo.NhanVien N
INNER JOIN
    dbo.PhongBan P ON N.[MaPB] = P.[MaPB]
WHERE
    P.[TenPB] = N'Phòng IT'

SELECT
    N.[MaNV],
    N.[TenNV],
    N.[Ngaysinh],
    N.[NgayVaoLam],
    N.[soCMND],
    N.[DiaChi],
    N.[MaPB],
    P.[TenPB],
    L.[SoTien] AS [TienLuong]
FROM
    dbo.NhanVien N
INNER JOIN
    dbo.PhongBan P ON N.[MaPB] = P.[MaPB]
INNER JOIN
    dbo.LuongDA L ON N.[MaNV] = L.[MaNV] 
WHERE
    P.[TenPB] = N'Phòng IT'

SELECT
    P.[MaPB],
    P.[TenPB],
    COUNT(N.[MaNV]) AS [SoLuongNhanVien]
FROM dbo.PhongBan P
INNER JOIN
    dbo.NhanVien N ON P.[MaPB] = N.[MaPB]
GROUP BY
    P.[MaPB],
    P.[TenPB]

SELECT
    N.[MaNV],
    N.[TenNV],
    N.[Ngaysinh],
    N.[NgayVaoLam],
    N.[soCMND],
    N.[DiaChi],
    N.[MaPB],
    COUNT(L.[MaDA]) AS [SoLuongDuAn]
FROM 
    dbo.NhanVien N
INNER JOIN
    dbo.LuongDA L ON L.[MaNV] = N.[MaNV]
GROUP BY
    N.[MaNV],
    N.[TenNV],
    N.[Ngaysinh],
    N.[NgayVaoLam],
    N.[soCMND],
    N.[DiaChi],
    N.[MaPB]
HAVING
    COUNT(L.[MaDA]) >= 1;



