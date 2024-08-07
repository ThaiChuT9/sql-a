CREATE DATABASE EXAM
USE EXAM
CREATE TABLE DEPARTMENT (
    DEPARTID INT PRIMARY KEY,
    DEPARTNAME VARCHAR(50) NOT NULL,
    DESCRIPTIONS VARCHAR(100) NOT NULL
)
CREATE TABLE EMPLOYEE (
    EMPCODE CHAR(6) PRIMARY KEY,
    FIRSTNAME VARCHAR(50) NOT NULL,
    LASTNAME VARCHAR(50) NOT NULL,
    BIRTHDAY SMALLDATETIME NOT NULL,
    GENDER BIT DEFAULT 1,
    ADDRESS VARCHAR(100),
    DEPARTID INT REFERENCES DEPARTMENT(DEPARTID),
    SALARY MONEY
)
INSERT INTO DEPARTMENT (DEPARTID, DEPARTNAME, DESCRIPTIONS) VALUES
(1, 'Human Resources', 'Manages employee relations and recruitment'),
(2, 'Information Technology', 'Handles all IT-related tasks and support'),
(3, 'Finance', 'Manages company finances and accounting'),
(4, 'Marketing', 'Handles advertising and brand management'),
(5, 'Operations', 'Oversees day-to-day business operations');

INSERT INTO EMPLOYEE (
    EMPCODE,
    FIRSTNAME,
    LASTNAME,
    BIRTHDAY,
    GENDER,
    ADDRESS,
    DEPARTID,
    SALARY
) VALUES (
    'EMP001',
    'John',
    'Doe',
    '1985-03-15',
    1,
    '123 Main St, Anytown, USA',
    1,
    65000
),
(
    'EMP002',
    'Jane',
    'Smith',
    '1990-07-22',
    0,
    '456 Elm St, Othertown, USA',
    2,
    72000
),
(
    'EMP003',
    'Mike',
    'Johnson',
    '1988-11-30',
    1,
    '789 Oak Rd, Somewhere, USA',
    3,
    68000
),
(
    'EMP004',
    'Emily',
    'Brown',
    '1992-05-10',
    0,
    '321 Pine Ave, Nowhere, USA',
    4,
    61000
),
(
    'EMP005',
    'David',
    'Wilson',
    '1987-09-18',
    1,
    '654 Maple Dr, Anywhere, USA',
    5,
    70000
),
(
    'EMP006',
    'Sarah',
    'Lee',
    '1993-02-25',
    0,
    '987 Cedar Ln, Everywhere, USA',
    2,
    69000
),
(
    'EMP007',
    'Robert',
    'Taylor',
    '1986-12-07',
    1,
    '159 Birch Blvd, Someplace, USA',
    1,
    63000
),
(
    'EMP008',
    'Lisa',
    'Anderson',
    '1991-08-14',
    0,
    '753 Spruce St, Anyville, USA',
    3,
    66000
);

-- Increase the salary for all employees by 10%.
UPDATE EMPLOYEE
SET
    SALARY = SALARY + (
        SALARY * 10 / 100
    )
 -- Using ALTER TABLE statement to add constraint on Employee table to ensure that salary always greater than 0
ALTER TABLE EMPLOYEE ADD CONSTRAINT CHK_SALARY CHECK (
    SALARY > 0
)