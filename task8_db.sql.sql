create database task8_db;
show databases;
use task8_db;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'SALES'),
(2, 'HR'),
(3, 'IT'),
(4, 'FINANCE');


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Employees VALUES
(1, 'Ajith', 1, 45000),
(2, 'Bala', 1, 50000),
(3, 'Celine', 2, 65000),
(4, 'Divya', 2, 75000),
(5, 'Elizabeth', 2, 65000),
(6, 'Francis', 3, 60000),
(7, 'Ganesh', 3, 30000),
(8, 'Harini', 3, 50000),
(9, 'Jaya', 4, 70000),
(10,'Swathi',4,55000);


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders VALUES
(101, 1),
(102, 1),
(103, 2);



-- 1. IN Subquery
# Find employees in 'HR' or 'IT'

SELECT name
FROM Employees
WHERE dept_id IN (
    SELECT dept_id
    FROM Departments
    WHERE dept_name IN ('HR', 'IT')
);


-- 2. NOT IN
-- Employees not in 'HR' or 'Finance'

SELECT name
FROM Employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM Departments
    WHERE dept_name IN ('HR', 'Finance')
);



-- 3. ANY
-- Salary > ANY employee in HR (greater than at least one)

SELECT name, salary
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id FROM Departments WHERE dept_name = 'HR'
    )
);


-- 4. ALL
-- Salary > ALL employees in HR (greater than highest HR salary)

SELECT name, salary
FROM Employees
WHERE salary > ALL (
    SELECT salary
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id FROM Departments WHERE dept_name = 'HR'
    )
);


-- 5. EXISTS (Correlated)
-- Customers with at least one order

SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- 6. NOT EXISTS
-- Customers with no orders

SELECT name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- 7. Scalar Subquery
-- Employee with department average salary

SELECT name,
       salary,
       (SELECT AVG(salary)
        FROM Employees e2
        WHERE e2.dept_id = e1.dept_id) AS dept_avg
FROM Employees e1;


-- 8. Correlated Subquery
-- Employees earning more than their department average

SELECT name, salary
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e2.dept_id = e1.dept_id
);


-- 9. Subquery in FROM (Derived Table)
-- Total salary per department

SELECT d.dept_name, t.total_salary
FROM (
    SELECT dept_id, SUM(salary) AS total_salary
    FROM Employees
    GROUP BY dept_id
) t
JOIN Departments d ON t.dept_id = d.dept_id;


-- 10. Nested Subquery (Multi-level)
-- Employees in departments with avg salary > 50000

SELECT name
FROM Employees
WHERE dept_id IN (
    SELECT dept_id
    FROM Employees
    GROUP BY dept_id
    HAVING AVG(salary) > 50000
);


-- 11. Highest Salary in Each Department

SELECT name, salary, dept_id
FROM Employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees e2
    WHERE e2.dept_id = e1.dept_id
);


-- 12. Same Salary in Department

SELECT name, salary, dept_id
FROM Employees e1
WHERE EXISTS (
    SELECT 1
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
      AND e1.salary = e2.salary
      AND e1.emp_id <> e2.emp_id
);

-- 13. Employees in Departments with Count > 1
SELECT name, dept_id
FROM Employees
WHERE dept_id IN (
    SELECT dept_id
    FROM Employees
    GROUP BY dept_id
    HAVING COUNT(*) > 1
);


-- 14. Lowest Salary in Each Department
SELECT name, salary, dept_id
FROM Employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees e2
    WHERE e2.dept_id = e1.dept_id
);