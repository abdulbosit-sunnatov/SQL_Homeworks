CREATE TABLE student (
    id INT,
    name VARCHAR(100),
    age INT
);

INSERT student 
VALUES 
(1,'Abdulloh',20),
(2,'Salohiddin',22);

ALTER TABLE student
ALTER COLUMN id INT NOT NULL;

SELECT * FROM student;