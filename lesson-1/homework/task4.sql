CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category_id INT,
    CONSTRAINT FK_item_category FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

INSERT INTO category (category_id, category_name)
VALUES (1, 'Electronics'), (2, 'Furniture');

INSERT INTO item (item_id, item_name, category_id)
VALUES (101, 'TV', 1),
       (102, 'Sofa', 2);

ALTER TABLE item
DROP CONSTRAINT FK_item_category;  

ALTER TABLE item
ADD CONSTRAINT FK_item_category
FOREIGN KEY (category_id)
REFERENCES category(category_id);
