-- Các ràng buộc (Constraints) trong SQL :
-- NOT NULL: Không thể để NULL
-- UNIQUE: Các giá trị cùng 1 cột là riêng biệt
-- PRIMARY KEY: Khoá chính (là 1 sự kết hợp giữa NOT NULL và UNIQUE)
-- FOREIGN KEY: Khoá ngoại ()
-- CHECK: Kiểm tra điều kiện
-- DEFAULT: Đặt giá trị mặc định cho một cột nếu không có giá trị nào được chỉ định

-- Cú pháp chung:

-- CREATE TABLE table_name (
-- column1 datatype constraint,
-- column2 datatype constraint,
-- column3 datatype constraint,
-- constraint
-- ....

CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY, -- PRIMARY KEY
    -- Hoặc 
    -- CONSTRAINT pk_doctor PRIMARY KEY (doctor_id)
    first_name VARCHAR(10) NOT NULL, -- NOT NULL
    middle_name VARCHAR(10),
    id_card VARCHAR(15),
    UNIQUE(id_card), -- UNIQUE
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES specialization(specialization_id), -- FOREIGN KEY
    qualification INT DEFAULT 1, -- DEFAULT
    CHECK (qualification >= 0), --CHECK
);

CREATE TABLE specialization (
    specialization_id INT PRIMARY KEY,
    specialization_name VARCHAR(50)
);

-- Add CONSTRAINT:
ALTER TABLE doctor
ADD CONSTRAINT PK_doctorid PRIMARY KEY (doctor_id);

ALTER TABLE doctor
ADD CONSTRAINT CHK_idcard CHECK (id_card>2);

-- Drop CONSTRAINT:
-- PK = Primary Key, UC = Unique, FK = Foreign Key, CHK = Check
ALTER TABLE doctor
DROP CONSTRAINT PK_doctorid;