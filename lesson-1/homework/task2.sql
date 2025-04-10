CREATE TABLE product (
    product_id INT UNIQUE,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO product (product_id, product_name, price)
VALUES (1, 'Laptop', 1000),
       (2, 'Phone', 600);

ALTER TABLE product
ADD CONSTRAINT unique_product UNIQUE (product_id, product_name);
