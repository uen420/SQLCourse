--Creating and dropping the DB
use master
go
drop database QuanLyDeAn
go
create database QuanLyDeAn
go
use QuanLyDeAn
go



--Table NhanVien
create table NhanVien
(
	MaNV varchar(8) not null,
	HoNV varchar(50) not null,
	TenLot varchar(50) not null,
	TenNV varchar(50) not null,
	NgSinh datetime not null,
	Phai varchar(5) not null,
	DiaChi varchar(100) not null,
	MaNQL varchar(8) null,
	Phong varchar(4) not null,
	MucLuong int not null,
		constraint PK_NhanVien primary key (MaNV),
		constraint FK_NhanVien_1 foreign key (MaNQL) references NhanVien(MaNV),
		constraint Check_Phai_NV check (Phai in ('Nam','Nu')),
	)



--Table PhongBan
create table PhongBan
(
	MaPhg varchar(4) not null,
	TenPhg varchar(100) not null,
	TrPhg varchar(8) not null,
	NgNhanChuc datetime not null,
		constraint PK_PhongBan primary key (MaPhg),
		constraint FK_PhongBan foreign key (TrPhg) references NhanVien(MaNV),
		constraint U_PhongBan unique (TenPhg),
)



--Adding a foreign key to NhanVien after creating the reference in PhongBan
alter table NhanVien
add constraint FK_NhanVien_2 foreign key (Phong) references PhongBan(MaPhg);


--Table DiaDiemPhg
create table DiaDiemPhg
(
	MaPhg varchar(4) not null,
	DiaDiem varchar(30) not null,
		constraint FK_DiaDiemPhg foreign key (MaPhg) references PhongBan(MaPhg),
		constraint PK_DiaDiemPhg primary key (DiaDiem,MaPhg),
)



--Table PhanCong
create table PhanCong
(
	MaNV varchar(8) not null,
	MaDA varchar(6) not null,
	ThoiGian varchar(10) not null,
		constraint PK_PhanCong primary key (MaNV,MaDA),
		constraint FK_PhanCong_1 foreign key (MaNV) references NhanVien(MaNV),
		)



--Table DeAn
create table DeAn
(
	MaDA varchar(6) not null,
	TenDA varchar (50) not null,
	DiaDiemDA varchar(100) not null,
	Phong varchar(4) not null,
	NgBD_DK datetime not null,
	NgKT_DK datetime not null,
		constraint PK_DeAn primary key (MaDA),
		constraint FK_DeAn foreign key (Phong) references PhongBan(MaPhg),
)



--Altering constraint of PhanCong after creating the reference key in DeAn
alter table PhanCong
add constraint FK_PhanCong_2 foreign key (MaDA) references DeAn(MaDA);



--Table ThanNhan
create table ThanNhan
(
	MaNV varchar(8) not null,
	MaTN varchar(8) not null,
	TenTN varchar(50) not null,
	Phai varchar(5) not null,
	NgSinh datetime not null,
	QuanHe varchar(30) not null,
		constraint FK_ThanNhan foreign key (MaNV) references NhanVien(MaNV),
		constraint Check_Phai_TN check (Phai in ('Nam','Nu')),
)
go




--Insertion of data




--Inserting into table NhanVien
begin
alter table NhanVien
nocheck constraint all
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('001','Vuong','Ngoc','Quyen',22/10/1957,'Nu','450 Trung Vuong, Ha Noi',' ','QL',3000000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('002','Nguyen','Thanh','Tung',09/01/1955,'Nam','731 Tran Hung Dao,Q1,Tp HCM','001','NC',2500000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('003','Le','Thi','Nhan',18/12/1960,'Nu','291 Ho Van Hue,QPN,Tp HCM','001','QH',2500000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('004','Dinh','Ba','Tien',09/01/1968,'Nam','638 Nguyen Van Cu,Q5,Tp HCM','002','NC',2200000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('005','Bui','Thuy','Vu',19/07/1972,'Nam','332 Nguyen Thai Hoc,Q1,Tp HCM','002','DH',2200000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('006','Nguyen','Manh','Hung',15/09/1973,'Nam','978 Ba Ria, Vung Tau','002','NC',2000.000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('007','Tran','Thanh','Tam',31/07/1975,'Nu','543 Mai Thi Luu,Q1,Tp HCM',' ','NC',2200000)
	insert into NhanVien(MaNV,HoNV,TenLot,TenNV,NgSinh,Phai,DiaChi,MaNQL,Phong,MucLuong) 
		values ('008','Tran','Hong','Van',04/07/1976,'Nu','980 Le Hong Phong,Q10,Tp HCM','004','NC',1800000)
alter table NhanVien
check constraint all
end



--Inserting into table DeAn
begin
alter table DeAn
nocheck constraint all
	insert into DeAn(MaDA,TenDA,DiaDiemDA,Phong,NgBD_DK,NgKT_DK) 
		values ('TH001','Tin hoc hoa 1','HANOI','NC',01/02/2003,01/02/2004)
	insert into DeAn(MaDA,TenDA,DiaDiemDA,Phong,NgBD_DK,NgKT_DK) 
		values ('TH002','Tin hoc hoa 2', 'TPHCM','NC',04/06/2003,01/02/2004)
	insert into DeAn(MaDA,TenDA,DiaDiemDA,Phong,NgBD_DK,NgKT_DK) 
		values ('DT001','Dao tao 1','NHATRANG','DH',01/02/2002,01/02/2006)
	insert into DeAn(MaDA,TenDA,DiaDiemDA,Phong,NgBD_DK,NgKT_DK) 
		values ('DT002', 'Dao tao 2','HANOI','DH',01/02/2002,01/02/2006)
alter table DeAn
check constraint all
end



--Inserting into table DiaDiemPhg
begin
alter table DiaDiemPhg
nocheck constraint all
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('NC','HANOI')
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('NC','TPHCM')
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('QL','TPHCM')
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('DH','HANOI')
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('DH','TPHCM')
	insert into DiaDiemPhg(MaPhg,DiaDiem)
		values ('DH','NHATRANG')
alter table DiaDiemPhg
check constraint all
end



--Inserting into table PhanCong
begin
alter table PhanCong
nocheck constraint all
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('001','TH001','30,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('001','TH002','12,5')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('002','TH001','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('002','TH002','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('002','DT001','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('002','DT002','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('003','TH001','37,5')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('004','DT001','22,5')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('004','DT002','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('006','DT001','35,5')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('007','TH001','20,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('007','TH002','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('008','TH001','10,0')
	insert into PhanCong(MaNV,MaDA,ThoiGian)
		values ('008','DT002','12,5')
alter table PhanCong
check constraint all
end



--Inserting into table PhongBan
begin
alter table PhongBan
nocheck constraint all
	insert into PhongBan(MaPhg,TenPhg,TrPhg,NgNhanChuc)
		values ('QL','Quan Ly','001',22/05/2000)
	insert into PhongBan(MaPhg,TenPhg,TrPhg,NgNhanChuc)
		values ('DH','Dieu Hanh','003',10/10/2002)
	insert into PhongBan(MaPhg,TenPhg,TrPhg,NgNhanChuc)
		values ('NC','Nghien Cuu','002',15/03/2002)
alter table PhongBan
check constraint all
end



--Inserting into table ThanNhan
begin
alter table ThanNhan
nocheck constraint all
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('003','1','Tran Minh Tien','Nam',11/12/1990,'Con')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('003','2','Tran Ngoc Linh','Nu',10/03/1993,'Con')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('003','3','Tran Minh Long','Nam',10/10/1957,'Vo Chong')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('001','1','Le Nhat Minh','Nam',27/04/1955,'Vo Chong')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('002','1','Le Hoai Thuong','Nu',05/12/1960,'Vo Chong')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('004','1','Le Phi Phung','Nu',23/12/1972,'Vo Chong')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('005','1','Tran Thu Hong','Nu',11/04/1978,'Vo Chong')
	insert into ThanNhan(MaNV,MaTN,TenTN,Phai,NgSinh,QuanHe)
		values ('005','1','Nguyen Manh Tam','Nam',13/01/2003,'Con')
alter table ThanNhan
check constraint all
end
go



--Ex 1
create view Ex1 as
select MaNV,HoNV,TenLot,TenNV from NhanVien where Phong='NC'
go

--Ex 2
create view Ex2 as
select MaNV,HoNV,TenLot,TenNV,Phai from NhanVien where MucLuong>3000000
go

--Ex 3
create view Ex3 as
select HoNV,TenLot,TenNV from NhanVien where MucLuong between 2000000 and 3000000
go

--Ex 4
create view Ex4 as
select HoNV,TenLot,TenNV from NhanVien where DiaChi like 'Tp HCM'
go

--Ex 5
create view Ex5 as
select NgSinh,DiaChi from NhanVien where HoNV='Dinh' and TenLot='Ba' and TenNV='Tien'
go

--Ex 6
create view Ex6 as
select TenTN from ThanNhan where year(getdate())-year(NgSinh)<18 and MaNV='001'
go


--Ex 7
create view Ex7 as
select HoNV,TenLot,TenNV from NhanVien where year(getdate())-year(NgSinh)>30 and Phai='Nu'
go

--Sort MaNV and MaDA by descending order
select MaNV, MaDA from PhanCong
	order by MaNV desc, MaDA --desc = sort by descending order
go


--Average salary, highest salary and average salary of each employee
select sum(MucLuong),max(MucLuong),min(MucLuong),avg(MucLuong)
	from NhanVien
	go

--Amount of employees in "Nghien cuu"
select count(*) as quantity_NV
	from NhanVien,PhongBan
		where Phong=MaPhg and TenPhg='Nghien cuu'