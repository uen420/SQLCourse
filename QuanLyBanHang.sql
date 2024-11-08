﻿--Creating and dropping the DB
use master
go
drop database QuanLyBanHang
go
create database QuanLyBanHang
go
use QuanLyBanHang
go

set dateformat dmy





--Table KhachHang
create table KhachHang
(
	MaKH char(4) not null,
	HoTen varchar(40) not null,
	DiaChi varchar(50) not null,
	SoDT varchar(10) not null,
	NgaySinh smalldatetime not null,
	DoanhSo money not null,
	NgayDangKy smalldatetime not null,

	constraint PK_KhachHang primary key (MaKH),
)


--Table NhanVien
create table NhanVien
(
	MaNV char(4) not null,
	HoTen varchar(40) not null,
	NgayVaoLam smalldatetime not null,
	SoDT varchar(20) not null,

	constraint PK_NhanVien primary key (MaNV),
)


--Table SanPham 
create table SanPham
(
	MaSP char(4) not null,
	TenSP varchar(40) not null,
	DonViTinh varchar(20) not null,
	NuocSanXuat varchar(40) not null,
	Gia money not null,
	
	constraint PK_SanPham primary key (MaSP),
)

--Table HoaDon
create table HoaDon
(
	SoHD int not null,
	NgayHD smalldatetime not null,
	MaKH char(4) null,
	MaNV char(4) not null,
	TriGia money not null,

	constraint PK_HoaDon primary key (SoHD),
	constraint FK_HoaDon_1 foreign key (MaKH) references KhachHang(MaKH),
	constraint FK_HoaDon_2 foreign key (MaNV) references NhanVien(MaNV)
)

--Table CTHD
create table CTHD
(
	SoHD int not null,
	MaSP char(4) not null,
	SoLuong int not null,

	constraint PK_CongTyHopDoanh primary key (SoHD,MaSP),
	constraint FK_CongTyHopDoanh foreign key (SoHD) references HoaDon(SoHD)
)





--Insertion of data



--Inserting into NhanVien
begin
alter table NhanVien
nocheck constraint all
	insert into NhanVien(MaNV,HoTen,SoDT,NgayVaoLam) 
		values 
		('NV01','Nguyen Nhu Nhut','0927345678','13/4/2006'),
		('NV02','Le Thi Phi Yen','0987567390','21/4/2006'),
		('NV03','Nguyen Van B','0997047382','27/4/2006'),
		('NV04','Ngo Thanh Tuan','0913758498','24/6/2006'),
		('NV05','NguyenThiTrucThanh','0918590387','20/7/2006');
alter table NhanVien
check constraint all
end


--Inserting into KhachHang
begin
alter table KhachHang
nocheck constraint all
	insert into KhachHang(MaKH,HoTen,DiaChi,SoDT,NgaySinh,DoanhSo,NgayDangKy)
		values
		('KH01','Nguyen Van A','731 Tran Hung Dao,Q5,TpHCM','08823451','22/10/1960',13060000,'22/07/2006'),
		('KH02','Tran Ngoc Han','23/5 Nguyen Trai,Q5,TpHCM','0908256478','3/4/1974',280000,'30/07/2006'),
		('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan,Q1,TpHCM','0938776266','12/6/1980',3860000,'05/08/2006'),
		('KH04','Tran Minh Long','50/34 Le Dai Hanh,Q10,TpHCM','0917325476','9/3/1965',250000,'02/10/2006'),
		('KH05','Le Nhat Minh','34 Truong Dinh,Q3,TpHCM','08246108','10/3/1950',21000,'28/10/2006'),
		('KH06','Le Hoai Thuong','227 Nguyen Van Cu,Q5,TpHCM','08631738','6/4/1971',915000,'24/11/2006'),
		('KH07','Nguyen Van Tam','32/3 Tran Binh Trong,Q5,TpHCM','0916783565','6/4/1971',12500,'01/12/2006'),
		('KH08','Phan Thi Thanh','45/2 An Duong Vuong,Q5,TpHCM','0938435756','10/1/1971',365000,'13/12/2006'),
		('KH09','Le Ha Vinh','873 Le Hong Phong,Q5,TpHCM','08654763','3/9/1979',70000,'14/01/2007'),
		('KH10','Ha Duy Lap','34/34B Nguyen Trai,Q1,TpHCM','08768904','2/5/1983',67500,'16/01/2007');
alter table KhachHang
check constraint all
end


--Inserting into SanPham
begin
alter table SanPham
nocheck constraint all
	insert into SanPham(MaSP,TenSP,DonViTinh,NuocSanXuat,Gia)
		values
		('BC01','But chi','cay','Singapore',3000),
		('BC02','But chi','cay','Singapore',5000),
		('BC03','But chi','cay','Singapore',3500),
		('BC04','But chi','hop','Singapore',30000),
		('BB01','But bi','cay','Viet Nam',5000),
		('BB02','But bi','cay','Trung Quoc',7000),
		('BB03','But bi','hop','Thai Lan',100000),
		('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500),
		('TV02','Tap 200 giay mong','quyen','Trung Quoc',4000),
		('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),
		('TV04','Tap 200 giay tot','quyen','Viet Nam',5500),
		('TV05','Tap 100 trang','chuc','Trung Quoc',34000),
		('ST01','So tay 500 trang','quyen','Trung Quoc',40000),
begin
alter table HoaDon
nocheck constraint all
	insert into HoaDon(SoHD,NgayHD,MaKH,MaNV,TriGia)