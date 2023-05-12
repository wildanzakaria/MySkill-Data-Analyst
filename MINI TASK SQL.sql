-- MINI TASK 7
-- Tampilkan hanya kolom order_id, customer_id, dan sales
SELECT order_id, 
	customer_id,
    sales
FROM orders;
-- Tampilkan semua transaksi yang berasal dari Kota Seattle
SELECT * FROM orders
WHERE city = 'Seattle'
-- Tampilkan semua daftar transaksi dari konsumen perorangan (segment = Consumer) yang membeli produk Furniture di Kota New York City
SELECT * FROM orders
WHERE segment = 'Consumer' 
	AND category = 'Furniture' 
    and city = 'New York City';
    
-- MINI TASK 8
-- Tampilkan daftar berisi nama-nama produk yang dijual
SELECT DISTINCT product_name 
FROM orders;
-- Tampilkan 10 baris teratas berdasarkan nilai sales mulai dari yang terbesar
SELECT * 
FROM orders
ORDER BY sales DESC
LIMIT 10
-- Tampilkan daftar order yang masuk pada bulan Maret 2015
SELECT * 
from orders
WHERE order_date BETWEEN '2015-03-01' AND '2015-03-31'
order by order_date;
SELECT * FROM orders;

-- MINI TASK 9
-- Produk apa yang best selling (berdasarkan kuantitas yang terjual)?
select product_name,
	sum(quantity) AS quantity
from orders
GROUP by product_name
order by 2 DESC
limit 1
-- Kamu ingin memberikan promo kepada 100 konsumen perorangan (segment = ‘Consumer’) dengan rata-rata 
-- nilai order tertinggi. Buatlah daftar konsumen tersebut!
SELECT customer_name,
	customer_id,
    count(order_id) AS nilai_order
FROM orders
WHERE segment = 'Consumer'
GROUP by customer_name, customer_id
order by 3 DESC
limit 100
-- Konsumen bernama Joel Eaton meminta rekapan transaksi berisi produk apa saja yang 
-- dibeli beserta kuantitasnya selama dia menjadi konsumen Tokopaedi. Buatlah data rekapan tersebut!
SELECT product_name,
	sum(quantity)
FROM orders
WHERE customer_name = 'Joel Eaton'
GROUP by product_name
-- Pada tanggal berapa Tokopaedi menerima order paling banyak?
SELECT order_date,
	count(order_id) as jumlah_order
from orders
group by order_date
order by 2 DESC
limit 1
-- Produk apa yang memiliki rata-rata keuntungan terbesar per unit terjualnya?
SELECT product_name,
	AVG(profit) as keuntungan
from orders
group by product_name
order by 2 desc
limit 1

-- MINI TASK 10
-- [tokopaedi] Buat daftar konsumen dengan rata-rata spending per transsaksi di atas rata-rata seluruh konsumen
select customer_name,
	sum(sales)/count(distinct customer_id) as spending_avg
from orders
GROUP by customer_name
having sum(sales)/count(distinct customer_id) > (SELECT sum(sales)/count(distinct customer_id) from orders)
order by 2 desc
-- [dvdrental] Buat tabel berisi riwayat transaksi rental dengan kolom sebagai berikut
-- rental_id, rental_date, return_date, film_title, cutomer_name
select r.rental_id,
	r.rental_date,
    r.return_date,
   i.film_id,
   f.title film_title,
   CONCAT(cust.first_name, ' ', cust.last_name) customer_name
from rental r 
left join inventory i on r.inventory_id=i.inventory_id
left join customer cust on r.customer_id=cust.customer_id
left join film f on i.film_id=f.film_id

select * from rental