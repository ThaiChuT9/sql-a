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

CREATE TABLE user1 (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(100),
    user_join_date DATETIME
);

CREATE TABLE comment (
    comment_id INT IDENTITY(1,1) PRIMARY KEY,
    id_post INT REFERENCES Post(id_Post),
    user_id INT REFERENCES user1(user_id),
    comment_body NVARCHAR(MAX),
    comment_date DATETIME
);

CREATE TABLE rate (
    rate_id INT IDENTITY(1,1) PRIMARY KEY,
    id_post INT REFERENCES Post(id_Post),
    user_id INT REFERENCES user1(user_id),
    rate_value INT CHECK (rate_value BETWEEN 1 AND 5),
    rate_date DATETIME
);

CREATE INDEX idx_user_name ON user1(user_name)
CREATE INDEX idx_post_name ON Post(name_Post)
CREATE INDEX idx_poster_name ON Poster(name_Poster)

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

INSERT INTO user1 (user_id, user_name, user_join_date) VALUES
(1, N'Nguyễn Văn A', '2023-01-01'),
(2, N'Trần Thị B', '2023-02-15'),
(3, N'Lê Văn C', '2023-03-20'),
(4, N'Phạm Thị D', '2023-04-10'),
(5, N'Hoàng Văn E', '2023-05-05'),
(6, N'Vũ Thị F', '2023-06-15'),
(7, N'Đặng Văn G', '2023-07-01'),
(8, N'Trịnh Thị H', '2023-07-20');

INSERT INTO comment (id_post, user_id, comment_body, comment_date) VALUES
(1, 3, N'Thông tin rất hữu ích, cảm ơn tác giả!', '2023-08-04 09:00:00'),
(1, 4, N'Tôi rất thích cách trình bày của bài viết này.', '2023-08-04 10:30:00'),
(2, 1, N'Bài viết rất chi tiết và đầy đủ.', '2023-08-04 11:00:00'),
(2, 5, N'Tôi học được nhiều điều mới từ bài viết này.', '2023-08-04 12:15:00'),
(2, 2, N'Rất đáng để đọc và chia sẻ!', '2023-08-04 13:30:00'),
(3, 1, N'Bài viết rất hay, mong có thêm nhiều bài như thế này.', '2023-08-05 09:45:00'),
(3, 6, N'Tôi đồng ý với quan điểm của tác giả.', '2023-08-05 10:30:00'),
(3, 7, N'Thông tin này rất bổ ích cho công việc của tôi.', '2023-08-05 11:15:00'),
(4, 2, N'Bài viết rất thú vị và hấp dẫn.', '2023-08-06 14:00:00'),
(4, 8, N'Tôi sẽ áp dụng những điều học được vào cuộc sống.', '2023-08-06 15:30:00'),
(5, 3, N'Bài viết rất sâu sắc và đầy ý nghĩa.', '2023-08-07 10:00:00'),
(5, 4, N'Tôi rất thích cách tác giả phân tích vấn đề.', '2023-08-07 11:30:00'),
(5, 1, N'Bài viết này đã mở rộng tầm nhìn của tôi.', '2023-08-07 13:00:00');

INSERT INTO rate (id_post, user_id, rate_value, rate_date) VALUES
(1, 1, 5, '2023-08-01 10:05:00'),
(1, 6, 2, '2023-08-01 10:05:00'),
(1, 2, 4, '2021-08-01 11:35:00'),
(2, 3, 5, '2023-08-02 09:20:00'),
(3, 4, 4, '2023-08-02 14:25:00'),
(3, 1, 5, '2024-08-01 10:05:00'),
(4, 5, 5, '2025-08-03 16:50:00');

INSERT INTO rate (id_post, user_id, rate_value, rate_date) VALUES
(1, 5, 4, '2021-08-01 11:35:00'),
(3, 6, 2, '2021-08-01 11:35:00'),
(4, 1, 3, '2021-08-01 11:35:00');


-- Lấy các bài và tên tác giả
SELECT
    PT.NAME_POSTER,
    P.POST_DATETIME,
    P.NAME_POST,
    P.CONTENT,
    C.NAME_CATEGORY,
    SC.NAME_SUB_CATEGORY
FROM
    POST         P
    JOIN POSTER PT
    ON PT.ID_POSTER = P.ID_POSTER
    JOIN CATEGORY C
    ON C.ID_CATEGORY = P.ID_CATEGORY
    JOIN SUB_CATEGORY SC
    ON SC .ID_SUB_CATEGORY = P.ID_SUB_CATEGORY

-- Lấy các bài viết cùng 1 tác giả
SELECT
    PT.NAME_POSTER,
    P.NAME_POST,
    P.CONTENT,
    P.POST_DATETIME,
    C.NAME_CATEGORY,
    SC.NAME_SUB_CATEGORY
FROM
    POST P
    JOIN POSTER PT
    ON PT.ID_POSTER = P.ID_POSTER
    JOIN CATEGORY C
    ON C.ID_CATEGORY = P.ID_CATEGORY
    JOIN SUB_CATEGORY SC
    ON SC.ID_SUB_CATEGORY = P.ID_SUB_CATEGORY
WHERE
    PT.NAME_POSTER = N'Trần Thị Bình'

-- Đếm số bài viết trong các category
SELECT
    C.NAME_CATEGORY,
    COUNT(*) AS POST_COUNT
FROM
    POST P
    JOIN CATEGORY C
    ON C.ID_CATEGORY = P.ID_CATEGORY
GROUP BY
    C.NAME_CATEGORY
ORDER BY
    POST_COUNT DESC

-- Hiển thị tên user và tất cả comment của user đó
SELECT
    U.USER_ID,
    U.USER_NAME,
    P.ID_POST,
    P.NAME_POST,
    C.COMMENT_ID,
    C.COMMENT_BODY,
    C.COMMENT_DATE
FROM
    USER1 U
    JOIN COMMENT C
    ON U.USER_ID = C.USER_ID
    JOIN POST P
    ON C.ID_POST = P.ID_POST
WHERE
    U.USER_ID = '1'
ORDER BY
    C.COMMENT_DATE DESC;

-- Hiển thị Top 5 bài viết dựa vào rate của người dùng
SELECT
    TOP 5 P.ID_POST,
    P.NAME_POST,
    AVG(R.RATE_VALUE) AS STARS
FROM
    POST P
    JOIN RATE R
    ON P.ID_POST = R.ID_POST
GROUP BY
    P.ID_POST,
    P.NAME_POST
ORDER BY
    STARS DESC

-- Hiển thị comment trong bài viết 
SELECT
    P.NAME_POST,
    C.COMMENT_BODY,
    U.USER_NAME
FROM
    POST    P
    JOIN COMMENT C
    ON P.ID_POST = C.ID_POST
    JOIN USER1 U
    ON C.USER_ID = U.USER_ID
WHERE
    P.ID_POST = '1'
ORDER BY
    C.COMMENT_DATE DESC