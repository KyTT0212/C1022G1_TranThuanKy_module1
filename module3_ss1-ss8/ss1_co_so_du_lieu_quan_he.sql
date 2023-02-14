create database student_management;
use student_management;

create table student(
id int,
`name` varchar(50),
age int,
country varchar(50)
);

create table class(
id int,
`name` varchar(50)
);

insert into class (id,name) values (1,"C1022G1");
insert into class (id,name) values (2,"C1122G1");

create table teacher(
id int,
`name` varchar(50),
age int,
country varchar(50)
);