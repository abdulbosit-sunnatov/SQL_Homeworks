--Task 3

select e.name, d.department 
from employees e
right join Departments d
on e.departmentID = d.departmentID