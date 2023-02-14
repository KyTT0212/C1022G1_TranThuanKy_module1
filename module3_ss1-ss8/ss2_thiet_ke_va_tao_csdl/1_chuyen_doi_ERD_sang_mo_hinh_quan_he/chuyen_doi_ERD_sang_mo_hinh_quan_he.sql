create database demo2;
use demo2;


create table nhacungcap(
mancc int primary key,
tenncc varchar(25),
diachi varchar(30)
);


create table sdt(
sdt int,
nhacungcap_mancc int,
foreign key(nhacungcap_mancc) references nhacungcap(mancc)
);


create table phieuxuat(
sopx int primary key auto_increment,
ngayxuat date
);


create table vattu(
mavtu int primary key auto_increment,
tenvtu varchar(20)
);

create table ctphieuxuat(
dgxuat varchar(25),
slxuat int,
phieuxuat_sopx int,
vattu_mavtu int,
foreign key ( phieuxuat_sopx) references phieuxuat(sopx),
foreign key (vattu_mavtu) references vattu(mavtu)
);


create table phieunhap(
sopn int primary key auto_increment,
ngaynhap date
);


create table ctphieunhap(
dgnhap varchar(20),
slnhap int,
vattu_mavtu int,
phieunhap_sopn int,
foreign key(vattu_mavtu) references vattu(mavtu),
foreign key(phieunhap_sopn) references phieunhap(sopn)
);

create table dondathang(
maddh int primary key auto_increment,
ngaydh date,
nhacungcap_mancc int,
foreign key(nhacungcap_mancc) references nhacungcap(mancc)
);

create table ctdondathang(
vattu_mavtu int,
dondathang_maddh int,
foreign key (vattu_mavtu) references vattu(mavtu),
foreign key (dondathang_maddh) references dondathang(maddh)
);
