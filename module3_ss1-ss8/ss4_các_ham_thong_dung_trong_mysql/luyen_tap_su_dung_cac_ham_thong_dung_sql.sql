use quan_ly_sinh_vien;


-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject` 
where credit = (select max(credit) from `subject`);


-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select `subject`.*, mark.mark from `subject` 
inner join mark on subject.sub_id = mark.sub_id
where mark.mark = ( select max(mark) from mark);


-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg(mark.mark) from student 
inner join mark on student.student_id = mark.student_id
group by student.student_id
order by avg(mark.mark) desc;