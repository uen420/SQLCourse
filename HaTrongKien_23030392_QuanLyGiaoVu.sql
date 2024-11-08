--Creating and dropping the DB
use master
go
drop database QuanLyGiaoVu
go
create database QuanLyGiaoVu
go
use QuanLyGiaoVu
go

set dateformat mdy




--Table Khoa
create table Khoa
(
	MaKhoa varchar(4) not null,
	TenKhoa varchar(40) not null,
	NgayThanhLap smalldatetime not null,
	TruongKhoa char(4) null,

	constraint PK_Khoa primary key (MaKhoa)
)


--Table MonHoc
create table MonHoc
(
	MaMH varchar(10) not null,
	TenMH varchar(40) not null,
	TinChiLT tinyint not null,
	TinChiTH tinyint not null,
	MaKhoa varchar(4) not null,

	constraint PK_MonHoc primary key (MaMH),
	constraint FK_MonHoc foreign key (MaKhoa) references Khoa(MaKhoa)
)


--Table DieuKien
create table DieuKien
(
	MaMH varchar(10) not null,
	MaMH_Truoc varchar(10) not null,

	constraint PK_DieuKien primary key (MaMH,MaMH_Truoc)
)

--Table GiaoVien
create table GiaoVien
(
	MaGV char(4) not null,
	HoTen varchar(40) not null,
	HocVi varchar(10) not null,
	HocHam varchar(10) null,
	GioiTinh varchar(3) not null,
	NgaySinh smalldatetime not null,
	NgayVaoLam smalldatetime not null,
	HeSo numeric(4,2) not null,
	MucLuong money not null,
	MaKhoa varchar(4) not null,

	constraint PK_GiaoVien primary key (MaGV),
	constraint FK_GiaoVien foreign key (MaKhoa) references Khoa(MaKhoa),
	constraint Check_GioiTinh_GV check (GioiTinh in ('Nam','Nu')),
)


--Table Lop
create table Lop
(
	MaLop char(3) not null,
	TenLop varchar(40) not null,
	TruongLop char(5) not null,
	SiSo tinyint not null,
	MaGVCN char(4) not null,

	constraint PK_Lop primary key (MaLop)
)


--Table HocVien
create table HocVien
(
	MaHV char(5) not null,
	Ho varchar(40) not null,
	Ten varchar(10) not null,
	NgaySinh smalldatetime not null,
	GioiTinh varchar(3) not null,
	NoiSinh varchar(40) not null,
	MaLop char(3) not null,

	constraint PK_HocVien primary key (MaHV),
	constraint FK_HocVien foreign key (MaLop) references Lop(MaLop)
)


--Table GiangDay
create table GiangDay
(
	MaLop char(3) not null,
	MaMH varchar(10) not null,
	MaGV char(4) not null,
	HocKy tinyint not null,
	Nam smallint not null,
	TuNgay smalldatetime not null,
	DenNgay smalldatetime not null,

	constraint PK_GiangDay primary key (MaLop,MaMH),
	constraint FK_GiangDay_1 foreign key (MaLop) references Lop(MaLop),
	constraint FK_GiangDay_2 foreign key (MaMH) references MonHoc(MaMH),
	constraint FK_GiangDay_3 foreign key (MaGV) references GiaoVien(MaGV)
)


--Table KetQuaThi
create table KetQuaThi
(
	MaHV char(5) not null,
	MaMH varchar(10) not null,
	LanThi tinyint not null,
	NgayThi smalldatetime not null,
	Diem numeric(4,2) not null,
	KetQua varchar(10) not null,

	constraint PK_KetQuaThi primary key (MaHV,MaMH,LanThi),
	constraint FK_KetQuaThi_1 foreign key (MaHV) references HocVien(MaHV),
	constraint FK_KetQuaThi_2 foreign key (MaMH) references MonHoc(MaMH),
)



--Insertion of data

--Inserting into MonHoc
begin
alter table MonHoc
nocheck constraint all
insert into MONHOC values('THDC','Tin hoc dai cuong',4,1,'KHMT')
insert into MONHOC values('CTRR','Cau truc roi rac',5,0,'KHMT')
insert into MONHOC values('CSDL','Co so du lieu',3,1,'HTTT')
insert into MONHOC values('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
insert into MONHOC values('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
insert into MONHOC values('DHMT','Do hoa may tinh',3,1,'KHMT')
insert into MONHOC values('KTMT','Kien truc may tinh',3,0,'KTMT')
insert into MONHOC values('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
insert into MONHOC values('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
insert into MONHOC values('HDH','He dieu hanh',4,0,'KTMT')
insert into MONHOC values('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
insert into MONHOC values('LTCFW','Lap trinh C for win',3,1,'CNPM')
insert into MONHOC values('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
alter table MonHoc
check constraint all
end


--Inserting into GiangDay
begin
alter table GiangDay
nocheck constraint all
insert into GIANGDAY values('K11','THDC','GV07',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K12','THDC','GV06',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K13','THDC','GV15',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K11','CTRR','GV02',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K12','CTRR','GV02',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K13','CTRR','GV08',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K11','CSDL','GV05',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K12','CSDL','GV09',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K13','CTDLGT','GV15',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K13','CSDL','GV05',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K13','DHMT','GV07',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K11','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K12','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K11','HDH','GV04',1,2007,'1/2/2007','2/18/2007')
insert into GIANGDAY values('K12','HDH','GV04',1,2007,'1/2/2007','3/20/2007')
insert into GIANGDAY values('K11','DHMT','GV07',1,2007,'2/18/2007','3/20/2007')
alter table GiangDay
check constraint all
end


--Inserting into table Khoa
insert into KHOA values('KHMT','Khoa hoc may tinh','6/7/2005','GV01')
insert into KHOA values('HTTT','He thong thong tin','6/7/2005','GV02')
insert into KHOA values('CNPM','Cong nghe phan mem','6/7/2005','GV04')
insert into KHOA values('MTT','Mang va truyen thong','10/20/2005','GV03')
insert into KHOA values('KTMT','Ky thuat may tinh','12/20/2005','')


--Inserting into table GiaoVien
begin
alter table GiaoVien
nocheck constraint all
insert into GIAOVIEN values('GV01','Ho Thanh Son','PTS','GS','Nam','5/2/1950','1/11/2004',5.00,2250000,'KHMT')
insert into GIAOVIEN values('GV02','Tran Tam Thanh','TS','PGS','Nam','12/17/1965','4/20/2004',4.50,2025000,'HTTT')
insert into GIAOVIEN values('GV03','Do Nghiem Phung','TS','GS','Nu','8/1/1950','9/23/2004',4.00,1800000,'CNPM')
insert into GIAOVIEN values('GV04','Tran Nam Son','TS','PGS','Nam','2/22/1961','1/12/2005',4.50,2025000,'KTMT')
insert into GIAOVIEN values('GV05','Mai Thanh Danh','ThS','GV','Nam','3/12/1958','1/12/2005',3.00,1350000,'HTTT')
insert into GIAOVIEN values('GV06','Tran Doan Hung','TS','GV','Nam','3/11/1953','1/12/2005',4.50,2025000,'KHMT')
insert into GIAOVIEN values('GV07','Nguyen Minh Tien','ThS','GV','Nam','11/23/1971','3/1/2005',4.00,1800000,'KHMT')
insert into GIAOVIEN values('GV08','Le Thi Tran','KS','','Nu','3/26/1974','3/1/2005',1.69,760500,'KHMT')
insert into GIAOVIEN values('GV09','Nguyen To Lan','ThS','GV','Nu','12/31/1966','3/1/2005',4.00,1800000,'HTTT')
insert into GIAOVIEN values('GV10','Le Tran Anh Loan','KS','','Nu','7/17/1972','3/1/2005',1.86,837000,'CNPM')
insert into GIAOVIEN values('GV11','Ho Thanh Tung','CN','GV','Nam','1/12/1980','5/15/2005',2.67,1201500,'MTT')
insert into GIAOVIEN values('GV12','Tran Van Anh','CN','','Nu','3/29/1981','5/15/2005',1.69,760500,'CNPM')
insert into GIAOVIEN values('GV13','Nguyen Linh Dan','CN','','Nu','5/23/1980','5/15/2005',1.69,760500,'KTMT')
insert into GIAOVIEN values('GV14','Truong Minh Chau','ThS','GV','Nu','11/30/1976','5/15/2005',3.00,1350000,'MTT')
insert into GIAOVIEN values('GV15','Le Ha Thanh','ThS','GV','Nam','5/4/1978','5/15/2005',3.00,1350000,'KHMT')
alter table GiaoVien
check constraint all
end

--Inserting into table HocVien
begin
alter table HocVien
nocheck constraint all
insert into HOCVIEN values('K1101','Nguyen Van','A','1/27/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1102','Tran Ngoc','Han','3/1/1986','Nu','Kien Giang','K11')
insert into HOCVIEN values('K1103','Ha Duy','Lap','4/18/1986','Nam','Nghe An','K11')
insert into HOCVIEN values('K1104','Tran Ngoc','Linh','3/30/1986','Nu','Tay Ninh','K11')
insert into HOCVIEN values('K1105','Tran Minh','Long','2/27/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1106','Le Nhat','Minh','1/24/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1107','Nguyen Nhu','Nhut','1/27/1986','Nam','Ha Noi','K11')
insert into HOCVIEN values('K1108','Nguyen Manh','Tam','2/27/1986','Nam','Kien Giang','K11')
insert into HOCVIEN values('K1109','Phan Thi Thanh','Tam','1/27/1986','Nu','Vinh Long','K11')
insert into HOCVIEN values('K1110','Le Hoai','Thuong','2/5/1986','Nu','Can Tho','K11')
insert into HOCVIEN values('K1111','Le Ha','Vinh','12/25/1986','Nam','Vinh Long','K11')
insert into HOCVIEN values('K1201','Nguyen Van','B','2/11/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1202','Nguyen Thi Kim','Duyen','1/18/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1203','Tran Thi Kim','Duyen','9/17/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1204','Truong My','Hanh','5/19/1986','Nu','Dong Nai','K12')
insert into HOCVIEN values('K1205','Nguyen Thanh','Nam','4/17/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1206','Nguyen Thi Truc','Thanh','3/4/1986','Nu','Kien Giang','K12')
insert into HOCVIEN values('K1207','Tran Thi Bich','Thuy','2/8/1986','Nu','Nghe An','K12')
insert into HOCVIEN values('K1208','Huynh Thi Kim','Trieu','4/8/1986','Nu','Tay Ninh','K12')
insert into HOCVIEN values('K1209','Pham Thanh','Trieu','2/23/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1210','Ngo Thanh','Tuan','2/14/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1211','Do Thi','Xuan','3/9/1986','Nu','Ha Noi','K12')
insert into HOCVIEN values('K1212','Le Thi Phi','Yen','3/12/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1301','Nguyen Thi Kim','Cuc','6/9/1986','Nu','Kien Giang','K13')
insert into HOCVIEN values('K1302','Truong Thi My','Hien','3/18/1986','Nu','Nghe An','K13')
insert into HOCVIEN values('K1303','Le Duc','Hien','3/12/1986','Nam','Tay Ninh','K13')
insert into HOCVIEN values('K1304','Le Quang','Hien','4/18/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1305','Le Thi','Huong','3/27/1986','Nu','TpHCM','K13')
insert into HOCVIEN values('K1306','Nguyen Thai','Huu','3/30/1986','Nam','Ha Noi','K13')
insert into HOCVIEN values('K1307','Tran Minh','Man','5/28/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1308','Nguyen Hieu','Nghia','4/8/1986','Nam','Kien Giang','K13')
insert into HOCVIEN values('K1309','Nguyen Trung','Nghia','1/18/1987','Nam','Nghe An','K13')
insert into HOCVIEN values('K1310','Tran Thi Hong','Tham','4/22/1986','Nu','Tay Ninh','K13')
insert into HOCVIEN values('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1312','Nguyen Thi Kim','Yen','9/7/1986','Nu','TpHCM','K13')
alter table HocVien
check constraint all
end


--Inserting into table KetQuaThi
insert into KETQUATHI values('K1101','CSDL',1,'7/20/2006',10.00,'Dat')
insert into KETQUATHI values('K1101','CTDLGT',1,'12/28/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','THDC',1,'5/20/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','CTRR',1,'5/13/2006',9.50,'Dat')
insert into KETQUATHI values('K1102','CSDL',1,'7/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',2,'7/27/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',3,'8/10/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',1,'12/28/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',2,'1/5/2007',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',3,'1/15/2007',6.00,'Dat')
insert into KETQUATHI values('K1102','THDC',1,'5/20/2006',5.00,'Dat')
insert into KETQUATHI values('K1102','CTRR',1,'5/13/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','CSDL',1,'7/20/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1103','CSDL',2,'7/27/2006',8.25,'Dat')
insert into KETQUATHI values('K1103','CTDLGT',1,'12/28/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1103','CTRR',1,'5/13/2006',6.50,'Dat')
insert into KETQUATHI values('K1104','CSDL',1,'7/20/2006',3.75,'Khong Dat')
insert into KETQUATHI values('K1104','CTDLGT',1,'12/28/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',1,'5/13/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',2,'5/20/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',3,'6/30/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1201','CSDL',1,'7/20/2006',6.00,'Dat')
insert into KETQUATHI values('K1201','CTDLGT',1,'12/28/2006',5.00,'Dat')
insert into KETQUATHI values('K1201','THDC',1,'5/20/2006',8.50,'Dat')
insert into KETQUATHI values('K1201','CTRR',1,'5/13/2006',9.00,'Dat')
insert into KETQUATHI values('K1202','CSDL',1,'7/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1202','CTDLGT',1,'12/28/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTDLGT',2,'1/5/2007',5.00,'Dat')
insert into KETQUATHI values('K1202','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','THDC',2,'5/27/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',1,'5/13/2006',3.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',2,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',3,'6/30/2006',6.25,'Dat')
insert into KETQUATHI values('K1203','CSDL',1,'7/20/2006',9.25,'Dat')
insert into KETQUATHI values('K1203','CTDLGT',1,'12/28/2006',9.50,'Dat')
insert into KETQUATHI values('K1203','THDC',1,'5/20/2006',10.00,'Dat')
insert into KETQUATHI values('K1203','CTRR',1,'5/13/2006',10.00,'Dat')
insert into KETQUATHI values('K1204','CSDL',1,'7/20/2006',8.50,'Dat')
insert into KETQUATHI values('K1204','CTDLGT',1,'12/28/2006',6.75,'Dat')
insert into KETQUATHI values('K1204','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1204','CTRR',1,'5/13/2006',6.00,'Dat')
insert into KETQUATHI values('K1301','CSDL',1,'12/20/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1301','CTDLGT',1,'7/25/2006',8.00,'Dat')
insert into KETQUATHI values('K1301','THDC',1,'5/20/2006',7.75,'Dat')
insert into KETQUATHI values('K1301','CTRR',1,'5/13/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CSDL',1,'12/20/2006',6.75,'Dat')
insert into KETQUATHI values('K1302','CTDLGT',1,'7/25/2006',5.00,'Dat')
insert into KETQUATHI values('K1302','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CTRR',1,'5/13/2006',8.50,'Dat')
insert into KETQUATHI values('K1303','CSDL',1,'12/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',1,'7/25/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',2,'8/7/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',3,'8/15/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1303','THDC',1,'5/20/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',1,'5/13/2006',3.25,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',2,'5/20/2006',5.00,'Dat')
insert into KETQUATHI values('K1304','CSDL',1,'12/20/2006',7.75,'Dat')
insert into KETQUATHI values('K1304','CTDLGT',1,'7/25/2006',9.75,'Dat')
insert into KETQUATHI values('K1304','THDC',1,'5/20/2006',5.50,'Dat')
insert into KETQUATHI values('K1304','CTRR',1,'5/13/2006',5.00,'Dat')
insert into KETQUATHI values('K1305','CSDL',1,'12/20/2006',9.25,'Dat')
insert into KETQUATHI values('K1305','CTDLGT',1,'7/25/2006',10.00,'Dat')
insert into KETQUATHI values('K1305','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1305','CTRR',1,'5/13/2006',10.00,'Dat')

--Inserting into DieuKien
insert into DIEUKIEN values('CSDL','CTRR')
insert into DIEUKIEN values('CSDL','CTDLGT')
insert into DIEUKIEN values('CTDLGT','THDC')
insert into DIEUKIEN values('PTTKTT','THDC')
insert into DIEUKIEN values('PTTKTT','CTDLGT')
insert into DIEUKIEN values('DHMT','THDC')
insert into DIEUKIEN values('LTHDT','THDC')
insert into DIEUKIEN values('PTTKHTTT','CSDL')


--Inserting into Lop
insert into LOP values('K11','Lop 1 khoa 1','K1108',11,'GV07')
insert into LOP values('K12','Lop 2 khoa 1','K1205',12,'GV09')
insert into LOP values('K13','Lop 3 khoa 1','K1305',12,'GV14')


-- In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.	[1]
select 
MaHV,Ho,Ten,NgaySinh,HocVien.MaLop 
from 
HocVien,Lop
where 
HocVien.MaHV=Lop.TruongLop


-- In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên	[2]
select 
HocVien.MaHV,Ho,Ten,LanThi,Diem
from 
KetQuaThi join HocVien on KetQuaThi.MaHV=HocVien.MaHV
where 
MaMH='CTRR' and MaLop='K12'
order by 
Ho,Ten


-- In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt	[3]
select 
HocVien.MaHV,Ho,Ten 
from 
KetQuaThi join MonHoc on KetQuaThi.MaMH=MonHoc.MaMH join HocVien on KetQuaThi.MaHV=HocVien.MaHV
where
LanThi=1 and KetQua='Dat'


-- In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).	[4]
select 
HocVien.MaHV,Ho,Ten 
from 
KetQuaThi join MonHoc on KetQuaThi.MaMH=MonHoc.MaMH join HocVien on KetQuaThi.MaHV=HocVien.MaHV
where
MaLop='K12'
and
LanThi=1 and KetQua='Khong Dat'


-- In ra danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).	[5]select 
HocVien.MaHV,Ho,Ten 
from 
KetQuaThi join MonHoc on KetQuaThi.MaMH=MonHoc.MaMH join HocVien on KetQuaThi.MaHV=HocVien.MaHV
where
MaLop like 'K%'
and
KetQua='Khong Dat'-- Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006 [6]select distinctTenMHfromGiangDay join MonHoc on GiangDay.MaMH=MonHoc.MaMH join GiaoVien on GiangDay.MaGV=GiaoVien.MaGVwhereHocKy=1 and Nam=2006 and HoTen='Tran Tam Thanh'-- Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006	[7]select distinctMonHoc.MaMH,TenMHfromGiangDay join MonHoc on GiangDay.MaMH=MonHoc.MaMH join GiaoVien on GiangDay.MaGV=GiaoVien.MaGV join Lop on GiaoVien.MaGV=Lop.MaGVCNwhereLop.MaLop='K11' and HocKy=1 and Nam=2006-- Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”		[8]select distinctHo,TenfromGiangDayjoin MonHoc on GiangDay.MaMH=MonHoc.MaMH join GiaoVien on GiangDay.MaGV=GiaoVien.MaGV join Lop on GiaoVien.MaGV=Lop.MaGVCNjoin HocVien on TruongLop=MaHVwhereHoTen='Nguyen To Lan' and TenMH='Co so du lieu'-- In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”	[9]select distinctMonHoc.MaMH,MonHoc.TenMHfromMonHocjoin DieuKien on MonHoc.MaMH=DieuKien.MaMHwhereMaMH_Truoc='CSDL'-- Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào		[10]select distinctMonHoc.MaMH,MonHoc.TenMHfromMonHoc as MonHocTruoc,MonHocjoin DieuKien on MonHoc.MaMH=DieuKien.MaMHwhere MonHocTruoc.MaMH = DieuKien.MaMH_Truoc and MonHocTruoc.TenMH='Cau truc roi rac'-- Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006		[11]select distinctHo,TenfromGiangDayjoin MonHoc on GiangDay.MaMH=MonHoc.MaMH join GiaoVien on GiangDay.MaGV=GiaoVien.MaGV join Lop on GiangDay.MaLop=Lop.MaLopjoin HocVien on TruongLop=MaHVwhereGiangDay.MaLop='K11' or GiangDay.MaLop='K12'and HocKy=1and Nam=2006--  Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào		[13]select MaGV, HoTenfromGiaoVienwhereMaGV not in (select MaGV from GiangDay)-- Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất		[19]
select
MaKhoa, TenKhoa
from 
Khoa
where 
NgayThanhLap = (select MIN(NgayThanhLap) from Khoa)

-- Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”		[20]
select
count(*) 'Số giáo viên có học hàm GS hoặc PGS'
from
GiaoVien
where
HocHam in ('GS', 'PGS')

-- Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa	[21]
select 
MaKhoa, HocVi, count(*) 'Số giáo viên'
from 
GiaoVien
group by 
MaKhoa, HocVi
order by 
MaKhoa

-- Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt)	[22]h
select 
MaMH, KetQua, count(*) 'Số học viên'
from 
KetQuaThi
group by 
MaMH, KetQua
order by 
MaMH