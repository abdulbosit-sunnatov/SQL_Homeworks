CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'Alice', 'Brown', 'Sales', 50000, '2018-01-20'),
(2, 'Bob', 'Smith', 'Marketing', 55000, '2020-07-15'),
(3, 'Charlie', 'Johnson', 'Operations', 40000, '2019-03-10'),
(4, 'David', 'Williams', 'Finance', 80000, '2016-09-09'),
(5, 'Eve', 'Jones', 'Sales', 45000, '2017-05-25'),
(6, 'Frank', 'Miller', 'Marketing', 70000, '2018-02-01'),
(7, 'Grace', 'Davis', 'Operations', 47000, '2021-04-13'),
(8, 'Hannah', 'Martinez', 'Finance', 90000, '2015-08-21'),
(9, 'Isaac', 'Hernandez', 'Sales', 65000, '2020-10-03'),
(10, 'Jack', 'Lopez', 'Marketing', 75000, '2017-12-16'),
(11, 'Katherine', 'García', 'Operations', 53000, '2016-11-23'),
(12, 'Louis', 'Rodriguez', 'Finance', 95000, '2014-06-11'),
(13, 'Mona', 'Martínez', 'Sales', 40000, '2019-01-30'),
(14, 'Nathan', 'Wilson', 'Marketing', 60000, '2020-09-12'),
(15, 'Olivia', 'Moore', 'Operations', 60000, '2022-02-19'),
(16, 'Paul', 'Taylor', 'Finance', 105000, '2017-04-15'),
(17, 'Quinn', 'Anderson', 'Sales', 72000, '2021-03-01'),
(18, 'Rachel', 'Thomas', 'Marketing', 85000, '2018-05-18'),
(19, 'Steve', 'Jackson', 'Operations', 56000, '2019-11-07'),
(20, 'Tina', 'White', 'Finance', 110000, '2016-01-03');


WITH Top10Percent AS (
    SELECT TOP 10 PERCENT
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary
    FROM Employees
    ORDER BY Salary DESC
)
SELECT 
    Department,
    AVG(Salary) AS AverageSalary,
    CASE
        WHEN AVG(Salary) > 80000 THEN 'High'
        WHEN AVG(Salary) BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Top10Percent
GROUP BY Department
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;


