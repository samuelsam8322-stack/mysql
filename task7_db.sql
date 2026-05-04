show databases;
#Task:-


create database company;
use company;
create table Employees (emp_id int primary key,emp_name varchar(50),dept_id int,salary int);
insert into Employees values
(1, 'Alice',3,40000),
(2, 'Paul Walker',1,70000),
(3, 'Dominic',1,65000),
(4, 'Nigil',1,50000),
(5, 'Helen',2,20000);
insert into Employees values (6, 'Natasha',null,60000);

create table Departments (dept_id int,dept_name varchar(20),location varchar(20));
insert into Departments values
(3, 'Gamers', 'Korea'),
(1, 'Racers', 'London'),
(2, 'Actors', 'Germany');

select * from Employees;
select * from Departments;

#1.Write a query to find employees whose salary is greater than the average salary of all 
# employees using a single-row subquery in where.
select emp_name, salary
from Employees
where salary > (select avg(salary) from Employees);

#2.Write a query to display employee names who work in departments located in London using IN 
# with a subquery in where.
select emp_name
from Employees
where dept_id in (
  select dept_id from Departments where location = 'London'
);

#3.Write a query to find employees whose salary is greater than ANY salary of employees in 
# department 3 using ANY operator.
select emp_name, salary
from Employees
where salary > any (
  select salary from Employees where dept_id = 3
);

#4.Write a query to find employees whose salary is greater than ALL salaries of employees in department 
# 2 using ALL operator.
select emp_name, salary
from Employees
where salary > all (
  select salary from Employees where dept_id = 2
);

#5.Write a query to display employees who are not assigned to any department using NOT IN with a subquery.
SELECT emp_name
FROM Employees
WHERE dept_id NOT IN (
    SELECT dept_id 
    FROM employees 
    WHERE dept_id is NULL
);

#6.Write a query to display each employee name along with the overall average salary using a subquery
# in SELECT.
select emp_name,
       salary,
       (select avg(salary) from Employees) as avg_salary
from Employees;

#7.Write a query to display each employee name along with the maximum salary in the company using a scalar subquery in SELECT.
select emp_name,
       salary,
       (select max(salary) from Employees) as max_salary
from Employees;

#8.Write a query to find employees who earn the highest salary in each department using a correlated subquery in WHERE.
select emp_name, dept_id, salary
from Employees e
where salary = (
  select max(salary)
  from Employees
  where dept_id = e.dept_id
);

#9.Write a query to display departments and their average salaries using a subquery in FROM.
SELECT d.dept_name, avg_sal
FROM (
  SELECT dept_id, AVG(salary) AS avg_sal
  FROM Employees
  GROUP BY dept_id
) e
JOIN Departments d
ON e.dept_id = d.dept_id;

#10.Write a query to find employees whose salary is equal to the minimum salary in the company using a single-row subquery.
select emp_name, salary
from Employees
where salary = (select min(salary) from Employees);

#11.Write a query to find employees whose department ID matches any department that has more than 3 employees using ANY.
select emp_name
from Employees
where dept_id = any (
  select dept_id
  from Employees
  group by dept_id
  having count(*) > 3
);

#12.Write a query to display employee names who work in the same department as 'Dominic' 
# using a subquery in WHERE.
SELECT emp_name
FROM Employees
WHERE dept_id IN (
  SELECT dept_id 
  FROM Employees 
  WHERE emp_name = 'Dominic'
);