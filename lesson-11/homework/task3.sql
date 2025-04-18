-- Task 3

CREATE VIEW vw_MonthlyWorkSummary AS
-- 1. Total hours worked per employee
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SUM(HoursWorked) AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,
    NULL AS AvgHoursDepartment,
    'Employee Summary' AS SummaryType
FROM WorkLog
GROUP BY EmployeeID, EmployeeName, Department

UNION ALL

-- 2. Total hours worked per department
SELECT 
    NULL AS EmployeeID,
    NULL AS EmployeeName,
    Department,
    NULL AS TotalHoursWorked,
    SUM(HoursWorked) AS TotalHoursDepartment,
    NULL AS AvgHoursDepartment,
    'Department Total' AS SummaryType
FROM WorkLog
GROUP BY Department

UNION ALL

-- 3. Average hours worked per department
SELECT 
    NULL AS EmployeeID,
    NULL AS EmployeeName,
    Department,
    NULL AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,
    AVG(HoursWorked) AS AvgHoursDepartment,
    'Department Average' AS SummaryType
FROM WorkLog
GROUP BY Department;
