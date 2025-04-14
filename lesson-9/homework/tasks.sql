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

with Factorial(num,factorial) as (
    select 1,1
    union all
    select 1 + num , factorial*(1 + num)
    from factorial
    where num < 10
)

select * from Factorial

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
