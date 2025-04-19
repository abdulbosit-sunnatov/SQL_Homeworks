--Task 7

select d.department,e.name, e.salary as emp_salary, p.projectName 
from employees e    
join Departments d
on e.departmentID = d.departmentID
left join Projects p
on e.EmployeeID = p.employeeID