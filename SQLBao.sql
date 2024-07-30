CREATE DATABASE Baomoi
GO

USE Baomoi
GO

CREATE TABLE Poster (
    id_Poster INT PRIMARY KEY IDENTITY(1,1),
    name_Poster NVARCHAR(50)
);

CREATE TABLE Post (
    id_Post INT PRIMARY KEY IDENTITY(1,1),
    name_Post NVARCHAR(200),
    content NVARCHAR(MAX),
    id_Poster INT REFERENCES Poster(id_Poster),
    Post_datetime DATETIME,
    id_category INT REFERENCES Category(id_category),
    id_sub_category INT REFERENCES Sub_category(id_sub_category)
);

CREATE TABLE Category (
    id_category INT PRIMARY KEY IDENTITY(1,1),
    name_category NVARCHAR(100)
);

CREATE TABLE Sub_category (
    id_sub_category INT PRIMARY KEY IDENTITY(1,1),
    name_sub_category NVARCHAR(100),
    id_category INT REFERENCES Category(id_category)
);

-- Chèn dữ liệu vào bảng Poster
INSERT INTO Poster (name_Poster) VALUES
(N'Nguyễn Văn An'),
(N'Trần Thị Bình'),
(N'Lê Hoàng Cường'),
(N'Phạm Minh Dương'),
(N'Hoàng Thị Em'),
(N'Đỗ Văn Fong'),
(N'Vũ Thị Giang'),
(N'Bùi Quang Huy'),
(N'Đặng Thị Inh'),
(N'Lý Văn Khang');

-- Chèn dữ liệu vào bảng category
INSERT INTO category (name_category) VALUES
(N'Thời sự'),
(N'Thể thao'),
(N'Giải trí'),
(N'Công nghệ'),
(N'Kinh doanh'),
(N'Giáo dục'),
(N'Sức khỏe'),
(N'Du lịch'),
(N'Ẩm thực'),
(N'Xe');

-- Chèn dữ liệu vào bảng sub_category
INSERT INTO sub_category (name_sub_category, id_category) VALUES
(N'Chính trị', 1),
(N'Bóng đá', 2),
(N'Điện ảnh', 3),
(N'Smartphone', 4),
(N'Chứng khoán', 5),
(N'Tuyển sinh', 6),
(N'Covid-19', 7),
(N'Điểm đến', 8),
(N'Món ngon', 9),
(N'Xe máy', 10);

-- Chèn dữ liệu vào bảng Post
INSERT INTO Post (id_Poster, id_category, id_sub_category, Post_datetime, content) VALUES
(1, 1, 1, '2023-07-30 08:00:00', N'Nội dung bài viết về tình hình chính trị hiện nay...'),
(2, 2, 2, '2023-07-30 09:15:00', N'Kết quả trận đấu bóng đá hôm qua...'),
(3, 3, 3, '2023-07-30 10:30:00', N'Top 10 bộ phim đáng xem nhất năm 2023...'),
(4, 4, 4, '2023-07-30 11:45:00', N'So sánh các mẫu smartphone mới nhất trên thị trường...'),
(5, 5, 5, '2023-07-30 13:00:00', N'Phân tích thị trường chứng khoán tuần qua...'),
(6, 6, 6, '2023-07-30 14:15:00', N'Hướng dẫn chi tiết về quy trình tuyển sinh đại học 2023...'),
(7, 7, 7, '2023-07-30 15:30:00', N'Cập nhật tình hình dịch Covid-19 và các biện pháp phòng ngừa...'),
(8, 8, 8, '2023-07-30 16:45:00', N'Top 5 điểm du lịch hấp dẫn nhất Việt Nam trong mùa hè...'),
(9, 9, 9, '2023-07-30 18:00:00', N'Cách làm món phở gà truyền thống ngon đúng điệu...'),
(10, 10, 10, '2023-07-30 19:15:00', N'Đánh giá chi tiết mẫu xe máy điện mới nhất trên thị trường...');

-- Cập nhật các bản ghi ban đầu
UPDATE Post SET name_Post = N'Tin tức thời sự mới nhất' WHERE id_Post = 1;
UPDATE Post SET name_Post = N'Kết quả bóng đá hôm nay' WHERE id_Post = 2;
UPDATE Post SET name_Post = N'Tin tức giải trí showbiz' WHERE id_Post = 3;
UPDATE Post SET name_Post = N'Công nghệ mới nhất 2023' WHERE id_Post = 4;
UPDATE Post SET name_Post = N'Tin tức kinh doanh thị trường' WHERE id_Post = 5;
UPDATE Post SET name_Post = N'Thông tin tuyển sinh đại học' WHERE id_Post = 6;
UPDATE Post SET name_Post = N'Bí quyết sống khỏe mỗi ngày' WHERE id_Post = 7;
UPDATE Post SET name_Post = N'Khám phá điểm du lịch mới' WHERE id_Post = 8;
UPDATE Post SET name_Post = N'Công thức nấu ăn ngon' WHERE id_Post = 9;
UPDATE Post SET name_Post = N'Đánh giá xe mới nhất' WHERE id_Post = 10;

-- Cập nhật các bản ghi mới thêm
UPDATE Post SET name_Post = N'Căng thẳng mới ở Biển Đông' WHERE id_Post = 11;
UPDATE Post SET name_Post = N'Hỗ trợ người dân vùng lũ' WHERE id_Post = 12;
UPDATE Post SET name_Post = N'Điểm mới Bộ luật Dân sự' WHERE id_Post = 13;
UPDATE Post SET name_Post = N'Bóng chuyền nữ VN vô địch SEA Games' WHERE id_Post = 14;
UPDATE Post SET name_Post = N'Djokovic vô địch Wimbledon' WHERE id_Post = 15;
UPDATE Post SET name_Post = N'Top 10 bài hát Spotify tháng 7' WHERE id_Post = 16;
UPDATE Post SET name_Post = N'Xu hướng thời trang thu đông' WHERE id_Post = 17;
UPDATE Post SET name_Post = N'So sánh CPU Intel và AMD mới nhất' WHERE id_Post = 18;
UPDATE Post SET name_Post = N'Windows 11 tích hợp AI' WHERE id_Post = 19;
UPDATE Post SET name_Post = N'Dự báo BĐS 6 tháng cuối năm' WHERE id_Post = 20;
UPDATE Post SET name_Post = N'Top 10 startup Việt được đầu tư' WHERE id_Post = 21;
UPDATE Post SET name_Post = N'Kinh nghiệm du học Úc' WHERE id_Post = 22;
UPDATE Post SET name_Post = N'5 cách học tiếng Anh hiệu quả' WHERE id_Post = 23;
UPDATE Post SET name_Post = N'Lợi ích của chế độ ăn Địa Trung Hải' WHERE id_Post = 24;
UPDATE Post SET name_Post = N'Tiến bộ mới trong điều trị ung thư' WHERE id_Post = 25;



-- Hiển thị tên các tác giả 
SELECT DISTINCT name_Poster FROM Poster

-- Lấy các bài và tên tác giả
SELECT pt.name_Poster, p.name_Post, p.content, p.Post_datetime, c.name_category, sc.name_sub_category 
FROM Post p
JOIN Poster pt ON pt.id_Poster = p.id_Poster
JOIN Category c ON c.id_category = p.id_category
JOIN Sub_category sc ON sc.id_sub_category = p.id_sub_category

-- Lấy các bài viết cùng 1 tác giả
SELECT pt.name_Poster, p.name_Post, p.content, p.Post_datetime, c.name_category, sc.name_sub_category 
FROM Post p
JOIN Poster pt ON pt.id_Poster = p.id_Poster
JOIN Category c ON c.id_category = p.id_category
JOIN Sub_category sc ON sc.id_sub_category = p.id_sub_category
WHERE pt.name_Poster = N'Trần Thị Bình'

-- Đếm số bài viết trong các category
SELECT c.name_category, COUNT(*) AS post_count 
FROM Post p
JOIN Category c ON c.id_category = p.id_category
GROUP BY c.name_category
ORDER BY post_count DESC