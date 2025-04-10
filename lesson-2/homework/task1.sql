CREATE TABLE test_identity(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO test_identity (name) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

DELETE FROM test_identity;

-- Data is deleted, but the table structure remains.
-- The identity seed is NOT reset.

INSERT INTO test_identity (name) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

TRUNCATE TABLE test_identity;

-- All data is removed.

-- Faster than DELETE.

-- Identity is RESET to the initial seed.

INSERT INTO test_identity (name) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

DROP TABLE test_identity;

-- The entire table structure is deleted from the database.

-- All rows, columns, constraints, and identity settings are gone.