CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES
(1, 'John Doe', '2023-03-15', 1200.00, 'Shipped'),
(2, 'Jane Smith', '2023-06-10', 500.00, 'Pending'),
(3, 'Alice Johnson', '2023-09-22', 2000.00, 'Delivered'),
(4, 'Bob Lee', '2023-07-01', 3500.00, 'Cancelled'),
(5, 'Charlie Brown', '2023-11-05', 7000.00, 'Shipped'),
(6, 'David Wilson', '2023-04-18', 4500.00, 'Pending'),
(7, 'Eve Davis', '2023-12-25', 1500.00, 'Shipped'),
(8, 'Frank Miller', '2023-08-03', 8000.00, 'Delivered'),
(9, 'Grace Taylor', '2023-10-19', 950.00, 'Pending'),
(10, 'Hank Harris', '2023-01-11', 2000.00, 'Cancelled'),
(11, 'Ivy Clark', '2023-03-02', 6000.00, 'Shipped'),
(12, 'Jack Walker', '2023-06-28', 700.00, 'Delivered'),
(13, 'Kara Martinez', '2023-02-15', 4200.00, 'Pending'),
(14, 'Leo Robinson', '2023-05-20', 3000.00, 'Shipped'),
(15, 'Mona Scott', '2023-09-05', 2200.00, 'Cancelled'),
(16, 'Nina Young', '2023-04-07', 1300.00, 'Shipped'),
(17, 'Oliver King', '2023-07-25', 5800.00, 'Pending'),
(18, 'Paul Green', '2023-11-10', 15000.00, 'Shipped'),
(19, 'Quinn Adams', '2023-08-30', 4500.00, 'Cancelled'),
(20, 'Rachel Moore', '2023-05-02', 3500.00, 'Shipped');

SELECT 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        ELSE 'Cancelled'
    END AS OrderStatus,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        ELSE 'Cancelled'
    END
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;
