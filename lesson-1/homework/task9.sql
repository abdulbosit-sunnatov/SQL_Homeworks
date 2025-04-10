CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    published_year INT
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT FK_Loan_Book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT FK_Loan_Member FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

INSERT INTO Book (book_id, title, author, published_year)
VALUES
(1, '1984', 'George Orwell', 1949),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925);

INSERT INTO Member (member_id, name, email, phone_number)
VALUES
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890'),
(2, 'Bob Smith', 'bob@example.com', '987-654-3210');

INSERT INTO Loan (loan_id, book_id, member_id, loan_date, return_date)
VALUES
(1, 1, 1, '2025-04-01', NULL),           
(2, 2, 2, '2025-04-03', '2025-04-10'),   
(3, 1, 2, '2025-04-11', NULL);          

SELECT
    l.loan_id,
    m.name AS member_name,
    b.title AS book_title,
    l.loan_date,
    l.return_date
FROM Loan l
JOIN Member m ON l.member_id = m.member_id
JOIN Book b ON l.book_id = b.book_id
ORDER BY l.loan_date;

