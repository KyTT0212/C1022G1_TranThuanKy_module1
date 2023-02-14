create database case_study;
use case_study;

create table vi_tri(
mavt int primary key,
tenvt varchar(45)
);

create table trinh_do(
matd int primary key,
tentd varchar(45)
);

create table bo_phan(
mabp int primary key,
tenbp varchar(45)
);


create table nhan_vien(
manv int primary key,
tennv varchar(45) not null,
ngaysinh date not null,
socmnd varchar(45) not null,
luong double not null,
sdt varchar(45) not null,
email varchar(45),
diachi varchar(45),
mavt int,
foreign key(mavt) references vi_tri(mavt),
matd int,
foreign key(matd) references trinh_do(matd),
mabp int,
foreign key(mabp) references bo_phan(mabp)
);


create table loai_khach(
malk int primary key,
tenlk varchar(45)
);


create table khach_hang(
makh int primary key,
malk int,
foreign key(malk) references loai_khach(malk),
hoten varchar(45) not null,
ngaysinh date not null,
gioitinh bit not null,
socmnd varchar(45) not null,
sdt varchar(45) not null,
email varchar(45),
diachi varchar(45)
);


create table loai_dich_vu(
maldv int primary key,
tenldv varchar(45)
);


create table kieu_thue(
makt int primary key,
tenkt varchar(45)
);


create table dich_vu(
madv int primary key,
tendv varchar(45) not null,
dientich int,
chiphithue double not null,
songtoida int,
makt int,
foreign key(makt) references kieu_thue(makt),
maldv int,
foreign key(maldv) references loai_dich_vu(maldv),
tieuchuanphong varchar(45),
motatiennghikhac varchar(45),
dientichhoboi varchar(45),
sotang int,
dichvumienphidikem text
);

create table hop_dong(
mahd int primary key,
ngaylamhopdong datetime,
ngayketthuc datetime,
tiendatcoc double,
manv int,
foreign key(manv) references nhan_vien(manv),
makh int,
foreign key(makh) references khach_hang(makh),
madv int,
foreign key(madv) references dich_vu(madv)
);

create table dich_vu_di_kem(
madvdk int primary key,
tendvdk varchar(45),
gia double,
donvi varchar(10),
trangthau varchar(45)
);


create table hop_dong_chi_tiet(
mahdct int primary key,
mahd int,
foreign key(mahd) references hop_dong(mahd),
madvdk int,
foreign key(madvdk) references dich_vu_di_kem(madvdk),
soluong int
);