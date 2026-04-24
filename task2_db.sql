show databases;
create database employees_details;
use employees_details;

# 1.Create a table named employees with columns:
create table employees(emp_id INT primary key, name VARCHAR(25), department VARCHAR(25), 
salary INT, joining_date date );

INSERT INTO employees(emp_id,name,department,salary,joining_date) VALUES
(2201,"Ashok kumar","IT",68000,'2020-06-12'),
(2202,"Nithish Agarwal","HR",75000,'2018-09-21'),
(2203,"Xavier Brito","FINANCE",25000,'2019-12-3'),
(2204,"Neha Sharma","IT",65000,'2021-1-18'),
(2205,"Preethi Singh","MARKETING",45000,'2024-9-14');
show tables;
+
CREATE TABLE department(dept_id INT PRIMARY KEY, dept_name VARCHAR(40), 
location VARCHAR(40));
 INSERT INTO department(dept_id,dept_name,location) VALUES
 (1,'HR','Chennai'),
 (2,'IT','Hyderabad'),
 (3,'FINANCE','Mumbai'),
 (4,'MARKETING','Delhi'),
 (5,'SALES','Bangalore');
 SELECT * from department;
 
SELECT distinct(department) from employees;

SELECT * from employees WHERE salary > 50000 and department = 'IT';

SELECT * from employees WHERE name like'a%';

SELECT * from employees WHERE department = 'IT' or department = 'FINANCE';

SELECT * from employees order by salary desc;

SELECT * from employees order by salary desc limit 3;

SELECT * from employees order by salary limit 1 offset 3;

UPDATE employees 
SET salary = salary * 1.10
WHERE department = 'IT';

delete from employees 
where salary > 30000;

alter table employees 
add column email VARCHAR(50);

CREATE temporary table High_Salary_Employees as 
SELECT * from employees
where salary > 40000;

CREATE table High_Earners as 
SELECT * from employees  
Where salary > 45000;

with High_Salary_Employees as (SELECT * from employees where salary > 35000)
SELECT * from High_Salary_Employees; 

SELECT * from employees
Where (department = 'IT' and salary > 40000) or name like '%m';

SELECT * from employees
WHERE department NOT in ('HR') AND name LIKE '%a' AND salary between 30000 and 80000
ORDER BY salary ASC
LIMIT 3 OFFSET 1; 





