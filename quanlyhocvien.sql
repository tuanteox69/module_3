create table Test(
TestID int primary key,
NameTest varchar(255)
);
create table Student(
RN int primary key,
Name varchar(60),
age int,
status varchar(255)
);

create table StudentTest(
RN int,
TestID int,
date date,
Mark double,
foreign key ( RN ) references student(RN ),
foreign key ( TestID ) references test(TestID )
);

insert into Student values 
(1,'Nguyen Hong Ha',20, null),
(2,'Truong Ngoc Anh',30,null),
(3, 'Tuan Minh',25,null),
(4,'Dan Truong',22,null);

insert into Test values 
(1,'EPC'),
(2,'DWMX'),
(3,'SQL1'),
(4,'SQL2');

insert into StudentTest values
(1,1,'2006/7/17',8),
(1,2,'2006/7/18',5),
(1,3,'2006/7/19',7),
(2,1,'2006/7/17',7),
(2,2,'2006/7/18',4),
(2,3,'2006/7/19',2),
(3,1,'2006/7/17',10),
(3,3,'2006/7/18',1);

-- câu 2
select student.Name as 'Student name',Test.nameTest as'Test Name', sdt.Mark,sdt.date from student
join studenttest as `sdt` on sdt.RN=student.RN
join Test on Test.TestID=sdt.TestID;

-- câu 3
select student.RN as 'Student RN',student.name as'Student Name', student.age from student
where RN not in (select RN from studenttest);

-- câu 4
select student.Name as 'Student name',Test.nameTest as'Test Name', sdt.Mark,sdt.date from student
join studenttest as `sdt` on sdt.RN=student.RN
join Test on Test.TestID=sdt.TestID
where sdt.mark<5;

-- câu 5
select name,avg(mark) from student
join studenttest as `sdt` on sdt.RN=student.RN
group by student.name
order by avg(mark) desc;

-- câu 6
create view diemtb as select name,avg(mark) as avgmark from student
join studenttest as `sdt` on sdt.RN=student.RN
group by student.name
order by avg(mark) desc;
select name,max(avgmark) from diemtb;


-- câu 7: 
select nameTest,max(mark) from 
studenttest as `stdt` 
join test on stdt.testID=test.testid
group by nameTest
order by nameTest;

-- câu 8
select name as `Student name`,nameTest as `Test Name` 
from student 
join StudentTest as `stdt` on Student.RN=stdt.RN
join Test on stdt.TestID=Test.TestID;

-- câu 9
update student set age = age + 1
where RN > 0;

-- câu 10
alter table student add column status varchar(255);

-- câu 11
create index ageIndex on student(age);
update student 
set status= 'Young'
where age < 30;

update student
set status='old'
where age >= 30;

-- câu 12
create view vwStudentTestList as (
select name,nameTest,mark,date from student 
join studenttest as `stdt` on stdt.RN=student.RN
join test on test.TestID= stdt.TestID
);
select * from vwStudentTestList;

-- câu 13
