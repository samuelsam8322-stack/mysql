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

alter table student
modify column city varchar(50);


update student
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
