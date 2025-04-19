-- Task 1

CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(20),
    Salary INT
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary)
VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 7000),
(3, 'Charlie', 'Sales', 6000),
(4, 'David', 'HR', 5500),
(5, 'Emma', 'IT', 7200);

CREATE TABLE #EmployeeTransfers (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(20),
    Salary INT
);

INSERT INTO #EmployeeTransfers (EmployeeID, Name, Department, Salary)
SELECT
    EmployeeID,
    Name,
    CASE 
        WHEN Department = 'HR' THEN 'IT'
        WHEN Department = 'IT' THEN 'Sales'
        WHEN Department = 'Sales' THEN 'HR'
        ELSE Department 
    END AS Department,
    Salary
FROM Employees;

SELECT * FROM #EmployeeTransfers;


--Task 2

CREATE TABLE Orders_DB1 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO Orders_DB1 VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO Orders_DB2 VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);

DECLARE @MissingOrders TABLE (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO @MissingOrders
SELECT *
FROM Orders_DB1
WHERE OrderID NOT IN (
    SELECT OrderID FROM Orders_DB2
);

SELECT * FROM @MissingOrders;


--Task 3

CREATE VIEW vw_MonthlyWorkSummary AS
-- 1. Total hours worked per employee
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SUM(HoursWorked) AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,
    NULL AS AvgHoursDepartment,
    'Employee Summary' AS SummaryType
FROM WorkLog
GROUP BY EmployeeID, EmployeeName, Department

UNION ALL

-- 2. Total hours worked per department
SELECT 
    NULL AS EmployeeID,
    NULL AS EmployeeName,
    Department,
    NULL AS TotalHoursWorked,
    SUM(HoursWorked) AS TotalHoursDepartment,
    NULL AS AvgHoursDepartment,
    'Department Total' AS SummaryType
FROM WorkLog
GROUP BY Department

UNION ALL

-- 3. Average hours worked per department
SELECT 
    NULL AS EmployeeID,
    NULL AS EmployeeName,
    Department,
    NULL AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,
    AVG(HoursWorked) AS AvgHoursDepartment,
    'Department Average' AS SummaryType
FROM WorkLog
GROUP BY Department;
