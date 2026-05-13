-
# I.DEPARTMENTS Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'SALES'),
(3, 'FINANCE'),
(4, 'HR');

# II.EMPLOYEES Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);
INSERT INTO Employees VALUES
(101, 'Alice', 10000, 2, NULL),
(102, 'Bob', 50000, 1, 101),
(103, 'Charlie', 45000, 2, 101),
(104, 'Dev', 30000, NULL, 102),
(105, 'Rahul', 60000, 3, 101),
(106, 'Fazil', 35000, 2, 103),
(107, 'Gokul', 28000, 2, 103);

#1.Write a query to display employee names and their department names using INNER JOIN.
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

#2.Write a query to show all employees and their department names, including employees who are not assigned to any department.
SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

#3.Write a query to list all departments and the employees in them, including departments with no employees
SELECT d.dept_name, e.emp_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

#4.Write a query to find employees who do not belong to any department using LEFT JOIN and IS NULL.
SELECT e.emp_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

#5.Write a query to display employee names, department names, and manager names.
SELECT e.emp_name AS employee, d.dept_name, m.emp_name AS manager
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id
LEFT JOIN Employees m
ON e.manager_id = m.emp_id;

#6.Write a query to find pairs of employees working in the same department using SELF JOIN.
SELECT e1.emp_name AS emp1, e2.emp_name AS emp2, e1.dept_id
FROM Employees e1
JOIN Employees e2
ON e1.dept_id = e2.dept_id AND e1.emp_id < e2.emp_id;

#CUSTOMERS Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
INSERT INTO Customers VALUES
(1, 'Ram'),
(2, 'Siva'),
(3, 'Joseph');

#ORDERS Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);
INSERT INTO Orders VALUES
(201, 1, '2025-01-10'),
(202, 1, '2025-02-13'),
(203, 2, '2025-03-23');
#7.Write a query to show customer names and their order details using INNER JOIN.
SELECT c.customer_name, o.order_id, o.order_date
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

#STUDENTS Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);
INSERT INTO Students VALUES
(1, 'Amit'),
(2, 'Neha'),
(3, 'Rahul');

#COURSES Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO Courses VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Power BI');

#ENROLLMENTS Table
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT
);
INSERT INTO Enrollments VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 101);

#8.Write a query to display students who have enrolled in courses using JOIN.
SELECT s.student_name, c.course_name
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id;

#SUPPLIERS Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Suppliers VALUES
(1, 'GEM Traders', 'Chennai'),
(2, 'A2S Suppliers', 'Mumbai'),
(3, 'Fresh Mart', 'Chennai');

#PRODUCTS Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    supplier_id INT
);
INSERT INTO Products VALUES
(101, 'Mobile', 1),
(102, 'Powerbank', 2),
(103, 'Laptop', 3);

#9.Write a query to retrieve product names and supplier names for products supplied by suppliers located in Chennai.
SELECT p.product_name, s.supplier_name
FROM Products p
JOIN Suppliers s
ON p.supplier_id = s.supplier_id
WHERE s.city = 'Chennai';

#10.Write a query to find departments where more than 3 employees work, and display:
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees, AVG(e.salary) AS avg_salary,
MAX(e.salary) AS highest_salary
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 3;


