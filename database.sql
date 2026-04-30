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

alter table student    # (ALTER COLUMN)
modify column city varchar(50);


update student			#(CHANGE OR MODIFY ROWS)
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

#ctas
create table high_salary as 
select * from employees
where salary >60000;

select * from high_salary;

show tables;

#cte - comman table expression
with salary2 as 
(select * from employees
where salary >60000)
select * from salary2;

select * from salary2;

#tempapory table
create temporary table salary3 as
select * from employees
where salary >60000;

select * from salary3;
use morning_class;

#and, or, not

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
#		STRING FUNCTION:


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


#		TIME & DATE FUNCTIONS:

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


# 		MATH FUNCTION:

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




