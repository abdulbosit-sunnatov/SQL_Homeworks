
--Task 4

select e.name, d.department 
from employees e
full outer join Departments d
on e.departmentID = d.departmentID