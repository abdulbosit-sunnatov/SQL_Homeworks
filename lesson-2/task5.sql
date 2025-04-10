DROP TABLE IF EXISTS worker;

CREATE TABLE worker (
    id INT,
    name VARCHAR(100)
);

BULK INSERT worker
FROM 'D:\SQL\SQL_Homeworks\lesson-2\workers.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

SELECT * FROM worker;


