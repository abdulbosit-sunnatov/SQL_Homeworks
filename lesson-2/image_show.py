import pyodbc # type: ignore

conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=localhost\\SQLEXPRESS;'    
    'DATABASE=master;' 
    'Trusted_Connection=yes;'
)

cursor = conn.cursor()

cursor.execute("SELECT TOP 1 image_data FROM photos")
row = cursor.fetchone()

if row:
    with open("retrieved_image.jpg", "wb") as f:
        f.write(row[0])
    print("Image saved as 'retrieved_image.jpg'")
else:
    print("No image found.")

cursor.close()
conn.close()
