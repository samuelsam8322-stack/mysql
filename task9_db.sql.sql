CREATE database task9_db;
use task9_db;


#1. ROW_NUMBER() – Basic Ordering

CREATE TABLE students (
    student_id INT,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1, 'Aman', 85),
(2, 'Bala', 90),
(3, 'Chitra', 78),
(4, 'Deepak', 92),
(5, 'Esha', 88);

-- Questions:
-- 1. Assign row numbers based on marks in descending order
select *,
row_number() over(order by marks desc) as row_num
from students;

-- 2. Get top 3 students based on marks
select *
from( select *,
row_number() over(order by marks desc) as row_num
from students)t
where row_num <= 3;


# 2. PARTITION BY – Group-wise Ranking

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES
(1, 'Aman', 'IT', 60000),
(2, 'Bala', 'IT', 70000),
(3, 'Chitra', 'HR', 50000),
(4, 'Deepak', 'HR', 55000),
(5, 'Esha', 'IT', 65000);

-- Questions:
-- 3. Assign row numbers within each department based on salary
select *,
row_number() over(partition by department order by salary desc) as dept_rank
from employees;

-- 4. Find the highest paid employee in each department
select *
from ( select*,
row_number() over(partition by department order by salary desc) as dept_rank
from employees) t
where dept_rank = 1;


#3. RANK and DENSE_RANK

CREATE TABLE scores (
    player_id INT,
    player_name VARCHAR(50),
    score INT
);

INSERT INTO scores VALUES
(1, 'A', 100),
(2, 'B', 200),
(3, 'C', 200),
(4, 'D', 150),
(5, 'E', 100);

-- Questions:
-- 5. Assign rank to players based on score in descending order
select *,
rank() over(order by score desc) as rank_val
from scores;

-- 6. Assign dense rank to players based on score in descending order
select *,
dense_rank() over(order by score desc) as rank_val
from scores;

-- 7. Find top 2 distinct scores
select *
from ( select*,
dense_rank() over(order by score desc) as rnk
from scores)t
where rnk <=2;


#4. Row Comparison

CREATE TABLE sales (
    sale_id INT,
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
(1, '2023-01-01', 500),
(2, '2023-01-02', 700),
(3, '2023-01-03', 600),
(4, '2023-01-04', 900),
(5, '2023-01-05', 800);

-- Questions:
-- 8. Show previous row amount for each row based on date
select *,
lag(amount) over(order by sale_date) as per_amount
from sales;

-- 9. Show next row amount for each row based on date
select *,
lead(amount) over(order by sale_date) as per_amount
from sales;

-- 10. Find difference between current row and previous row
select *,
amount - lag(amount) over(order by sale_date) as diff
from sales;

# 5. Running Total

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orders VALUES
(1, '2023-01-01', 100),
(2, '2023-01-02', 200),
(3, '2023-01-03', 300),
(4, '2023-01-04', 400),
(5, '2023-01-05', 500);

-- Questions:
-- 11. Calculate running total of amount ordered by date
select *,
sum(amount) over(order by order_date) as running_total
from orders;

-- 12. Calculate cumulative sum of amount for all rows
select *,
sum(amount) over() as total_sum
from orders;

# 6. Window Frame

CREATE TABLE temperature (
    day INT,
    temp INT
);

INSERT INTO temperature VALUES
(1, 30),
(2, 32),
(3, 31),
(4, 29),
(5, 35);

-- Questions:
-- 13. Calculate moving average of last 3 rows
SELECT *,
AVG(temp) OVER (
    ORDER BY day
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM temperature;

-- 14. Calculate average including current row and previous row
SELECT *,
AVG(temp) OVER (
    ORDER BY day
    ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
) AS avg_last_2
FROM temperature;


# 7. Duplicate Handling

CREATE TABLE customers (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Aman', 'Chennai'),
(2, 'Aman', 'Chennai'),
(3, 'Bala', 'Delhi'),
(4, 'Bala', 'Delhi'),
(5, 'Chitra', 'Mumbai');

# Questions:
# 15. Remove duplicate rows and keep only one record
select id, name, city
from( select *,
row_number() over(partition by name order by id) as duplicates_removed
from customers) t
where duplicates_removed =1;