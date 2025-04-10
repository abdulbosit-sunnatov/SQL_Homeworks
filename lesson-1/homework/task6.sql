CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100) DEFAULT 'Unknown'
);

INSERT INTO customer (customer_id, name)
VALUES (1, 'Alice');

INSERT INTO customer (customer_id, name, city)
VALUES (2, 'Bob', 'New York');

ALTER TABLE customer
DROP CONSTRAINT DF__customer__city__3E723F9C; 

ALTER TABLE customer
ADD CONSTRAINT DF_customer_city DEFAULT 'Unknown' FOR city;

