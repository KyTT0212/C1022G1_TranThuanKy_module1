create database demo3;
use demo3;

create table customer(
cid int primary key,
cname varchar(25),
cage int
);


create table `order`(
oid int not null primary key,
odate date,
ototalprice int,
cid int,
foreign key(cid) references customer(cid)
);


create table product(
pid int not null primary key,
pname varchar(25),
pprice int
);

create table orderdail (
oid int not null,
foreign key(oid) references `order`(oid),
pid int not null,
foreign key(pid) references product(pid),
primary key(oid,pid),
odqty varchar(30)
);