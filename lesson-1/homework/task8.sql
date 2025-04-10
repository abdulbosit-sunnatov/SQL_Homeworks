CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL CHECK (LEN(title) > 0),
    price DECIMAL(10, 2) CHECK (price > 0),
    genre VARCHAR(100) DEFAULT 'Unknown'
);

INSERT INTO books (title, price, genre)
VALUES 
('The Alchemist', 19.99, 'Fiction'),
('Deep Work', 25.00, 'Productivity'),
('SQL Basics', 15.00, NULL), 
('Zero to One', 18.50, DEFAULT);

SELECT * FROM books ORDER BY book_id;
