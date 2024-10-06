--Creating and dropping the DB, makes it easier for me to execute the script every time :v
use master
go
drop database QuanLySinhVien
go
create database QuanLySinhVien
go
use QuanLySinhVien
go



--Table Khoa
create table Khoa
(
	MaKhoa varchar(10) not null,
	TenKhoa varchar(100) not null,
	NamThanhLap int not null,
		constraint U_TenKhoa unique (TenKhoa),
		constraint FK_Khoa primary key (MaKhoa)
)
go



--Table SinhVien
create table SinhVien
(
	MaSV varchar(10) not null,
	TenSV varchar(100) not null,
	Nam  int default 1,
		constraint PK_SinhVien primary key (MaSV),
		constraint FK_SinhVien foreign key (MaSV) references Khoa(MaKhoa),
		constraint check_nam_sv check (Nam>=1 and Nam<=4)
	)



--Table MonHoc
create table MonHoc
(
	MaMH varchar(10) not null,
	TenMH varchar(100) not null,
	TinChi int not null,
		constraint PK_MonHoc primary key (MaMH),
		constraint FK_MonHoc foreign key (MaMH) references Khoa(MaKhoa),
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
	Diem decimal(4,1),
	constraint PK_KetQua1 primary key (MaSV,MaHP),
	constraint FK_KetQua1 foreign key (MaSV) references SinhVien(MaSV),
	constraint FK_KetQua2 foreign key (MaHP) references HocPhan(MaHP)
	)



