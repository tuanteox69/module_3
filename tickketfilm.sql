
create table tblPhim(
PhimID int not null primary key,
Ten_phim varchar(30) not null,
Loai_phim varchar(25) not null,
Thoi_gian int(4)
);
create table tblPhong (
PhongID  int not null primary key,
Ten_phong  nvarchar(20),
Trang_thai tinyint 
);
create table tblGhe (
GheID  int primary  key,
PhongID int , 
 foreign key (PhongID) references tblPhong(PhongID),
 So_ghe varchar(10)
);

create table tblVe (
PhimID  int, 
foreign key (PhimID) references tblphim(PhimID),
GheID  int,
 foreign key (GheID) references tblGhe(GheID),
Ngay_chieu  DATE,
Trang_thai nvarchar(20),
primary key(PhimID,GheID)
);
-- cau2
select * from tblPhim order by thoi_gian; 
-- cau3
 select * from tblPhim where thoi_gian= (select max(thoi_gian) from tblphim); 
-- cau4
 select * from tblPhim where thoi_gian= (select min(thoi_gian) from tblphim); 
-- cau5
 select * from tblghe where So_ghe like 'A%' ; 
-- cau6
alter table tblphong change column Trang_thai status nvarchar(25);
-- cau7
update tblphong set status = if(status = 0 ,'dang sua',if(status = 1,'dang su dung','Unknow' )) where PhongID > 0; 
-- cau8
select * from tblPhim where length(tblPhim.Ten_phim) > 15 and length(tblPhim.Ten_phim) <25;
-- cau9
select concat(Ten_phong,'/ ',status) as 'Trạng thái phòng chiếu' from tblPhong ;
-- cau10
create table tblRank (
select ten_phim,thoi_gian from tblphim order by Ten_phim
);
alter table tblRank add column stt int primary key AUTO_INCREMENT;
-- cau11
-- a
alter table tblPhim  add column Mo_ta nvarchar(255);
-- b
update tblPhim  set Mo_ta =(concat('Đây là bộ phim thể loại ',Loai_phim)) where phimID>0 ;
-- c
SELECT * FROM ticketfilm.tblphim;
-- d
update tblPhim  set Mo_ta =(concat('Đây là film thể loại ',Loai_phim)) where phimID>0 ;
-- e
SELECT * FROM ticketfilm.tblphim;
-- cau12


