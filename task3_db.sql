CREATE DATABASE sales_db;
show databases;
USE sales_db;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    region VARCHAR(50),
    sale_date DATE,
    quantity INT,
    revenue DECIMAL(10,2)
);
INSERT INTO sales (sale_id, customer_id, product_id, region, sale_date, quantity, revenue) VALUES
(1, 101, 1001, 'North', '2024-01-10', 22, 500.00),
(2, 102, 1002, 'South', '2024-01-12', 19, 300.00),
(3, 103, 1003, 'East',  '2024-01-15', 25, 1500.00),
(4, 104, 1001, 'West',  '2024-01-18', 13, 750.00),
(5, 105, 1002, 'North', '2024-01-20', 4, 1200.00),
(6, 106, 1003, 'South', '2024-01-22', 21, 600.00),
(7, 107, 1001, 'East',  '2024-01-25', 6, 1800.00),
(8, 108, 1002, 'West',  '2024-01-28', 10, 300.00),
(9, 109, 1003, 'North', '2024-02-01', 23, 900.00),
(10,110, 1001, 'South', '2024-02-05', 2, 500.00);

select * from sales;

# 1. customers who made more than 20 purchases
select customer_id, quantity as total_purchases from sales
group by customer_id, quantity
having quantity > 20;

# 2. find product whose average quantity sold is above 15
select product_id, avg(quantity) as avg_quantity from sales
group by product_id 
having avg(quantity) > 15;

# 3.Find regions where maximum revenue in a single sale is greater than 10000.
select region, revenue as max_revenue from sales
group by region,revenue
having revenue > 10000;

# 4.show products where minimum quantity sold is less than 3.
select product_id, quantity as min_quantity from sales
group by product_id, quantity
having quantity < 3;

# 5.Find customers whose total revenue between 10000 and 50000.
select customer_id, revenue as total_revenue from sales
group by customer_id, revenue
having revenue <= 10000 and revenue >= 50000;

# 6.Find regions with more than 5 distinct products sold
select product_id, region, quantity as distinct_products from sales
group by product_id, region, quantity
having quantity > 5;

# 7.Customers whose highest purchase > 20000
select customer_id, revenue as max_purchase from sales
group by customer_id, revenue
having revenue > 20000;

# 8.Products sold more than 20 times
select product_id, quantity as total_qty from sales
group by product_id , quantity
having quantity > 20;

# 9.Customers with at least 3 distinct products
select customer_id, quantity, product_id as distinct_products from sales
group by customer_id, quantity, product_id
having quantity >= 3;

# 10. Products where total revenue > total quantity * 100
SELECT product_id, SUM(revenue) AS total_revenue, SUM(quantity) AS total_qty from sales
GROUP BY product_id
HAVING SUM(revenue) > SUM(quantity) * 100;
