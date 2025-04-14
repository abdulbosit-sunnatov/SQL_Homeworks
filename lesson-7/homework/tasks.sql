-- CREATE TABLE Customers (
--     CustomerID INT PRIMARY KEY,
--     CustomerName VARCHAR(100)
-- );

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol Davis'),
(4, 'David Wilson'),
(5, 'Eve Brown'),
(6, 'Jack');


-- CREATE TABLE Orders (
--     OrderID INT PRIMARY KEY,
--     CustomerID INT,
--     OrderDate DATE
-- );

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2024-11-01'),
(1002, 2, '2024-11-02'),
(1003, 1, '2024-11-03'),
(1004, 3, '2024-11-04'),
(1005, 4, '2024-11-05'),
(1006, 6, '2024-11-05');

-- CREATE TABLE OrderDetails (
--     OrderDetailID INT PRIMARY KEY,
--     OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
--     ProductID INT,
--     Quantity INT,
--     Price DECIMAL(10,2)
-- );

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1001, 101, 1, 999.99),
(2, 1001, 104, 5, 2.50),
(3, 1002, 102, 2, 699.99),
(4, 1003, 103, 1, 120.00),
(5, 1004, 105, 10, 1.20),
(6, 1006, 107, 1, 999.99),
(7, 1005, 105, 3, 1.20);

-- CREATE TABLE Products (
--     ProductID INT PRIMARY KEY,
--     ProductName VARCHAR(100),
--     Category VARCHAR(50)
-- );

INSERT INTO Products (ProductID, ProductName, Category) VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Smartphone', 'Electronics'),
(103, 'Desk Chair', 'Furniture'),
(104, 'Notebook', 'Stationery'),
(105, 'Pen', 'Stationery'),
(107, 'Pen', 'Stationery');


-- Task 1

select c.CustomerName, o.orderid, o.orderdate
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID;


-- Task 2

select c.CustomerID,c.CustomerName
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
where OrderID is null or OrderDate is null;

--Task 3

select o.orderid, p.ProductName, od.Quantity
from orders o
join OrderDetails od
on o.OrderID = od.OrderID
join Products p
on od.ProductID = p.ProductID

--Task 4

SELECT c.CustomerID, c.CustomerName, COUNT(DISTINCT o.OrderID) AS num_orders
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT o.OrderID) > 1;


--Task 5

select o.orderid, max(od.price) as max_price
from orders o
join OrderDetails od
on o.OrderID = od.OrderID
group by o.OrderID;

--Task 6
with ranked_Orders as (
    select CustomerID, orderId,orderdate, ROW_NUMBER() OVER(PARTITION by CustomerID order by orderdate desc) as rn
    from Orders
) select c.CustomerID, c.customername, o.orderid,o.orderdate
FROM Customers c
JOIN ranked_Orders o ON o.CustomerID = c.CustomerID
where o.rn = 1;

--Task 7
select c.customerID,c.CustomerName
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
join OrderDetails od
on o.OrderID = od.OrderID
join Products p
on od.ProductID = p.ProductID
group by c.CustomerID, c.CustomerName 
having count(distinct case when p.Category <> 'Electronics' then p.category end) = 0;


--Task 8
select c.customerID,c.CustomerName,COUNT(CASE WHEN p.Category = 'Stationery' THEN 1 END) AS StationeryItems
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
join OrderDetails od
on o.OrderID = od.OrderID
join Products p
on od.ProductID = p.ProductID
group by c.CustomerID, c.CustomerName 
having count(distinct case when p.Category = 'Stationery' then p.category end) >= 1;


--Task 9
SELECT 
  c.CustomerID, 
  c.CustomerName, 
  SUM(od.Price * od.Quantity) AS total_spent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName;
