--Task 1

SELECT 
    e.EmployeeID,
    e.Name,
    d.DepartmentName
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

--Task 2

SELECT 
    e.EmployeeID,
    e.Name,
    d.DepartmentName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

--Task 3

SELECT 
    e.EmployeeID,
    e.Name,
    d.DepartmentName
FROM 
    Employees e
RIGHT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;


--Task 4

SELECT 
    e.EmployeeID,
    e.Name,
    d.DepartmentName
FROM 
    Employees e
FULL OUTER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

--Task 5

SELECT 
    d.DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM 
    Departments d
LEFT JOIN 
    Employees e ON e.DepartmentID = d.DepartmentID
GROUP BY 
    d.DepartmentName;

--Task 6

SELECT 
    d.DepartmentName,
    p.ProjectName
FROM 
    Departments d
CROSS JOIN 
    Projects p;

--Task 7

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName,
    p.ProjectName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN 
    Projects p ON e.EmployeeID = p.EmployeeID;
