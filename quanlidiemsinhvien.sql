create table khoa(
makhoa int primary key,
tenkhoa varchar(50));
create table lop(
malop int primary key,
tenlop varchar(50),
makhoa int ,
 foreign key (makhoa)references khoa(makhoa)
);
create table sinhvien (
maSV int  primary key,
hoten varchar(50) not null,
ngaysinh date not null,
hocbong  varchar(50),
gioitinh varchar(50),
malop int ,
 foreign key (malop)references lop(malop)
);
create table monhoc(
maMH int primary key,
tenMH varchar(50),
SoTiet int );
create table KetQua(
DiemThi double ,
maSv int,
maMH int,
primary key(masv,mamh),
 foreign key (maSv)references sinhvien(maSV),
foreign key (maMH)references monhoc(maMH));
-- cau5
select * from quanlydiemsinhvien.sinhvien where hoten =  ‘tran’;
-- cau6
select * from quanlydiemsinhvien.sinhvien where gioitinh = ‘nu’ and hocbong = ‘Co’;
-- cau7
SELECT *
From quanlydiemsinhvien.sinhvien
WHERE (gioitinh = ‘nu’ and hocbong = ‘Co’)
OR (hocbong = ‘Co’);
-- cau8
select * from quanlydiemsinhvien.sinhvien where  YEAR(ngaysinh) > 1978 and YEAR(ngaysinh) < 1985 ;
-- cau9
select * from quanlydiemsinhvien.sinhvien order by maSV ;
-- cau10
select * from quanlydiemsinhvien.sinhvien order by hocbong  desc ;
-- cau12
select * from quanlydiemsinhvien.sinhvien sinhvien
join Lop on sinhvien.maLop = Lop.maLop
join khoa khoa on Lop.maKhoa = khoa.maKhoa
where sinhvien.hocBong is not null and khoa.maKhoa = 4;
-- cau14
select lop.tenlop ,count(sinhvien.maSV) as 'So sinh vien' from lop join sinhvien on lop.malop = sinhvien.malop group by lop.tenlop;

-- cau15
select khoa.tenkhoa ,count(sinhvien.maSV) as 'So sinh vien' from khoa join lop on khoa.makhoa = lop.makhoa join sinhvien on lop.malop = sinhvien.malop group by khoa.tenkhoa;

-- cau16
select khoa.tenkhoa ,count(sinhvien.maSV) as 'So sinh vien nu ' from khoa join lop on khoa.makhoa = lop.makhoa join sinhvien on lop.malop = sinhvien.malop where sinhvien.gioitinh = 'nu' group by khoa.tenkhoa;

-- cau17
select lop.tenLop, sum(sinhvien.hocBong) as 'tong tien hoc bong' from lop
join SinhVien sinhvien on sinhvien.maLop = Lop.maLop
group by lop.tenLop;

-- cau18
select khoa.tenKhoa, sum(sinhvien.hocBong) as'tong tien hoc bong'   from sinhVien sinhvien
join Lop on sinhvien.maLop = Lop.maLop
join khoa khoa on Lop.maKhoa = khoa.maKhoa
group by khoa.tenKhoa;
-- cau19
select k.maKhoa,k.tenKhoa, count(sv.maSV) as 'SoLuong' from sinhVien sv
join Lop on sv.maLop = Lop.maLop
join khoa k on Lop.maKhoa = k.maKhoa
group by k.maKhoa,k.tenKhoa
having soLuong > 100;
-- cau20
select k.maKhoa,k.tenKhoa, count(sv.maSV) as 'SoLuong' from sinhVien sv
join Lop on sv.maLop = Lop.maLop
join khoa k on Lop.maKhoa = k.maKhoa
where sv.gioiTinh = 'nu'
group by k.maKhoa,k.tenKhoa
having soLuong > 50;
-- cau22
select * from sinhVien
group by maSV, hoTen
having hocBong >= all (select hocBong from sinhVien);
-- cau23
select sv.*, kq.diemthi,m.tenMH from sinhVien sv
join KetQua kq on sv.maSV = kq.maSV
join monHoc m on kq.maMH = m.maMH
group by sv.maSV, sv.hoTen
having kq.diemthi >= all (select diemthi from ketQua where maMH = 1);


