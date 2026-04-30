show databases;
create database customers;
use customers;

create table customer_details(
id INT PRIMARY KEY,
name VARCHAR(40),
email VARCHAR(100),
order_date DATE,
start_date DATE,
end_date DATE,
salary DECIMAL(10,3)
);

INSERT INTO customer_details VALUES
(1, ' Arun ', 'arun@gmail.com', '2026-04-20', '2026-04-01', '2026-04-10', 34000.567),
(2, 'Alice', 'alice@yahoo.com', '2026-04-22', '2026-04-05', '2026-04-20', 38000.456),
(3, 'Bessy', 'bessy@gmail.com', '2026-04-25', '2026-04-10', '2026-04-25', 54000.789),
(4, 'Christoper', 'christoper@gmail.com', '2026-04-27', '2026-04-12', '2026-04-28', 56000.123),
(5, 'Dube', 'dube@hotmail.com', '2026-05-01', '2026-04-15', '2026-04-30', 40000.999);

SELECT * from customer_details;


#1.Convert names to uppercase
select upper(name) as upper_name from customer_details;

#2.Convert names to lowercase
select lower(name) as lower_name from customer_details;

#3.Get first 3 letters of name
select substr(name , 1,3) from customer_details;

#4.Find length of each name
select name, length(name) from customer_details;

#5.Remove spaces from both sides
select trim(name) as cleaned_name from customer_details;

#6.Replace word in string (gmail → yahoo)
select replace(email, 'gmail.com' , 'yahoo.com') as updated_email from customer_details;

#7.Extract domain from email
select substring_index(email, '@', -1) as domain from customer_details;

#8.Extract username from email
select substring_index(email, '@', 1) as username from customer_details;

#9.Show current date
select current_date();

#10.Show current date and time
select now();

#11.Extract year from date
select year(order_date) as year from customer_details;

#12.Extract month from date
select month(order_date) as month from customer_details;

#13.Extract day name
select dayname('2026-04-27') as day_name;

#14.Add 7 days to date
select date_add(order_date, interval 7 day) as new_date from customer_details; 

#15.Find difference between two dates
select datediff(end_date, start_date) as date_difference from customer_details;

#NUMERIC FUNCTIONS:-
#16.Round salary (nearest integer)
select round(salary) as round_salary from customer_details;

#17.Round salary to 2 decimal places
select round(salary,2) as rounded_salary from customer_details;

#18.Generate random number (0 to 1)
select rand();

#AGGREGATE FUNCTIONS:-
#19.Find highest and lowest salary
select max(salary) as high_salary, 
min(salary) as low_salary from customer_details;