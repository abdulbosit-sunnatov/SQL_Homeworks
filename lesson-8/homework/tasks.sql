--Task 1

CREATE TABLE Groupings (
    "Step Number" INT,
    Status VARCHAR(10)
);

INSERT INTO Groupings ("Step Number", Status) VALUES
(1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10, 'Passed'),
(11, 'Passed'),
(12, 'Passed');

WITH StatusWithRow AS (
  SELECT *,
         ROW_NUMBER() OVER (ORDER BY "Step Number") -
         ROW_NUMBER() OVER (PARTITION BY Status ORDER BY "Step Number") AS grp
  FROM Groupings
),
Grouped AS (
  SELECT MIN("Step Number") AS "Min Step Number",
         MAX("Step Number") AS "Max Step Number",
         Status,
         COUNT(*) AS "Consecutive Count"
  FROM StatusWithRow
  GROUP BY Status, grp
)
SELECT * FROM Grouped
ORDER BY "Min Step Number";

--Task 2

CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);

INSERT INTO EMPLOYEES_N (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE)
VALUES
(1, 'John', '1975-06-10'),
(2, 'Anna', '1976-08-05'),
(3, 'Mike', '1977-09-01'),
(4, 'Sara', '1979-03-12'),
(5, 'Tom',  '1980-07-22'),
(6, 'Kate', '1982-01-15'),
(7, 'Leo',  '1990-11-30'),
(8, 'Eva',  '1997-04-25');


WITH all_years AS (
    SELECT 1975 + number AS yr
    FROM master..spt_values
    WHERE type = 'P' AND 1975 + number <= YEAR(GETDATE())
),
hired_years AS (
    SELECT DISTINCT YEAR(hire_date) AS yr
    FROM EMPLOYEES_N
),
missing_years AS (
    SELECT yr
    FROM all_years
    WHERE yr NOT IN (SELECT yr FROM hired_years)
),
groups AS (
    SELECT 
        yr,
        yr - ROW_NUMBER() OVER (ORDER BY yr) AS grp
    FROM missing_years
)
SELECT 
    MIN(yr) AS start_year,
    MAX(yr) AS end_year,
    CAST(MIN(yr) AS VARCHAR) + ' - ' + CAST(MAX(yr) AS VARCHAR) AS Years
FROM groups
GROUP BY grp
ORDER BY start_year;

