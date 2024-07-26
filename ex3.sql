USE AdventureWorks2022
GO

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID >15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID >15
DECLARE @depID INT
SELECT @depID=12
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID >= @depID

SELECT SUM(StandardCost) FROM Production.ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
SELECT COUNT(*) AS TotalRecords FROM Production.ProductPhoto
SELECT GETDATE()
SELECT DATEPART(hh, GETDATE())
SELECT CONVERT(varchar(50), GETDATE(),103)
SELECT DB_ID('AdventureWorks')

USE Northwind
GO

SELECT * FROM Categories
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE AS LANGUAGE
SELECT @@VERSION AS VERSION

-- Create a new database called 'EXAMPLE 3'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'EXAMPLE 3'
)
CREATE DATABASE EXAMPLE3
GO

USE EXAMPLE3
GO

CREATE TABLE Contacts(
    MailID VARCHAR(20),
    Name NTEXT,
    TelephoneNums INT
)

ALTER TABLE Contatcs ADD Address NVARCHAR(50)
INSERT INTO Contacts VALUES (
    'xeko@gmail.com',N'Nguyen Van A',9899989,N'Ha Noi',
    'bacu@gg.com',N'Nguyen Thi B',9899979,N'Da Nang',
    'Vanc@yahu.com',N'Tran Van C',9849989,N'Cao Bang'
    )

SELECT * FROM Contacts

DELETE FROM Contacts WHERE MailID='bacu@gg.com'

UPDATE Contacts SET Name=N'Chu Thi D' WHERE MailID='xeko@gmail.com'

CREATE LOGIN Example3 WITH PASSWORD = '191101'

CREATE USER Example3 FROM LOGIN Example3

REVOKE ALL ON Contacts FROM Example3

GRANT SELECT ON Contacts TO Example3

