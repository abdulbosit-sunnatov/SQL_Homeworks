-- CREATE TABLE Products (
--     ProductID INT PRIMARY KEY,
--     ProductName VARCHAR(100),
--     Category VARCHAR(50),
--     Price DECIMAL(10,2),
--     Stock INT
-- );

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES
(201, 'Wireless Mouse', 'Electronics', 25.99, 150),
(202, 'Keyboard', 'Electronics', 45.00, 100),
(203, 'Office Chair', 'Furniture', 120.00, 0),
(204, 'Notebook', 'Stationery', 2.50, 2),
(205, 'Pen Pack', 'Stationery', 5.99, 1),
(206, 'Laptop', 'Electronics', 899.99, 30),
(207, 'Gaming Monitor', 'Electronics', 350.00, 5),
(208, 'Desk Lamp', 'Furniture', 45.00, 50),
(209, 'Coffee Mug', 'Kitchen', 12.99, 20),
(210, 'Cutlery Set', 'Kitchen', 25.00, 10),
(211, 'Bluetooth Headphones', 'Electronics', 75.00, 50),
(212, 'Smartphone', 'Electronics', 599.99, 80),
(213, 'Tablet', 'Electronics', 299.99, 15),
(214, 'Office Desk', 'Furniture', 150.00, 5),
(215, 'Bookshelf', 'Furniture', 80.00, 40),
(216, 'Dining Chair', 'Furniture', 60.00, 60),
(217, 'LED TV', 'Electronics', 450.00, 30),
(218, 'Wall Clock', 'Furniture', 35.00, 75),
(219, 'Treadmill', 'Sports', 500.00, 20),
(220, 'Yoga Mat', 'Sports', 25.00, 50),
(221, 'Dumbbells', 'Sports', 15.00, 120),
(222, 'Couch', 'Furniture', 800.00, 2),
(223, 'Coffee Table', 'Furniture', 130.00, 100),
(224, 'Microwave', 'Kitchen', 150.00, 10),
(225, 'Blender', 'Kitchen', 45.00, 70),
(226, 'Toaster', 'Kitchen', 30.00, 200),
(227, 'Iron', 'Home Appliances', 25.00, 100),
(228, 'Washing Machine', 'Home Appliances', 400.00, 10),
(229, 'Refrigerator', 'Home Appliances', 700.00, 15),
(230, 'Dishwasher', 'Home Appliances', 250.00, 25),
(231, 'Hair Dryer', 'Home Appliances', 35.00, 80),
(232, 'Electric Kettle', 'Kitchen', 20.00, 150),
(233, 'Instant Pot', 'Kitchen', 80.00, 20),
(234, 'Portable Speaker', 'Electronics', 60.00, 70),
(235, 'Camera', 'Electronics', 450.00, 25),
(236, 'Smartwatch', 'Electronics', 200.00, 100),
(237, 'Shoes', 'Fashion', 50.00, 150),
(238, 'T-shirt', 'Fashion', 15.00, 200),
(239, 'Jeans', 'Fashion', 30.00, 180),
(240, 'Jacket', 'Fashion', 100.00, 90),
(241, 'Socks', 'Fashion', 5.00, 300),
(242, 'Scarf', 'Fashion', 25.00, 70),
(243, 'Sunglasses', 'Fashion', 50.00, 40),
(244, 'Sneakers', 'Fashion', 65.00, 50),
(245, 'Belt', 'Fashion', 20.00, 100),
(246, 'Hat', 'Fashion', 18.00, 120),
(247, 'Cufflinks', 'Fashion', 35.00, 60),
(248, 'Suit', 'Fashion', 150.00, 30),
(249, 'Watch', 'Fashion', 200.00, 40),
(250, 'Handbag', 'Fashion', 75.00, 60);

select category, max(price) as max_price, IIF(sum(Stock) = 0, 'Out of Stock', 
            IIF(sum(Stock) BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
from Products 
group by category
order by max_price desc
OFFSET 5 ROWS;
