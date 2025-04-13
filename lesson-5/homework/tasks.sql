create table Employees(
    EmployeeID    INT,
    Name          VARCHAR(50),
    Department    VARCHAR(50),
    Salary        DECIMAL(10,2),
    HireDate      DATE
)

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'Alice Johnson', 'HR',100000.00, '2020-03-15'),
(2, 'Bob Smith', 'Engineering', 100000.00, '2019-07-22'),
(3, 'Clara Kim', 'Marketing', 62000.00, '2021-01-10'),
(4, 'David Lee', 'Engineering', 85000.00, '2018-11-05'),
(5, 'Emma Brown', 'Sales', 57000.00, '2022-06-20'),
(6, 'Frank White', 'Finance', 69000.00, '2020-09-01'),
(7, 'Grace Hall', 'Engineering', 69000.00, '2023-02-14'),
(8, 'Henry Adams', 'Sales', 53000.00, '2021-08-08'),
(9, 'Ivy Green', 'Marketing', 61000.00, '2019-05-30'),
(10, 'Jack Black', 'HR', 58000.00, '2020-12-01');

-- Task 1

select Department,Name, Salary, row_number() over (order by Salary desc) salary_rank
from Employees;

-- Task 2
with ranked_table as (
    select EmployeeID, name, salary, rank() over (order by salary) salary_rank
    from employees
)
select *
from ranked_table
where salary_rank in (
    select salary_rank
    from ranked_table
    group by salary_rank
    having count(*) > 1
)

--Task 3

with ranked_table as 
(
    select department,salary, rank() over (partition by department order by salary desc) as rank_num 
    from employees
    )
select * 
from ranked_table 
where rank_num <= 2


--Task 4
with ranked_table as 
(
    select  name, department, salary, hiredate, rank() over (partition by department order by salary asc) as rank_num 
    from employees
    )
select * 
from ranked_table 
where rank_num = 1

--Task 5
SELECT 
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department 
        ORDER BY salary ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM employees;

--Task 6
select 
    name,
    department,
    salary,
    SUM(salary) over (PARTITION BY department) AS total_salary_per_department
from employees;

--Task 7
select 
    name,
    department,
    salary,
    avg(salary) over (PARTITION BY department) AS avg_salary_per_department
from employees;

--Task 8
SELECT 
    name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_department_salary,
    salary - AVG(salary) OVER (PARTITION BY department) AS salary_difference
FROM employees;

--Task 9
SELECT 
    name,
    department,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS moving_avg_salary
FROM employees;

--Task 10
select name,hiredate, sum(salary) as 'Sum of Salaries'
from (select * from employees order by hiredate desc offset 0 row fetch next 3 rows only) as last_3_table
group by name,hiredate
order by 'Sum of Salaries' desc

--Task 11
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    AVG(Salary) OVER (
        ORDER BY HireDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningAvgSalary
FROM Employees
ORDER BY HireDate;

--Task 12
SELECT 
    name,
    department,
    salary,
    MAX(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ) AS max_salary_in_window
FROM employees;


--Task 13
SELECT 
    name,
    department,
    salary,
    ROUND(
        (salary * 100.0) / SUM(salary) OVER (PARTITION BY department), 
        2
    ) AS salary_percentage
FROM employees;
