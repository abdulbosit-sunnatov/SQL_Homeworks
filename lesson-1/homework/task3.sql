CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE
);

INSERT INTO orders (order_id, customer_name, order_date)
VALUES 
(1, 'Alice', '2025-04-01'),
(2, 'Bob', '2025-04-02');
 
SELECT * FROM orders;
ALTER TABLE orders
DROP CONSTRAINT PK__orders__465962295F71CBAD;

ALTER TABLE orders
ADD CONSTRAINT PK_orders_order_id PRIMARY KEY (order_id);
