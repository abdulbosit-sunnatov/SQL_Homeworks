CREATE TABLE photos (
    id INT PRIMARY KEY IDENTITY(1,1),
    image_data VARBINARY(MAX)
);

INSERT INTO photos (image_data)
SELECT BulkColumn
FROM OPENROWSET(
    BULK N'D:\photo_2025-02-18_20-58-50.jpg',
    SINGLE_BLOB
) AS img;
