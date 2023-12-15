use master
create database Net23_Company;
drop database Net23_Company
----------------------
--Create Data File Name: Net23-Company-Data 
create database Net23_Company_1
on
(
	Name=Net23_Company_Data,
	FILENAME='D:\ITI\Back End\SQL\Day2\LAB_dat.mdf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 10
	)
LOG ON
	(
	NAME=Net23_Company_Log ,
	FILENAME = 'D:\ITI\Back End\SQL\Day2\LAB_log.dfl',
	SIZE = 5MB,
	MAXSIZE = 40MB,
	FILEGROWTH = 10
	);	
	----create table Department 
	USE Net23_Company_1
		create table Department 
		(	DeptNo nvarchar(2)PRIMARY key not null,
			DeptName nvarchar(20) not null,
			[Address] Nchar(2) not null,
			Type char(2) default 'NY', 
			constraint Departmentaddress Check (Type in ('NY','DS','KW')),
		)



	----create table Employee 
		create table Employee
		(
			EmpNo int identity(1,1),
			EmpFname varchar(20)not null,
			Emplname varchar (20) not null,
			DeptNo nvarchar(2),
			salary int not null,
			constraint EmployeePK  Primary key (EmpNo),
			constraint BorrowingBookFK foreign key (DeptNo) references Department(DeptNo),
			constraint salarycheck check (salary> 700 and salary<6000),
		)

		alter table Employee add Number int
		alter table Employee drop column Number



		----create table Project 
		create table Project
		(	ProjectNo nvarchar(2),
			ProjectName varchar(50)not null,
			Budget int,

		)

		alter table Project add 
		constraint Project_PK primary key(ProjectNo)


		----create table Work_on 
		create table Work_on
		(	EmpNo int not null,
			ProjectNo nvarchar(2) not null,
			Jop varchar(50),
			Ente_Date date default(getdate()),
			constraint EmpNo_Project_PK primary key (EmpNo,ProjectNo),
			constraint ProjectNo_Fk foreign key(EmpNo) references Employee(EmpNo)
		)

		alter table Work_on add
		constraint Project_projectNo_FK foreign key(ProjectNo) references Project(ProjectNo)