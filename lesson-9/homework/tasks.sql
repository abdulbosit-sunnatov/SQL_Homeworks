-- CREATE TABLE Employees
-- (
-- 	EmployeeID  INTEGER PRIMARY KEY,
-- 	ManagerID   INTEGER NULL,
-- 	JobTitle    VARCHAR(100) NOT NULL
-- );

-- INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
-- VALUES
-- 	(1001, NULL, 'President'),
-- 	(2002, 1001, 'Director'),
-- 	(3003, 1001, 'Office Manager'),
-- 	(4004, 2002, 'Engineer'),
-- 	(5005, 2002, 'Engineer'),
-- 	(6006, 2002, 'Engineer');

--Task 1

WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID,
        ManagerID,
        JobTitle,
        0 AS Depth
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.JobTitle,
        eh.Depth + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT *
FROM EmployeeHierarchy
ORDER BY Depth, EmployeeID;

--Task 2
DECLARE @N INT = 10;

WITH FactorialCTE AS (
    SELECT 
        Num = 1, 
        Factorial = CAST(1 AS BIGINT)

    UNION ALL

    SELECT 
        Num + 1,
        Factorial * (Num + 1)
    FROM FactorialCTE
    WHERE Num < @N
)
SELECT * 
FROM FactorialCTE;

--Task 3

DECLARE @FibonacciN INT = 10;

WITH Fibonacci AS
(
    SELECT 1 AS n, 0 AS a, 1 AS b
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < @FibonacciN
)
SELECT n, a AS Fibonacci_Number
FROM Fibonacci
OPTION (MAXRECURSION 100);
