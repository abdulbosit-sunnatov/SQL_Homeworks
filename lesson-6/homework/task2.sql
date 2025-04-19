--Task 2

select e.name, d.department 
from employees e
left join Departments d
on e.departmentID = d.departmentID