CREATE TABLE data_types_demo (
    -- Character types
    char_col CHAR(5),
    varchar_col VARCHAR(50),
    nchar_col NCHAR(5),
    nvarchar_col NVARCHAR(50),

    -- Text (deprecated, but included for legacy understanding)
    text_col TEXT,

    -- Numeric types
    int_col INT,
    decimal_col DECIMAL(10,2),
    numeric_col NUMERIC(10,2),
    float_col FLOAT,
    real_col REAL,

    -- Date/time types
    date_col DATE,
    datetime_col DATETIME,
    time_col TIME,

    -- Other types
    bit_col BIT -- boolean-like
);


INSERT INTO data_types_demo (
    char_col, varchar_col, nchar_col, nvarchar_col, text_col,
    int_col, decimal_col, numeric_col, float_col, real_col,
    date_col, datetime_col, time_col, bit_col
) VALUES (
    'Hi', 'Hello World!', N'حروف', N'سلام', 'This is long text.',
    42, 12345.67, 98765.43, 3.14159265, 2.71828,
    '2025-04-10', '2025-04-10 12:34:56', '12:34:56', 1
);

SELECT * FROM data_types_demo;
