create database e_commerce;
use e_commerce;
create table customers(customer_id tinyint,
                    	first_name varchar(255),
                        last_name varchar(255),
                        email varchar(255));
                        
create table order_items(order_id tinyint,
                         product_id	tinyint,
                         quantity int);
                         
create table orders(order_id tinyint,
                   	customer_id	tinyint,
                    order_date date);
                    
create table products(product_id tinyint,
                      product_name varchar(255),
                      price decimal);

select * from customers;
select * from order_items;
select * from orders;
select * from products;

-- Which product has the highest price?
select price,product_name
	from products
    order by price desc
    limit 1;
    
-- Which customer has made the most orders?
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY order_count DESC;


-- Which product has the highest total revenue?
SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

        
-- Find the top customer who have ordered the most distinct products
SELECT c.customer_id, c.first_name, c.last_name, COUNT(DISTINCT oi.product_id) AS distinct_products
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY distinct_products DESC;

        
-- Find the first order (by date) for  customer "John Doe".
SELECT o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.first_name = 'John' AND c.last_name = 'Doe'
ORDER BY o.order_date ASC
LIMIT 1;









