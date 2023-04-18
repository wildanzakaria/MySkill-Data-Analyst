-- Membuat tabel tokopaedi
CREATE TABLE tokopaedi(
	row_id INT,
	order_id VARCHAR,
	order_date DATE,
	ship_date DATE,
	ship_mode VARCHAR,
	customer_id VARCHAR,
	customer_name VARCHAR,
	segment VARCHAR,
	country VARCHAR,
	city VARCHAR,
	state VARCHAR,
	postal_code VARCHAR,
	region VARCHAR,
	product_id VARCHAR,
	category VARCHAR,
	subcategory VARCHAR,
	product_name VARCHAR,
	sales FLOAT,
	quantity INT,
	discount FLOAT,
	profit FLOAT
);
-- membaca seluruh kolom pada tabel tokopaedi
SELECT * FROM tokopaedi;