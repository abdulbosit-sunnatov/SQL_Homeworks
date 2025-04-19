--Task 1

select e.name, d.department 
from employees e
join Departments d
on e.departmentID = d.departmentID