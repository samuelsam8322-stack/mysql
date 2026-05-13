show databases;
create database cricketers;
create table players
(s_no int, name varchar(40), team varchar(20), score int);
use cricketers;
show tables;
insert into players values(1,"M.S.Dhoni","CSK",145),
(2,"Virat Kohli","RCB",119),(3,"Hardik Pandya","MI",140);
desc players;
insert into players values(4,"K.L.Rahul","PKBS",113);
select * from players;
truncate table players;
drop table players;
drop database cricketers;

