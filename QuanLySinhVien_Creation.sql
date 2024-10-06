--Creating and dropping the DB, makes it easier for me to execute the script every time :v
use master
go
drop database QuanLySinhVien
go
create database QuanLySinhVien
go
use QuanLySinhVien



--Table Khoa
create table Khoa
(
	MaKhoa varchar(10) not null,
	TenKhoa varchar(100) not null,
	NamThanhLap int not null,
		constraint U_TenKhoa unique (TenKhoa),
		constraint FK_Khoa primary key (MaKhoa)
)



--Table SinhVien
create table SinhVien
(
	MaSV varchar(10) not null,
	TenSV varchar(100) not null,
	MaKhoa varchar(10) not null,
	Nam  int default 1,
		constraint PK_SinhVien primary key (MaSV),
		constraint FK_SinhVien foreign key (MaKhoa) references Khoa(MaKhoa),
		constraint check_nam_sv check (Nam>=1 and Nam<=4)
	)



--Table MonHoc
create table MonHoc
(
	MaMH varchar(10) not null,
	TenMH varchar(100) not null,
	TinChi int not null,
	MaKhoa varchar(10) not null,
		constraint PK_MonHoc primary key (MaMH),
		constraint FK_MonHoc foreign key (MaKhoa) references Khoa(MaKhoa),
		constraint U_TenMH unique (TenMH),
	)



--Table DieuKien
create table DieuKien
(
	MaMH varchar(10) not null,
	MaMH_Truoc varchar(10) not null,
	constraint PK_DieuKien primary key (MaMH, MaMH_Truoc),
	constraint FK_DieuKien_1 foreign key (MaMH) references MonHoc(MaMH),
	constraint FK_DieuKien_2 foreign key (MaMH_Truoc) references MonHoc(MaMH),
	)



--Table HocPhan
create table HocPhan
(
	MaHP int not null,
	MaMH varchar(10) not null,
	HocKy int not null,
	Nam int not null,
	GiaoVien varchar(50),
	constraint PK_HocPhan primary key (MaHP),
	constraint FK_HocPhan foreign key (MaMH) references MonHoc(MaMH),
	)



--Table KetQua
create table KetQua
(
	MaSV varchar(10) not null,
	MaHP int not null,
	Diem real,
	constraint PK_KetQua primary key (MaSV,MaHP),
	constraint FK_KetQua1 foreign key (MaSV) references SinhVien(MaSV),
	constraint FK_KetQua2 foreign key (MaHP) references HocPhan(MaHP),
	constraint Chk_Diem check (DIEM>=0 and DIEM<=10)
	)

go






--Insertion of data into the DB


--Inserting into table Khoa
insert into Khoa(MaKhoa,TenKhoa,NamThanhLap) values ('TOAN',N'Toán',1976)
insert into Khoa(MaKhoa,TenKhoa,NamThanhLap) values ('HOA',N'Hóa',1980)
insert into Khoa(MaKhoa,TenKhoa,NamThanhLap) values ('SINH',N'Sinh',1981)
insert into Khoa(MaKhoa,TenKhoa,NamThanhLap) values ('VLY',N'Vật Lý',1982)

--Inserting into table SinhVien
insert into SinhVien(MaSV,TenSV,Nam,MaKhoa) values ('K27.0017',N'Nguyen Cong Phu',1,'TOAN')
insert into SinhVien(MaSV,TenSV,Nam,MaKhoa) values ('K26.0008',N'Phan Anh Khanh',2,'TOAN')
insert into SinhVien(MaSV,TenSV,Nam,MaKhoa) values ('K25.0005',N'Ly Thanh',3,'HOA')
insert into SinhVien(MaSV,TenSV,Nam,MaKhoa) values ('K27.0018',N'Han Quoc Viet',2,'VLY')

--Inserting into table MonHoc
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('TH0001',N'Tin học đại cương A1',4,'TOAN')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('TH0002',N'Cấu trúc đữ liệu',4,'TOAN')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('TO0001',N'Toán rời rạc',3,'TOAN')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('HH0001',N'Hóa đại cương A1',5,'HOA')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('HH0002',N'Hóa đại cương A2',5,'HOA')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('VL0002',N'Vật lý đại cương A2',4,'VLY')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('TH0003',N'Cơ sở dữ liệu',5,'TOAN')
insert into MonHoc(MaMH,TenMH,TinChi,MaKhoa) values ('VL0001',N'Vật lý đại cương A1',5,'VLY')


--Inserting into table DieuKien
insert into DieuKien(MaMH,MaMH_Truoc) values ('TH0003','TO0001')
insert into DieuKien(MaMH,MaMH_Truoc) values ('TH0003','TH0002')
insert into DieuKien(MaMH,MaMH_Truoc) values ('TH0002','TH0001')
insert into DieuKien(MaMH,MaMH_Truoc) values ('HH0002','HH0001')
insert into DieuKien(MaMH,MaMH_Truoc) values ('VL0002','VL0001')

--Inserting into table HocPhan
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (1,'TH0001',1,1996,N'N.D.Lâm')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (2,'VL0001',1,1996,N'T.N. Dung')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (3,'TH0002',1,1997,N'H.Tuân')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (4,'TH0001',1,1997,N'N.D.Lâm')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (5,'TH0003',2,1997,N'N.C.Phú')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (6,'HH0001',1,1996,N'L.T.Phúc')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (7,'TH0002',1,1998,N'P.T.Như')
insert into HocPhan(MaHP,MaMH,HocKy,Nam,GiaoVien) values (8,'TO0001',1,1996,N'N.C.Phú')

--Inserting into table KetQua
insert into KetQua(MaSV,MaHP,Diem) values ('K27.0017',4,9.5)
insert into KetQua(MaSV,MaHP,Diem) values ('K26.0008',1,10)
insert into KetQua(MaSV,MaHP,Diem) values ('K25.0005',6,6)
insert into KetQua(MaSV,MaHP,Diem) values ('K27.0018',2,8)
insert into KetQua(MaSV,MaHP,Diem) values ('K26.0008',3,9)

go


