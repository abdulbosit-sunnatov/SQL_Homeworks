--Task 3

DECLARE @StartDate DATE = '2024-03-01';
DECLARE @EndDate DATE = EOMONTH(@StartDate);

WITH AllDates AS (
    SELECT @StartDate AS [Date]
    UNION ALL
    SELECT DATEADD(DAY, 1, [Date])
    FROM AllDates
    WHERE DATEADD(DAY, 1, [Date]) <= @EndDate
),

Calendar AS (
    SELECT 
        [Date],
        DATEPART(WEEKDAY, [Date]) % 7 AS WeekDayNum,
        DATEPART(WEEK, [Date]) - DATEPART(WEEK, @StartDate) AS WeekNum,
        DAY([Date]) AS DayNum
    FROM AllDates
)

SELECT 
    MAX(CASE WHEN WeekDayNum = 0 THEN DayNum END) AS Sunday,
    MAX(CASE WHEN WeekDayNum = 1 THEN DayNum END) AS Monday,
    MAX(CASE WHEN WeekDayNum = 2 THEN DayNum END) AS Tuesday,
    MAX(CASE WHEN WeekDayNum = 3 THEN DayNum END) AS Wednesday,
    MAX(CASE WHEN WeekDayNum = 4 THEN DayNum END) AS Thursday,
    MAX(CASE WHEN WeekDayNum = 5 THEN DayNum END) AS Friday,
    MAX(CASE WHEN WeekDayNum = 6 THEN DayNum END) AS Saturday
FROM Calendar
GROUP BY WeekNum
ORDER BY WeekNum;
