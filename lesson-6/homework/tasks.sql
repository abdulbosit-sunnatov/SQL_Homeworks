CREATE TABLE Departments (
    departmentID INT PRIMARY KEY IDENTITY(1,1),
    department VARCHAR(50)
);

INSERT INTO Departments (department)
VALUES 
    ('IT'),
    ('HR'),
    ('Finance'),
    ('Data'),
    ('Marketing');

CREATE TABLE Employees (
    employeeID INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    departmentID INT,
    salary INT,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

INSERT INTO Employees (name, departmentID, salary)
VALUES
    ('Alice', 1, 60000),
    ('Bob', 3, 70000),
    ('Charlie', 4, 65000),
    ('David', 2, 72000),
    ('Eva', NULL, 68000);

CREATE TABLE Projects (
    projectID INT PRIMARY KEY IDENTITY(1,1),
    projectName VARCHAR(40),
    employeeID INT NULL,
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID)
);

INSERT INTO Projects (projectName, employeeID)
VALUES
    ('Alpha', 1),
    ('Beta', 2),
    ('Gamma', 1),
    ('Delta', 4),
    ('Omega', NULL);

--Task 1

select e.name, d.department 
from employees e
join Departments d
on e.departmentID = d.departmentID


--Task 2

select e.name, d.department 
from employees e
left join Departments d
on e.departmentID = d.departmentID

--Task 3

select e.name, d.department 
from employees e
right join Departments d
on e.departmentID = d.departmentID

--Task 4

select e.name, d.department 
from employees e
full outer join Departments d
on e.departmentID = d.departmentID

--Task 5

select d.department,e.name, sum(e.salary) as total_salary
from employees e
join Departments d
on e.departmentID = d.departmentID
group by d.department,e.name

--Task 6

select d.department, p.projectName
from departments d
cross join Projects p

--Task 7

select d.department,e.name, e.salary as emp_salary, p.projectName 
from employees e    
join Departments d
on e.departmentID = d.departmentID
left join Projects p
on e.EmployeeID = p.employeeID


