-- Bước 1
create database demo_ss5;
use demo_ss5;
-- Bước 2
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(30) NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    product_price INT NOT NULL,
    product_amount INT NOT NULL,
    product_description VARCHAR(50),
    product_status VARCHAR(50)
);
insert into Products values 
(1,'A001','TAO',14000,15,'DO','NEW'),
(2,'A015','CAM',17550,8,'VANG','NEW'),
(3,'A021','DAO',27000,22,'HONG','NEW');
-- Bước 3
SELECT 
    *
FROM
    Products;
create unique index index_product_code on Products(product_code);
create index index_product_name_and_price on Products(product_name,product_price);
explain select * from Products
where product_code = 'A001';
explain select * from Products
where product_name = 'TAO';
explain select * from Products
where product_price = 14000;
drop index index_product_code on Products;
drop index index_product_name_and_price on Products;
-- Bước 4
CREATE VIEW view_products (product_code , product_name , product_price , product_status) AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;
SELECT 
    *
FROM
    view_products;
UPDATE view_products 
SET 
    product_price = 25000
WHERE
    product_name = 'DAO';
-- Bước 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // create procedure information_products() begin 
select 
  * 
from 
  products;
end // delimiter;
call information_products;
-- Tạo store procedure thêm một sản phẩm mới
delimiter // create procedure add_products(
  product_code varchar(50), 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(50), 
  product_status varchar(50)
) begin insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    product_code, product_name, product_price, 
    product_amount, product_description, 
    product_status
  );
end // delimiter;
call add_products(
  'A077', 'HONG', 11000, 
  8, 'HONG', 'NEW'
);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure update_by_id(
  id int, 
  product_code varchar(50), 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(50), 
  product_status varchar(50)
) begin 
update 
  products 
set 
  products.product_code = product_code, 
  products.product_name = product_name, 
  products.product_price = product_price, 
  products.product_amount = product_amount, 
  products.product_description = product_description, 
  products.product_status = product_status 
where 
  products.id = id;
end // delimiter;
call update_by_id (2,'A015', 'CAM', 320, 4,'CAM', 'OLD');
-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_by_id (id int) begin 
delete from 
  products 
where 
  products.id = id;
end // delimiter;
call delete_by_id(3);

