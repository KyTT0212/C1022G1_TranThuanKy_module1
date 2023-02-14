create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key auto_increment,
c_name varchar(45),
c_age int 
);

insert into customer(c_id,c_name,c_age) value (1,"Minh Quan",10);
insert into customer(c_id,c_name,c_age) value (2,"Ngoc Oanh",20);
insert into customer(c_id,c_name,c_age) value (3,"Hong Ha",50);

create table `order`(
o_id int primary key auto_increment,
c_id int,
foreign key(c_id) references customer(c_id),
o_date date,
o_total_price double
);

insert into `order`(o_id,c_id,o_date,o_total_price) value (1,1,"2006/3/21",null);
insert into `order`(o_id,c_id,o_date,o_total_price) value (2,2,"2006/3/23",null);
insert into `order`(o_id,c_id,o_date,o_total_price) value (3,1,"2006/3/16",null);

create table product (
p_id int primary key auto_increment,
p_name varchar(45),
p_price double
);

insert into product value (1,"May Giat",3);
insert into product value (2,"Tu Lanh",5);
insert into product value (3,"Dieu Hoa",3);
insert into product value (4,"Quat",1);
insert into product value (5,"Bep Dien",2);

create table order_detail(
primary key(o_id,p_id),
o_id int ,
foreign key(o_id) references `order`(o_id),
p_id int,
foreign key(p_id) references product(p_id),
od_qty varchar(45)
);

insert into order_detail value (1,1,3);
insert into order_detail value (1,3,7);
insert into order_detail value (1,4,2);
insert into order_detail value (2,1,1);
insert into order_detail value (3,1,8);
insert into order_detail value (2,5,4);
insert into order_detail value (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date,o_total_price from `order`;



-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name as " danh sách các khách hàng đã mua hàng", o_date as "thời gian sản phẩm được mua bởi khách", p_name as "sản phẩm khách mua"  from order_detail
inner join product on order_detail.p_id = product.p_id
inner join `order` on order_detail.o_id = `order`.o_id
inner join customer on customer.c_id = customer.c_id;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_name from customer
left join `order` on customer.c_id = `order`.c_id
where `order`.c_id is null;


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, `order`.o_date, order_detail.od_qty * product.p_price as o_totalprice from order_detail
inner join `order` on order_detail.o_id = `order`.o_id
inner join product on order_detail.p_id = product.p_id


