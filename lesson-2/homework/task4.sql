DROP TABLE IF EXISTS student;

CREATE TABLE student (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    classes INT,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class) 
);

INSERT INTO student (name, classes, tuition_per_class)
VALUES
    ('Ali', 4, 150.00),
    ('Laylo', 3, 200.00),
    ('Olim', 5, 100.00);

SELECT * FROM student;

