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

# 1.Customers with more than 20 purchases
SELECT customer_id, COUNT(*) AS purchase_count
FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 20;

# 2.Products with avg quantity > 15
SELECT product_id, AVG(quantity) AS avg_qty
FROM sales
GROUP BY product_id
HAVING AVG(quantity) > 15;

# 3.Regions where max revenue > 10000
SELECT region, MAX(revenue) AS max_revenue
FROM sales
GROUP BY region
HAVING MAX(revenue) > 10000;

# 4.Products where min quantity < 3
SELECT product_id, MIN(quantity) AS min_qty
FROM sales
GROUP BY product_id
HAVING MIN(quantity) < 3;

# 5.Customers with total revenue between 10000 and 50000
SELECT customer_id, SUM(revenue) AS total_revenue
FROM sales
GROUP BY customer_id
HAVING SUM(revenue) BETWEEN 10000 AND 50000;

# 6. Regions with more than 5 distinct products
SELECT region, COUNT(DISTINCT product_id) AS product_count
FROM sales
GROUP BY region
HAVING COUNT(DISTINCT product_id) > 5;

# 7.Customers whose highest purchase > 20000
SELECT customer_id, MAX(revenue) AS max_purchase
FROM sales
GROUP BY customer_id
HAVING MAX(revenue) > 20000;

# 8.Products sold more than 50 times
SELECT product_id, SUM(quantity) AS total_qty
FROM sales
GROUP BY product_id
HAVING SUM(quantity) > 50;

# 9.Customers with at least 3 distinct products
SELECT customer_id, COUNT(DISTINCT product_id) AS product_count
FROM sales
GROUP BY customer_id
HAVING COUNT(DISTINCT product_id) >= 3;

# 10.Products where total revenue > total quantity * 100
SELECT product_id, SUM(revenue) AS total_revenue, SUM(quantity) AS total_qty
FROM sales
GROUP BY product_id
HAVING SUM(revenue) > SUM(quantity) * 100;

# 11.Regions where max revenue ≥ 2 × avg revenue
SELECT region, MAX(revenue) AS max_rev, AVG(revenue) AS avg_rev
FROM sales
GROUP BY region
HAVING MAX(revenue) >= 2 * AVG(revenue);

# 12.Customers where min, max, avg revenue > 1000
SELECT customer_id
FROM sales
GROUP BY customer_id
HAVING MIN(revenue) > 1000 AND MAX(revenue) > 1000 AND AVG(revenue) > 1000;

# 13.Customers with >5 purchases in 2024 AND revenue > 20000
SELECT customer_id, COUNT(*) AS purchase_count, SUM(revenue) AS total_revenue
FROM sales
WHERE YEAR(sale_date) = 2024
GROUP BY customer_id
HAVING COUNT(*) > 5 AND SUM(revenue) > 20000;

# 14.Products (only quantity > 10) with avg revenue > 5000
SELECT product_id, AVG(revenue) AS avg_revenue FROM sales
WHERE quantity > 10
GROUP BY product_id
HAVING AVG(revenue) > 5000;

# 15.Customers who bought only in 'East'
SELECT customer_id FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 3 AND COUNT(DISTINCT region) = 1 AND MAX(region) = 'East';

# 16.Products (only revenue > 1000) sold at least 20 times
SELECT product_id, COUNT(*) AS sales_count FROM sales
WHERE revenue > 1000
GROUP BY product_id
HAVING COUNT(*) >= 20;


