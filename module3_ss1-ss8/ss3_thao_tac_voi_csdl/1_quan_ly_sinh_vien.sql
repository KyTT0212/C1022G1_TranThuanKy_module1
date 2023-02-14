create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `status` BIT
);
insert into class (class_id,class_name,start_date,status) values (1,"A1","2008-12-20",1);
insert into class (class_id,class_name,start_date,status) values (2,"A2","2008-12-22",1);
insert into class (class_id,class_name,start_date,status) values (3,"B3",current_date,0);
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(30),
    phone VARCHAR(30),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);


insert into student (student_id,student_name,address,phone,`status`,class_id) values(1,"Hung","Ha noi", "0912113113",1,1);
insert into student (student_id,student_name,address,`status`,class_id) values(2,"Hoa","Hai phong", 1,1);
insert into student (student_id,student_name,address,phone,`status`,class_id) values(3,"Hung","Ha noi", "0123123123",0,2);



create table `subject`(
sub_id int primary key auto_increment,
sub_name varchar(30) not null,
credit int,
`status` bit default 1
);

insert into `subject`(sub_id,sub_name,credit,`status`) value (1,"CF",5,1);
insert into `subject`(sub_id,sub_name,credit,`status`) value (2,"C",6,1);
insert into `subject`(sub_id,sub_name,credit,`status`) value (3,"HDJ",5,1);
insert into `subject`(sub_id,sub_name,credit,`status`) value (4,"RDBMS",10,1);

create table mark(
mark_id int primary key auto_increment,
sub_id int not null,
foreign key(sub_id) references `subject`(sub_id),
student_id int not null,
foreign key(student_id) references student(student_id),
-- primary key(sub_id,student_id),
mark double,
examtimes bit default 1
);

insert into mark(mark_id,sub_id,student_id,mark,examtimes) value (1,1,1,8,1);
insert into mark(mark_id,sub_id,student_id,mark,examtimes) value (2,1,2,14,1);
insert into mark(mark_id,sub_id,student_id,mark,examtimes) value (3,2,1,12,1);
insert into mark(mark_id,sub_id,student_id,mark,examtimes) value (4,2,2,8,1);


-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date) like '12';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject` where credit>2 and credit<6;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student
set class_id = 2
where student_name = 'Hung';

-- Hiển thị StudentName
select student_name from student;

-- Hiển thị SubName
select sub_name from `subject`;

-- Hiển thị Mark
select * from mark;



select student_name,
sub_name,
mark
 from mark
join student on mark.student_id = student.student_id
join `subject` on mark.sub_id = `subject`.sub_id
order by  mark DESC, student_name;

drop database quan_ly_sinh_vien;

