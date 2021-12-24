CREATE DATABASE HeThongTiemChung
GO
USE HeThongTiemChung
GO

CREATE TABLE ThanNhan(
	MaTN varchar(10) PRIMARY KEY,
	TenTN nvarchar(max) NOT NULL,
	MoiQuanHe nvarchar(50) NULL,
	SDT varchar(10) NOT NULL,
) 
GO

CREATE TABLE KhachHang(
	MaKH varchar(10) PRIMARY KEY,
	TenKH nvarchar(max) NOT NULL,
	DiaChi nvarchar(max) NULL,
	NgaySinh date NOT NULL,
	MaTN varchar(10) NOT NULL,
	FOREIGN KEY (MaTN) REFERENCES ThanNhan(MaTN)
) 
GO

CREATE TABLE NhanVien(
	MaNV varchar(10) PRIMARY KEY,
	TenHienThi nvarchar(max) NULL,
	GioiTinh nvarchar(20) NULL,
	DiaChi nvarchar(max) NULL,
	SDT nvarchar(10) NOT NULL,
	Quyen nvarchar(20) NULL,
	TenDangNhap varchar(50) NOT NULL,
	MatKhau varchar(50) NOT NULL,
	Email nvarchar(50) NULL,
) 
GO

CREATE TABLE CaLamViec(
	MaCLV varchar(10) PRIMARY KEY,
	Ca nvarchar(30) NULL,
   

) 
GO


CREATE TABLE LoaiVacXin(
	MaLoai varchar(10) PRIMARY KEY,
	TenLoai nvarchar(max) NULL,
) 
GO

CREATE TABLE VacXin(
	MaVX varchar(10) PRIMARY KEY,
	TenVX nvarchar(max) NOT NULL,
	PhongBenh nvarchar(max) NOT NULL,
	GiaBan int NOT NULL,
	SoLuong int NOT NULL,
	MaLoai varchar(10) NULL,
	NuocSX nvarchar(50) NOT NULL,
	FOREIGN KEY (MaLoai) REFERENCES LoaiVacXin(MaLoai)
)  
GO

CREATE TABLE GoiTiem(
	MaGT varchar(10) PRIMARY KEY,
	TenGT nvarchar(max) NULL,
 
) 
GO

CREATE TABLE DangKyTiem(
	MaHD varchar(10) PRIMARY KEY,
	MaKH varchar(10) NOT NULL,
	NgayTao date NOT NULL,
	MaNV varchar(10) NOT NULL,
	TongTien int NOT NULL,
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
) 
GO

CREATE TABLE NhaCungCap(
	MaNCC varchar(10) PRIMARY KEY,
	TenNCC nvarchar(max) NOT NULL,
	NuocSX nvarchar(50) NOT NULL,
	SDT varchar(10) NOT NULL,
) 
GO

CREATE TABLE PhieuNhap(
	MaPN varchar(10) PRIMARY KEY,
	MaNCC varchar(10) NOT NULL,
	NgayNhap date NOT NULL,
	MaNV varchar(10) NOT NULL,
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
) 
GO

CREATE TABLE ChiTietCLV(
	MaCLV varchar(10) NOT NULL,
	MaNV varchar(10) NOT NULL,
	NgayLam date NOT NULL,
	NgayKT date NULL ,
    PRIMARY KEY (MaCLV, MaNV), 
	FOREIGN KEY (MaCLV) REFERENCES CaLamViec(MaCLV),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
) 
GO

CREATE TABLE ChiTietGoiTiem(
	
	MaGT varchar(10) NOT NULL,
	MaVX varchar(10) NOT NULL,
	NgayBD date NOT NULL,
	NgayKT date NOT NULL,
	PRIMARY KEY (MaGT, MaVX) ,
	FOREIGN KEY (MaGT) REFERENCES GoiTiem(MaGT),
	FOREIGN KEY (MaVX) REFERENCES VacXin(MaVX)
) 
GO

CREATE TABLE ChiTietDKTiem(
	MaHD varchar(10) NOT NULL,
	MaVX varchar(10) NOT NULL,
	SoLuong int NOT NULL,
	DonGia float NOT NULL,
	PRIMARY KEY (MaHD, MaVX), 
	FOREIGN KEY (MaHD) REFERENCES DangKyTiem(MaHD),
	FOREIGN KEY (MaVX) REFERENCES VacXin(MaVX)
) 
GO

CREATE TABLE ChiTietPN(
	MaPN varchar(10) NOT NULL,
	MaVX varchar(10) NOT NULL,
	SoLuong int NULL,
	DonGia float NULL,
	PRIMARY KEY (MaPN, MaVX),
	FOREIGN KEY (MaPN) REFERENCES PhieuNhap(MaPN),
	FOREIGN KEY (MaVX) REFERENCES VacXin(MaVX)
) 
GO






INSERT ThanNhan (MaTN, TenTN, MoiQuanHe, SDT)
VALUES (N'TN001', N'Nguyễn Hữu An', N'Anh', N'0935958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN002', N'Nguyễn Thị Bảo Trân', N'Mẹ', N'0935968952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN003', N'Phan Thái Lâm', N'Bố', N'0935558952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe, SDT)
VALUES (N'TN004', N'Nguyễn Thị Diễm Trinh', N'Mẹ', N'0265958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN005', N'Nguyễn Thành Tiến', N'Anh', N'0235958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN006', N'Nguyễn Tường Vy', N'Mẹ', N'0937958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN007', N'Đào Duy Khánh', N'Bố', N'0836958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN008', N'Bùi Quốc Lâm', N'Bố', N'0935953952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN009', N'Đặng Võ Công Thành', N'Bố', N'0337958952')
INSERT ThanNhan (MaTN, TenTN, MoiQuanHe,  SDT)
VALUES (N'TN010', N'Lê Nhật Anh', N'Bố', N'0735958952')




INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN) 
VALUES (N'KH001', N'Bạch Long Vũ', N'Quận 9 , TP.Hồ Chí Minh', CAST(N'2015-10-09' AS Date), N'TN001')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH002', N'Nguyễn Hoàng Hiệp', N'Quận 8, TP.Hồ Chí Minh', CAST(N'2011-11-09' AS Date), N'TN002')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH003', N'Nguyễn Văn Tiến', N'Quận 4, TP. Hồ Chí Minh', CAST(N'2011-02-09' AS Date), N'TN003')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH004', N'Lê Thị Diễm Trinh', N'Quận Ba Vì , Hà Nội', CAST(N'2009-12-09' AS Date), N'TN004')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH005', N'Nguyễn Thị Thu Trang', N'Quận 9, TP.Hồ Chí Minh ', CAST(N'2008-12-09' AS Date), N'TN005')
INSERT KhachHang (MaKH, TenKH,  DiaChi, NgaySinh, MaTN)
VALUES (N'KH006', N'Huỳnh Xuân Lãm ', N'Quận 12, TP.Hồ Chí Minh ', CAST(N'2017-12-09' AS Date), N'TN006')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH007', N'Võ Văn Trí', N'Quận 7, TP.Hồ Chí Minh ', CAST(N'2005-12-09' AS Date), N'TN007')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH008', N'Đặng Quang Trường Nguyên', N'Quận 9, TP.Hồ Chí Minh', CAST(N'2020-12-09' AS Date), N'TN008')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH009', N'Nguyễn Thanh Hòa', N'Quận 12, TP.Hồ Chí Minh ', CAST(N'2020-10-09' AS Date), N'TN009')
INSERT KhachHang (MaKH, TenKH, DiaChi, NgaySinh, MaTN)
VALUES (N'KH010', N'Võ Đoàn Hoàng Long', N'Quận 4, TP.Hồ Chí Minh ', CAST(N'2018-12-09' AS Date), N'TN010')
GO

INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV003', N'Admin', N'Nam', N'Quận 9, TP.Hồ Chí Minh', N'0328644258', N'Quản lý', N'admin', N'1234', N'nguyencongchi@gmail.com')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV001', N'Bùi Văn Tân', N'Nam', N'Quận 9, TP.Hồ Chí Minh', N'0963528491', N'Nhân viên', N'tan', N'123', N'vantanbui@gmail.com')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV002', N'Nguyễn Công Chí', N'Nam', N'Quận 8, TP.Hồ Chí Minh', N'0328644278', N'Nhân viên', N'chi', N'123', N'trivan@gmail.xom')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV004', N'Huỳnh Xuân Lãm', N'Nam', N'Quận 9, TP.Hồ Chí Minh', N'0987528554', N'Nhân viên', N'lam', N'123', N'huynhxuanlam@gmail.com')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh,DiaChi,  SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV005', N'Hồ Ngọc Thống', N'Nam', N'Quận 9, TP.Hồ Chí Minh', N'0981528449', N'Nhân viên', N'thong', N'123', N'hongocthong@gmail.com')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV006', N'Hà Thái Anh ', N'Nam', N'Quận 7, TPHCM ', N'0963591028', N'Nhân viên', N'thaianh123', N'123', N'thaiha@gmail.xom')
INSERT NhanVien (MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau, Email) VALUES (N'NV007', N'Trần Thanh Phong ', N'Nữ', N'Quận Bình Thạnh, TP.HCM', N'0935217528', N'Nhân viên', N'thanhphong8089', N'4321', N'thanhtran@gmail.com')
GO

INSERT CaLamViec (MaCLV, Ca) VALUES (N'CLV01', N'Sáng (7h00 - 11h00)')
INSERT CaLamViec (MaCLV, Ca) VALUES (N'CLV02', N'Chiều (11h00 - 17h00)')
INSERT CaLamViec (MaCLV, Ca) VALUES (N'CLV03', N'Tối (17h00 - 23h00)')
GO


INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L001', N'Trẻ em dưới 10 tuổi')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L002', N'Người trưởng thành')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L003', N'Trẻ em dưới 1 tuổi')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L004', N'Trẻ em dưới 12 tuổi')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L005', N'Phụ nữ cho con bú')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L006', N'Phụ nữ chuẩn bị mang thai')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L007', N'Phụ nữ mang thai')
INSERT LoaiVacXin (MaLoai, TenLoai) VALUES (N'L008', N'Người tuổi vị thành niên')
GO


INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX001', N'Infanrix IPV+Hib', N'Bạch hầu, ho gà, uốn ván, bại liệt và Hib', 400000, 184, N'L001', N'Bỉ')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX002', N'Infanrix Hexa (6in1)', N'Bạch hầu, ho gà, uốn ván, bại liệt, Hib và viêm gan B', 400000, 172, N'L001', N'Bỉ')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX003', N'Rotateq', N'Rota virus', 150000, 165, N'L002', N'Mỹ	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX004', N'Synflorix', N'Các bệnh do phế cầu', 200000, 167, N'L008', N'Bỉ')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX005', N'BCG', N'Lao', 200000, 179, N'L001', N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX006', N'Engerix B 1ml', N'Viêm gan B người lớn', 200000, 199, N'L008', N'Bỉ')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX007', N'Euvax B 0.5ml ', N'Viêm gan B trẻ em ', 150000, 202, N'L002', N'Hàn Quốc	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX008', N'VA-Mengoc-BC ', N'Viêm màng não mô cầu BC	', 150000, 85, N'L001', N'Cu Ba	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX009', N'Menactra', N'Viêm màng não mô cầu ACYW	', 160000, 98, N'L008', N'Mỹ	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX010', N'MVVac (Lọ 5ml) ', N'Sởi', 210000, 98, N'L001', N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX011', N'MMR II (3 in 1)	 ', N'Sởi – Quai bị – Rubella ', 150000, 202, N'L002', N'Mỹ	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX012', N'Varivax ', N'Thủy đậu', 150000, 85, N'L002', N'Mỹ	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX013', N'Vaxigrip Tetra 0.5ml', N'Cúm', 160000, 98, N'L008', N'Pháp	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX014', N'Ivacflu-S 0,5ml	', N'Cúm (người lớn > 18 tuổi)', 210000, 98, N'L004', N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX015', N'Gardasil 0.5ml	 ', N'Ung thư cổ tử cung và u nhú bộ phận sinh dục, sùi mào gà', 150000, 202, N'L002', N'Mỹ	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX016', N'VAT', N'Phòng uốn ván', 150000, 85, N'L004', N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX017', N'Imojev', N'Viêm não Nhật Bản', 160000, 98, N'L008', N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX018', N'Verorab 0,5ml (TB, TTD)	 ', N'Vắc xin phòng dại', 210000, 98, N'L004', N'Pháp	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX019', N'Adacel	', N'Bạch hầu – Uốn ván – Ho gà ', 150000, 202, N'L002', N'Canada	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX020', N'Tetraxim	', N'Bạch hầu – Ho gà – Uốn ván – Bại liệt', 150000, 85, N'L008', N'Pháp	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX021', N'Uốn ván, bạch hầu hấp phụ (Td)-Lọ 0,5ml', N'Bạch hầu – Uốn ván', 160000, 98, N'L001',N'Việt Nam	')
INSERT VacXin (MaVX, TenVX, PhongBenh, GiaBan, SoLuong, MaLoai, NuocSX) VALUES (N'VX022', N'Twinrix', N'Viêm gan B và Viêm gan A', 210000, 98, N'L004', N'Bỉ')
GO

INSERT GoiTiem (MaGT, TenGT) VALUES (N'GT001', N'Gói vắc xin cho trẻ')
INSERT GoiTiem (MaGT, TenGT) VALUES (N'GT002', N'Gói vắc xin cho trẻ tiền học đường')
INSERT GoiTiem (MaGT, TenGT) VALUES (N'GT003', N'Gói vắc xin cho tuổi vị thành niên')
INSERT GoiTiem (MaGT, TenGT) VALUES (N'GT004', N'Gói vắc xin cho người trưởng thành')
INSERT GoiTiem (MaGT, TenGT) VALUES (N'GT005', N'Gói vắc xin cho phụ nữ chuẩn bị trước mang thai')
GO



INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD001', N'KH001     ', CAST(N'2021-11-20' AS Date), N'NV001', 2000000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD002', N'KH002     ', CAST(N'2021-11-21' AS Date), N'NV003', 1200000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD003', N'KH003     ', CAST(N'2021-11-21' AS Date), N'NV003', 2800000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD004', N'KH004     ', CAST(N'2021-11-22' AS Date), N'NV003', 3200000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD005', N'KH004     ', CAST(N'2021-11-23' AS Date), N'NV004', 800000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD006', N'KH001', CAST(N'2021-12-04' AS Date), N'NV003', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD007', N'KH001', CAST(N'2021-12-04' AS Date), N'NV003', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD008', N'KH001', CAST(N'2021-12-06' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD009', N'KH001', CAST(N'2021-12-06' AS Date), N'NV001', 540000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD010', N'KH001', CAST(N'2021-12-06' AS Date), N'NV001', 1080000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD011', N'KH004', CAST(N'2021-12-06' AS Date), N'NV001', 880000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD012', N'KH004', CAST(N'2021-12-06' AS Date), N'NV001', 680000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD013', N'KH004', CAST(N'2021-12-06' AS Date), N'NV001', 3400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD014', N'KH003', CAST(N'2021-12-08' AS Date), N'NV001', 480000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD015', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 700000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD016', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD017', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD018', N'KH004', CAST(N'2021-12-11' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD019', N'KH003', CAST(N'2021-12-11' AS Date), N'NV001', 640000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD020', N'KH002', CAST(N'2021-12-11' AS Date), N'NV001', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD021', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 640000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD022', N'KH003', CAST(N'2021-12-11' AS Date), N'NV001', 640000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD023', N'KH004', CAST(N'2021-12-11' AS Date), N'NV001', 640000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD024', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 200000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD025', N'KH002', CAST(N'2021-12-11' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD026', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD027', N'KH001', CAST(N'2021-12-11' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD028', N'KH002', CAST(N'2021-12-11' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD029', N'KH001', CAST(N'2021-12-12' AS Date), N'NV003', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD030', N'KH002', CAST(N'2021-12-12' AS Date), N'NV003', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD031', N'KH002', CAST(N'2021-12-12' AS Date), N'NV003', 640000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD032', N'KH001', CAST(N'2021-12-13' AS Date), N'NV004', 800000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD033', N'KH001', CAST(N'2021-12-14' AS Date), N'NV001', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD034', N'KH001', CAST(N'2021-12-14' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD035', N'KH002', CAST(N'2021-12-14' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD036', N'KH002', CAST(N'2021-12-14' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD037', N'KH004', CAST(N'2021-12-14' AS Date), N'NV003', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD038', N'KH004', CAST(N'2021-12-14' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD039', N'KH002', CAST(N'2021-12-14' AS Date), N'NV001', 400000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD040', N'KH004', CAST(N'2021-12-14' AS Date), N'NV001', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD041', N'KH003', CAST(N'2021-12-14' AS Date), N'NV001', 450000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD042', N'KH003', CAST(N'2021-12-14' AS Date), N'NV003', 300000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD043', N'KH002', CAST(N'2021-12-16' AS Date), N'NV003', 800000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD044', N'KH001', CAST(N'2021-12-16' AS Date), N'NV003', 800000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD045', N'KH005', CAST(N'2021-12-16' AS Date), N'NV003', 2000000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD046', N'KH005', CAST(N'2021-12-16' AS Date), N'NV003', 2000000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD047', N'KH005', CAST(N'2021-12-16' AS Date), N'NV005', 2000000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD048', N'KH008', CAST(N'2021-12-17' AS Date), N'NV004', 1140000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD049', N'KH006', CAST(N'2021-12-17' AS Date), N'NV003', 1440000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD050', N'KH010', CAST(N'2021-12-18' AS Date), N'NV003', 2340000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD051', N'KH008', CAST(N'2021-12-18' AS Date), N'NV003', 1510000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD052', N'KH010', CAST(N'2021-12-19' AS Date), N'NV003', 1290000)
INSERT DangKyTiem (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD053', N'KH010', CAST(N'2021-12-19' AS Date), N'NV003', 2170000)
GO


INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC001  ', N'GSK Canada', N'Mỹ', N'0997722414')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC002  ', N'The Winn-Dixie Pharmacy', N'Việt Nam', N'0997722414')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC003  ', N'Dominicks', N'Canada', N'0328655471')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC004  ', N'Giant Eagle', N'Hàn Quốc', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC005  ', N'Walgreens', N'Bỉ', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC006  ', N'CVS Pharmacy', N'Cu Ba', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC007  ', N'Rite Aid Pharmacy', N'Pháp', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC008  ', N'Walmart', N'Thái Lan', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC009  ', N'Costco Pharmacy', N'Ấn Độ', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC010  ', N'Safeway', N'Anh', N'0327695212')
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC011  ', N'Publix Pharmacy', N'Đức', N'0327695212' )
INSERT NhaCungCap (MaNCC, TenNCC,  NuocSX, SDT) VALUES (N'NCC012  ', N'Shoprite Pharmacy', N'Hà Lan', N'0327695212')
GO

INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN001     ', N'NCC001    ', CAST(N'2021-11-19' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN002     ', N'NCC002    ', CAST(N'2021-11-19' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN003     ', N'NCC003    ', CAST(N'2021-11-19' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN004     ', N'NCC004    ', CAST(N'2021-11-19' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN005', N'NCC002  ', CAST(N'2021-12-05' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN006', N'NCC002  ', CAST(N'2021-12-06' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN007', N'NCC004  ', CAST(N'2021-12-09' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN008', N'NCC003  ', CAST(N'2021-12-09' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN009', N'NCC003  ', CAST(N'2021-12-09' AS Date), N'NV003')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN010', N'NCC002  ', CAST(N'2021-12-17' AS Date), N'NV003')
GO

INSERT ChiTietCLV (MaCLV, MaNV, NgayLam, NgayKT) VALUES (N'CLV01', N'NV003', CAST(N'2021-12-09' AS Date), CAST(N'2021-12-16' AS Date))
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam, NgayKT) VALUES (N'CLV03', N'NV004', CAST(N'2021-12-11' AS Date), CAST(N'2021-12-18' AS Date))
GO


INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT001', N'VX001', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT001', N'VX002', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT001', N'VX006', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT001', N'VX005', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT002', N'VX008', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT002', N'VX007', CAST(N'2021-12-05' AS Date), CAST(N'2021-12-28' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT002', N'VX009', CAST(N'2021-10-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT002', N'VX010', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT003', N'VX005', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
INSERT ChiTietGoiTiem (MaGT, MaVX, NgayBD, NgayKT) VALUES (N'GT003', N'VX007', CAST(N'2021-11-20' AS Date), CAST(N'2021-12-20' AS Date))
GO


INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD001', N'VX001', 5, 399000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD002', N'VX001', 3, 399000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD003', N'VX001', 7, 399000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD004', N'VX002', 8, 399000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD005', N'VX002', 2, 399000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD006', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD007', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD008', N'VX004', 1, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD009', N'VX003', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD009', N'VX005', 1, 340000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD010', N'VX003', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD010', N'VX005', 2, 340000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD011', N'VX005', 2, 340000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD011', N'VX003', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD012', N'VX005', 2, 340000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD013', N'VX007', 10, 340000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD014', N'VX006', 3, 160000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD015', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD015', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD016', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD017', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD018', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD020', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD022', N'VX002', 2, 320000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD023', N'VX002', 2, 320000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD024', N'VX004', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD027', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD028', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD029', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD030', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD031', N'VX002', 2, 320000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD032', N'VX002', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD033', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD035', N'VX005', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD036', N'VX006', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD037', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD038', N'VX006', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD043', N'VX003', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD044', N'VX005', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD045', N'VX002', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD045', N'VX003', 3, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD046', N'VX002', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD046', N'VX003', 3, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD047', N'VX003', 5, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD048', N'VX002', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD048', N'VX004', 2, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD050', N'VX004', 2, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD050', N'VX005', 2, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD050', N'VX006', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD050', N'VX008', 4, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD051', N'VX004', 3, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD051', N'VX006', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD051', N'VX001', 1, 400000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD051', N'VX008', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD052', N'VX008', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD052', N'VX007', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD052', N'VX009', 2, 160000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD052', N'VX004', 1, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD052', N'VX006', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD019', N'VX002', 2, 320000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD021', N'VX002', 2, 320000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD025', N'VX004', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD026', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD034', N'VX005', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD041', N'VX007', 3, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD042', N'VX007', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD039', N'VX005', 2, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD040', N'VX003', 2, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD049', N'VX008', 6, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD049', N'VX004', 2, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD049', N'VX005', 1, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD053', N'VX005', 3, 200000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD053', N'VX004', 5, 170000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD053', N'VX007', 1, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD053', N'VX008', 1, 150000)
INSERT ChiTietDKTiem (MaHD, MaVX, SoLuong, DonGia) VALUES (N'HD053', N'VX010', 2, 210000)
GO


INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN001     ', N'VX001', 200, 350000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN001     ', N'VX002', 200, 360000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN001     ', N'VX003', 200, 110000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN002     ', N'VX004', 200, 170000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN003     ', N'VX005', 200, 160000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN004     ', N'VX006', 200, 150000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN005', N'VX006', 10, 180000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN006', N'VX007', 100, 130000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN007', N'VX007', 100, 130000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN008', N'VX007', 20, 135000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN009', N'VX008', 100, 120000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN010', N'VX009', 100, 130000)
INSERT ChiTietPN (MaPN, MaVX, SoLuong, DonGia) VALUES (N'PN010', N'VX010', 100, 180000)
GO




