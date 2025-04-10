CREATE TABLE account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2) CHECK (balance >= 0),
    account_type VARCHAR(20) CHECK (account_type IN ('Saving', 'Checking'))
);

INSERT INTO account (account_id, balance, account_type)
VALUES 
(1, 1000.00, 'Saving'),
(2, 500.00, 'Checking');

ALTER TABLE account
DROP CONSTRAINT CK__account__balance__38B96646;

ALTER TABLE account
DROP CONSTRAINT CK__account__account__39AD8A7F;

ALTER TABLE account
ADD CONSTRAINT CK_account_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT CK_account_account_type CHECK (account_type IN ('Saving', 'Checking'));

