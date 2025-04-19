--Table creation

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
















