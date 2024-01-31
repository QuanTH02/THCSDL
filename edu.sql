create database education;
\c education
create table users (
	Ho varchar(20) not NULL,
	Ten varchar(10) not NULL,
	username varchar(20) not NULL,
	password varchar(20) not NULL,
	vai_tro varchar(10) not NULL,
	primary key(username)
);
create table teacher (
	Ho_giang_vien varchar(20) not NULL,
	Ten_giang_vien varchar(10) not NULL,
	Ma_giang_vien varchar(10) not NULL,
	Nam_sinh int check(Nam_sinh>=1920 and Nam_sinh <=2000),
	So_dien_thoai varchar(11),
	Gmail varchar(30),
	Hoc_phan_giang_day varchar(50),
	primary key(Ma_giang_vien)
);
create table student(
	MSSV int check(MSSV>=20200000 and MSSV <20210000), 
	Ho_sinh_vien varchar(20) not NULL,
	Ten_sinh_vien varchar(10) not NULL,
	GPA float check(GPA>=0 and GPA <=4),
	Ngay_sinh varchar(10),
	Gioi_tinh varchar(1),
	Que_quan varchar(20),
	So_dien_thoai varchar(11),
	Gmail varchar(30),
	So_tien_hien_tai int check(So_tien_hien_tai >0),
	primary key(MSSV)
);
create table course(
	Ma_hoc_phan varchar(8) not NULL,
	Ten_hoc_phan varchar(40) not NULL,
	Trong_so float check(Trong_so >0 and Trong_so <1),
	So_tin_hoc_phan int check(So_tin_hoc_phan>=0),
	So_tin_hoc_phi float check(So_tin_hoc_phi >0),
	primary key(Ma_hoc_phan)
);
create table course_class(
  	Ma_hoc_phan varchar(8) not NULL,
	Ten_hoc_phan varchar(40) not NULL,
	Ma_lop varchar(6) not NULL,
	Ho_giang_vien varchar(20) not NULL,
	Ten_giang_vien varchar(10) not NULL,
	Tiet_bat_dau int check(Tiet_bat_dau>0 and Tiet_bat_dau<12),
	Tiet_ket_thuc int check(Tiet_ket_thuc>1 and Tiet_ket_thuc<13),
	Thu int check(Thu>1 and Thu<7),
	So_luong_sinh_vien int check(So_luong_sinh_vien>0 and So_luong_sinh_vien<251),
	Loai_lop varchar(2),
	primary key(Ma_lop),
	foreign key(Ma_hoc_phan) references course(Ma_hoc_phan),
  	check(Tiet_ket_thuc>Tiet_bat_dau)
);
create table Diem(
  	MSSV int not NULL check(MSSV>=20200000 and MSSV<20210000),
  	Ma_hoc_phan varchar(8) not NULL,
	Ten_hoc_phan varchar(40) not NULL,
  	Diem_GK float check(Diem_GK>=0 and Diem_GK<=10),
  	Diem_CK float check(Diem_CK>=0 and Diem_CK<=10),
  	Diem_tong_ket_so float check(Diem_tong_ket_so>=0 and Diem_tong_ket_so<=10),
  	Diem_tong_ket_thang_4 float check(Diem_tong_ket_thang_4>=0 and Diem_tong_ket_thang_4<=4),
  	foreign key(Ma_hoc_phan) references course(Ma_hoc_phan),
  	foreign key(MSSV) references student(MSSV)
);
create table student_class(
	Ma_hoc_phan varchar(8) not NULL,
	Ten_hoc_phan varchar(40) not NULL,
	Ma_lop varchar(6) not NULL,
	MSSV int check(MSSV>=20200000 and MSSV<20210000),
	Ho_sinh_vien varchar(20),
	Ten_sinh_vien varchar(10),
	Diem_GK float check(Diem_GK>=0 and Diem_GK<=10),
  	Diem_CK float check(Diem_CK>=0 and Diem_CK<=10),
	foreign key(MSSV) references student(MSSV),
	foreign key(Ma_hoc_phan) references course(Ma_hoc_phan),
	foreign key(Ma_lop) references course_class(Ma_lop)
);
alter table teacher add constraint teacher_fk3 foreign	key(Hoc_phan_giang_day) references course(Ma_hoc_phan) ;




	