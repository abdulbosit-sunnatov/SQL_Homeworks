CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

-- 1st way 
SELECT Year1, Max1, Max2, Max3,
       (SELECT MAX(v) FROM (VALUES (Max1), (Max2), (Max3)) AS value_table(v)) AS max_value
FROM TestMax
ORDER BY max_value desc;

-- 2nd way
SELECT 
    Year1,
    Max1,
    Max2,
    Max3,
    MaxValue = MAX(val)
FROM TestMax
CROSS APPLY (VALUES (Max1), (Max2), (Max3)) AS V(val)
GROUP BY Year1, Max1, Max2, Max3
ORDER BY MaxValue desc;