show databases;
create database morning_students;
create table student 
(id int, name varchar(30), age int, city varchar(50));
use morning_students;
show tables;
insert into student values (1,"Sam",24,"pondy"),
(2,"Narendra",27,"Pondy"),(3,"Vishal", 18,"Pondy");
insert into student values (5,"Alice",23,"Spain");
desc student;
select * from student;

truncate table student;
drop table student;
drop database morning_students;

alter table student
add column mobile int;

alter table student
drop column mobile;

alter table student
rename column name to f_name;

desc student;

alter table student    			# (ALTER COLUMN)
modify column city varchar(50);


update student					#(CHANGE OR MODIFY ROWS)
set age = 18
where s_no = 3;

update student
set city = "Bangalore";

delete from student
where s_no = 1;

select * from student;

delete from student;

select * from employees
where salary >60000;

#									ctas
create table high_salary as 
select * from employees
where salary >60000;

select * from high_salary;

show tables;

#									cte - comman table expression
with salary2 as 
(select * from employees
where salary >60000)
select * from salary2;

select * from salary2;

#									tempapory table
create temporary table salary3 as
select * from employees
where salary >60000;

select * from salary3;
use morning_class;

-- 									and, or, not

select * from student;

delete from student
where s_no = 2 and f_name = "vishal";

select * from employees
where not department = "IT";

select * from employees
where first_name like 'A_i%';
#% - many, _ one

select * from employees
where commission is not null;

select * from employees
where department = "IT"
order by salary desc
limit 4;

select * from employees
order by salary desc
limit 1 offset 2;

#							SQL FUNCTIONS
#				STRING FUNCTION:


#What is sql function?
#SQL funtions are built-in tools in SQL that helps you perform operations on data.

#What is String?
#String functions are used to work with text (characters) in a database.
#eg: name = 'narendra' , city =  'pondy'

#String Functions:
select upper ('narendra');
#converts upper text to capital letters

select lower ('NARENDRA');
#converts text to small letters

select length ('narendra');
#counts the number of characters

select concat ('narendra','','analyst');
#join two or more strings - eg: frist name and last name in one column

select substr('narendra', 1, 4);
#extracts the part of the string, like where to start and where to end

select substring_index('watermelon,orange,mango', ',' ,1);
#“SUBSTRING_INDEX() is used to split a string and return a part of it based on a specified symbol

select trim(' hello ');
#removes the extra spaces

select replace ('hello world', 'world', 'sql');
#replace text with another text

select instr('narendra','e');
#find the position of the character

# EXTRACT FROM
select substring_index('aaple,banana,cherry',',',-1);

#Where we use string functions?
#		In real-time data analyst work cleaning messy data, formatting names, 
# searching text,combining columns(first_name and last_name).


#					TIME & DATE FUNCTIONS:

# Date time function():
# 		SQL provides many built-in date and time functions to handle 
# dates, times and timestamps. These functions vary slightly 
# depending on the database.

# current date and time:
select now();
select current_timestamp();
select sysdate();
select current_date();
select current_time();


# date arithmetic:
select adddate(curdate(),10);
select subdate(curdate(), interval 20 day);


# difference b/w dates;
select datediff('2024-03-23','2024-03-19');


# Formatting dates & time:
select date_format(curdate(), '%d-%M-%Y');
select time_format(curtime(), '%H:%i:%s %p');


# Extract parts of date:
select month('2026-04-01');
select day('2026-04-01');


select dayname('2026-04-27'+interval 10 day);
select CAST('2026-03-21' AS DATE);


# 						MATH FUNCTION:

select abs(-100);

select ceil(10.1);
select floor(10.9);
select round(10.1);
select mod(10,2);
select sqrt(16);
select pow(10,2);

select * from employees;

select rand() from employees;

select * from employees
where first_name regexp '^a';

select * from employees
where first_name regexp 'i$';

select * from employees
where first_name regexp '[^rav]';

select coalesce(commission, 0) from employees;


#					CONSTRAINTS

# 	Definition:
#   A constraint is a restriction placed on a column or table to 
#enforce data integrity.

# 1.NOT NULL
#       Ensures a column cannot have NULL (empty) values.

# 2.UNIQUE
#       Ensures all values in a column are different.

# 3. DEFAULT
#       Assigns a default value if none is provided.

# 4. CHECK
#		Ensures values satisfy a specific condition.

# 5. PRIMARY KEY
#		Uniquely identifies each record.
#		Combination of NOT NULL + UNIQUE

# 6. FORIEGN KEY
#		Links one table to another.
#		Maintains referential integrity.



#						JOINs

# WHAT IS JOINs?
#		JOINs are used to combine data from two or more tables based on a related 
# column (usually a key).

#Types of JOINs:

-- 1. INNER JOIN
-- Returns only matching records from both tables
--     Common data only
--     
-- 2. LEFT JOIN (LEFT OUTER JOIN)
-- Returns all records from left table + matching from right
--    Unmatched right values → NULL

-- 3. RIGHT JOIN (RIGHT OUTER JOIN)
-- Returns all records from right table + matching from left

-- 4. FULL JOIN (FULL OUTER JOIN)
-- Returns all records from both tables
--    Unmatched values → NULL


create database joins;
use joins;

create table employee_s (emp_id int, name varchar(25), dept_id int);
insert into employee_s values
(1,'Alice', 101),
(2,'Bob',104),
(3,'Charlie',102),
(4,'Dev',103),
(5,'Rahul',103);

create table dept_ment (dept_id int, dept_name varchar(10));
insert into dept_ment values
(101, 'HR'),(102,'FINANCE'),(103,'IT'),(104,'MARKETING'),(105,'SALES');

select * from employee_s;
select * from dept_ment;
drop table dept_ment;
drop table employee_s;

-- 1. INNER JOIN:
--  Returns only matching records
SELECT e.name, d.dept_name
FROM employee_s e
INNER JOIN dept_ment d
ON e.dept_id = d.dept_id;


-- 2. LEFT JOIN:
--    All records from left table + matching from right
SELECT e.name, d.dept_name
FROM employee_s e
LEFT JOIN dept_ment d
ON e.dept_id = d.dept_id;


-- 3. RIGHT JOIN:
--   All records from right table + matching from left
SELECT e.name, d.dept_name
FROM employee_s e
RIGHT JOIN dept_ment d
ON e.dept_id = d.dept_id;


-- 4. FULL JOIN (FULL OUTER JOIN):
--   All records from both tables
SELECT e.name, d.dept_name
FROM employee_s e
LEFT JOIN dept_ment d
ON e.dept_id = d.dept_id

UNION

SELECT e.name, d.dept_name
FROM employee_s e
RIGHT JOIN dept_ment d
ON e.dept_id = d.dept_id;



# 						SUB QUERY
#		 A Subquery is a query nested inside another query
# (inside SELECT, FROM, WHERE).

# TYPES:

-- Single-row subquery -  returns one value
-- Multi-row subquery  →  returns multiple values (IN, ANY, ALL)
-- Correlated subquery →  depends on outer query (runs repeatedly)


# 1.Subquery in SELECT Clause							# using SELECT
# Display employee name with department average salary:

SELECT emp_name,
       (SELECT AVG(salary)
        FROM Employees e2
        WHERE e2.dept_id = e1.dept_id) AS dept_avg_salary
FROM Employees e1;


# 2.Subquery in FROM Clause (Derived Table)				# using FROM
# Find average salary of each department:

SELECT dept_id, avg_salary
FROM (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
) AS dept_avg;


#3. Single-Row Subquery (in WHERE)					    # using WHERE
#Find employees earning more than the average salary:

SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


# 4.Subquery with IN (Multiple Rows)					# using IN
#Find employees working in departments located in 'Chennai':

SELECT emp_name
FROM Employees
WHERE dept_id IN (
    SELECT dept_id
    FROM Departments
    WHERE location = 'Chennai'
);


# 5.Subquery with ANY									# using ANY
# Find employees earning more than any employee in department 10:

SELECT emp_name
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE dept_id = 10
);


# 6.Subquery with ALL									# using ALL
#Find employees earning more than all employees in department 10:

SELECT emp_name
FROM Employees
WHERE salary > ALL (
    SELECT salary
    FROM Employees
    WHERE dept_id = 10
);


# 7.Subquery with EXISTS								# using EXISTS
# Find employees who have at least one record in the Projects table:

SELECT emp_name
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Projects p
    WHERE e.emp_id = p.emp_id
);


# 8.Correlated Subquery			# depends on outer query		(WINDOWS FUNCTION)
# Find employees earning more than their department average:

SELECT emp_name, salary
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
);


#							Filtering & Conditions
#	Used to narrow down data:

-- AND, OR, NOT
-- IN, BETWEEN, LIKE
-- IS NULL, IS NOT NULL

#															(WINDOWS FUNCTION)

#						Case Statements (Conditional Logic)
#   Used like IF-ELSE:

SELECT emp_name,
CASE 
  WHEN salary > 50000 THEN 'High'
  ELSE 'Low'
END AS salary_category
FROM Employees;


#						CTE (Common Table Expressions)
#    Makes complex queries readable:

WITH avg_salary AS (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM Employees
    GROUP BY dept_id
)
SELECT * FROM avg_salary;