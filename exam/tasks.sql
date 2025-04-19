-- CREATE TABLE NthHighest
-- (
--  Name  varchar(5)  NOT NULL,
--  Salary  int  NOT NULL
-- )
 
--Insert the values
INSERT INTO  NthHighest(Name, Salary)
VALUES
('e5', 45000),
('e3', 30000),
('e2', 49000),
('e4', 36600),
('e1', 58000)
 
--Check data
SELECT Name,Salary FROM NthHighest

DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees
(
EmployeeID  INTEGER PRIMARY KEY,
ManagerID   INTEGER NULL,
JobTitle    VARCHAR(100) NOT NULL
);
GO

INSERT INTO #Employees (EmployeeID, ManagerID, JobTitle) VALUES
(1001,NULL,'President'),(2002,1001,'Director'),
(3003,1001,'Office Manager'),(4004,2002,'Engineer'),
(5005,2002,'Engineer'),(6006,2002,'Engineer');

select * from #Employees
GO

DROP TABLE IF EXISTS #TestCases;
GO

CREATE TABLE #TestCases
(
TestCase  VARCHAR(1) PRIMARY KEY
);
GO

INSERT INTO #TestCases (TestCase) VALUES
('A'),('B'),('C');
GO

select * from #TestCases


--Task 1
select top 1*  
from NthHighest 
where salary < (select top 1 salary  
from NthHighest 
where salary < (select max(salary) from NthHighest)
order by salary desc)
order by salary desc


--Task 2

with levels as (

    select EmployeeID, ManagerID, JobTitle,
    0 as depth
    from #Employees
    where ManagerID is null 

    union all

    select e.EmployeeID, e.ManagerID, e.JobTitle, l.depth +1
    from #Employees e
    join levels l on e.ManagerID = l.EmployeeID
)
select * from levels order by depth

--Task 3

select concat(A.testcase,',', B.TestCase ,',', C.TestCase)  as 'Test Cases' from #TestCases A
join #TestCases B on b.TestCase <> a.TestCase
join #TestCases C on c.TestCase <> a.TestCase
and c.TestCase <> b.TestCase
order by a.TestCase,b.TestCase,c.TestCase

