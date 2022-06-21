create table students (
studentId int  primary key,
studentName varchar(50) not null,
age int not null,
email varchar(50));

create table subjects(
subjectId int primary key,
subjectName varchar(50));

create table marks(
mark int,
subjectId int,
studentId int,
 foreign key (subjectId)references subjects(subjectId),
foreign key (studentId)references students(studentId));
drop table marks;

create table classes(
classId int auto_increment primary key,
className varchar(50));

create table classStudent(
studentId int ,
classId int,
foreign key(studentId)references students(studentId),
foreign key(classId)references classes(classId));
insert into Students values(1,'Nguyen Quang Anh', 18,'an@yahoo.com'),
(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),
(3,'Nguyen Van Quyen', 19,'quyen'),
(4,'Pham Thanh Binh', 25,'binh@com'),
(5,'Nguyen Van Tai Em', 30,'taiem@sport.vn');
insert into classes values
(1,'C0706L'),
(2,'C0708G');
insert into classstudent values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);

insert into subjects values
(1,'SQL'),
(2,'Java'),
(3,'C'),
(4,'visual basic');

insert into marks values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);
-- Cau 1:
select *from students;
-- cau2:
select *from classes;
-- cau3
select avg(mark) as DiemTB from Mark;
-- cau4
select SubjectName from Subject where SubjectID =(select SubjectID from mark where Mark = (select max(mark) from mark));
-- cau5
select  mark,count(mark) s1 from mark group by mark ;
select stt, mark from mark order by mark desc;
-- cau6
alter table subject modify column SubjectName nvarchar(255) not null;
-- cau7
update subject set `subjectName` = (select subjectName subject where subjectId = 1);
-- cau8
alter table Students 
add constraint check(Age>15 and Age <50); 
-- cau9
alter table students
add status int not null ;
-- cau10
DELETE FROM students WHERE studentId = 1;
-- cau11
alter table Students 
add column Status bit default 1;
-- cau12
update Students
set Status=0
where StudentID>0;