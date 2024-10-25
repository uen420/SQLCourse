--Creating and dropping the DB
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
		('ST01','So tay 500 trang','quyen','Trung Quoc',40000),		('ST02','So tay loai 1','quyen','Viet Nam',55000),		('ST03','So tay loai 2','quyen','Viet Nam',51000),		('ST04','So tay','quyen','Thai Lan',55000),		('ST05','So tay mong','quyen','Thai Lan',20000),		('ST06','Phan viet bang','hop','Viet Nam',5000),		('ST07','Phan khong bui','hop','Viet Nam',7000),		('ST08','Bong bang','cai','Viet Nam',1000),		('ST09','But long','cay','Viet Nam',5000),		('ST10','But long','cay','Trung Quoc',7000);alter table SanPhamcheck constraint allend--Inserting into HoaDon
begin
alter table HoaDon
nocheck constraint all
	insert into HoaDon(SoHD,NgayHD,MaKH,MaNV,TriGia)		values 		('1001','23/07/2006','KH01','NV01',320000),		('1002','12/08/2006','KH01','NV02',840000),		('1003','23/08/2006','KH02','NV01',100000),		('1004','01/09/2006','KH02','NV01',180000),		('1005','20/10/2006','KH01','NV02',3800000),		('1006','16/10/2006','KH01','NV03',2430000),		('1007','28/10/2006','KH03','NV03',510000),		('1008','28/10/2006','KH01','NV03',440000),		('1009','28/10/2006','KH03','NV04',200000),		('1010','01/11/2006','KH01','NV01',5200000),		('1011','04/11/2006','KH04','NV03',250000),		('1012','30/11/2006','KH05','NV03',21000),		('1013','12/12/2006','KH06','NV01',5000),		('1014','31/12/2006','KH03','NV02',3150000),		('1015','01/01/2007','KH06','NV01',910000),		('1016','01/01/2007','KH07','NV02',12500),		('1017','02/01/2007','KH08','NV03',35000),		('1018','13/01/2007','KH08','NV03',330000),		('1019','13/01/2007','KH01','NV03',30000),		('1020','14/01/2007','KH09 ','NV04',70000),		('1021','16/01/2007','KH10','NV03',67500),		('1022','16/01/2007',null,'NV03',7000),		('1023','17/01/2007',null,'NV01',330000);alter table HoaDoncheck constraint allend--Inserting into CTHDbeginalter table CTHDnocheck constraint all	insert into CTHD(SoHD,MaSP,SoLuong)		values		('1001','TV02',10),		('1001','ST01',5),		('1001','BC01',5),		('1001','BC02',10),		('1001','ST08',10),		('1002','BC04',20),		('1002','BB01',20),		('1002','BB02',20),		('1003','BB03',10),		('1004','TV01',20),		('1004','TV02',10),		('1004','TV03',10),		('1004','TV04',10),		('1004','TV05',50),		('1004','TV06',50),		('1006','TV08',20),		('1006','ST01',30),		('1006','ST02',10),		('1007','ST03',10),		('1008','ST04',8),		('1009','ST05',10),		('1010','TV07',50),		('1010','ST07',50),		('1010','ST08',100),		('1010','ST04',50),		('1010','TV03',100),		('1011','ST06',50),		('1012','ST07',3),		('1013','ST08',5),		('1014','BC02',80),		('1014','BB02',100),		('1014','BC04',60),		('1014','BB01',50),		('1015','BB02',30),		('1015','BB03',7),		('1016','TV01',5),		('1017','TV02',1),		('1017','TV03',1),		('1017','TV04',5),		('1018','ST04',6),		('1019','ST05',1),		('1019','ST06',2),		('1020','ST07',10),		('1021','TV01',7),		('1021','TV02',10),		('1022','ST07',1),		('1023','ST04',6);alter table CTHDcheck constraint allend		--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.	[1]select MaSP,TenSP from SanPham where NuocSanXuat='Trung Quoc'--In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”	[2]select MaSP,TenSP from SanPham where DonViTinh='cay' or DonViTinh='quyen'--In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”	[3]select MaSP,TenSP from SanPham where MaSP like 'B_01'--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000	[4]select MaSP,TenSP from SanPham where NuocSanXuat='Trung Quoc' and Gia between 30000 and 40000--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000	[5]select MaSP,TenSP from SanPham where NuocSanXuat='Trung Quoc' or NuocSanXuat='Thai Lan' and Gia between 30000 and 40000--In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007 [6]select SoHD,TriGia from HoaDon where NgayHD between '01/01/2007' and '02/01/2007'--In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần)	[7]select SoHD,TriGia from HoaDon where month(NgayHD)=1 and year(NgayHD)=2007	order by TriGia desc, SoHD--In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007	[8]select KhachHang.MaKH,HoTen from KhachHang,HoaDon where NgayHD='1/1/2007'--In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006	[9]select SoHD,TriGia from HoaDon,NhanVien where HoaDon.MaNV=NhanVien.MaNV and NhanVien.HoTen='Nguyen Van B'--In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006	[10]select SanPham.MaSP,TenSP from SanPham,KhachHang,HoaDon,CTHD 	where 	HoaDon.MaKH = KhachHang.MaKH and CTHD.SoHD = HoaDon.SoHD and CTHD.MaSP = SanPham.MaSP	and	month(NgayHD)=10 and year(NgayHD)=2006	and	HoTen='Nguyen Van A'--Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”	[11]select distinct HoaDon.SoHD from HoaDon,CTHD,SanPham 	where 	CTHD.SoHD = HoaDon.SoHD and CTHD.MaSP = SanPham.MaSP	and	SanPham.MaSP='BB01' or SanPham.MaSP='BB02'--Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20	[12]select distinct HoaDon.SoHD from HoaDon,SanPham,CTHD 	where	CTHD.SoHD = HoaDon.SoHD and CTHD.MaSP = SanPham.MaSP	and	SanPham.MaSP like 'BB0_'	and	SoLuong between 10 and 20--Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?	[20]select count (HoaDon.SoHD) from HoaDon	where	MaKH not in(	select KhachHang.MaKH from KhachHang	where KhachHang.MaKH = HoaDon.MaKH)