--Task 5

select d.department,e.name, sum(e.salary) as total_salary
from employees e
join Departments d
on e.departmentID = d.departmentID
group by d.department,e.name