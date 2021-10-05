
Drop Database mydb

Drop Database IF Exists MYdb

CREATE DATABASE MyDB
GO

USE MYDB

/*
CREATE TABLE
    { database_name.schema_name.table_name 
	   | schema_name.table_name 
	     | table_name }
    ( { <column_definition> } [ ,...n ] )
{ ; }
*/

create table TestTable
(
  ID INT
);



create table Student
(
ID int,
Firstname char(20),
Grade	decimal(4,2)
)




drop table if exists Student

Create Table Student
(
ID INT,
First name NVARCHAR(30),
Lastname nvarchar(50),
Age tinyint
)



drop table if exists Course

Create table Course
(
ID int 
,[First name] nvarchar(100)
,instructor nvarchar(30)
)



--مشاهده ساختار جدول
SP_HELP Course
GO



--ایجاد جدول
SP_HELP Student
GO


ALTER TABLE Student
add Britdate datetime

alter table Student
alter column LastName nvarchar(200)




-------------- Primary Key Constraint --------------
/*
CREATE TABLE name
(column type [CONSTRAINT name]
UNIQUE [CLUSTERED | NONCLUSTERED]
	[WITH FILLEFACTOR=number]
	[ON {filegroup | "DEFAULT"}] [,...])
*/

create table TableForPK01(
c1 int constraint const10 primary key,
c2 int)
GO

create table TableForPK02(
c1 int ,
c2 int,
)
GO





alter table TableForPK02
alter column c1 int not null
GO

alter table TableForPK02
add constraint pk_t17 primary key (c1)
GO

create table TableForPK03(
c1 int,
c2 int,
constraint MyC6 primary key (c1,c2))
GO

alter table TableForPK03
drop constraint MyC6
GO

exec sp_helpconstraint 'TableForPK03'
GO

alter table TableForPK03
add c3 int identity(1,1) Constraint PK001  primary key
GO

alter table TableForPK03
drop constraint PK001
GO

alter table TableForPK03
add c4 uniqueidentifier default newid() primary key
GO
/*
sp_rename [ @objname = ] 'object_name' 
        , [ @newname = ] 'new_name'   
      [ , [ @objtype = ] 'object_type' ]  
*/
exec sp_helpconstraint 'TableForPK03'
exec sp_rename 'PK__TableFor__3213663EE36BCB79', 'PK002', 'object'
GO


-------------- Foreign Key Constraint --------------
/*
CREATE TABLE name
(column type [CONSTRAINT name]
[FOREIGN KEY] REFERENCES ref_table [(ref_col)]
	[ON DELETE {CASCADE | NO ACTION | SET NULL | SET DEFAULT }]
	[ON UPDATE {CASCADE | NO ACTION | SET NULL | SET DEFAULT }]
	[,...]
*/
Drop table If Exists Parent,child
create table Parent(
Pc1 int,
[Name] Varchar(10),
primary key (Pc1))
GO

create table child(
c1 int,
c2 int,
[Name] Varchar(10),
foreign key(c1) references parent(Pc1)
)
GO

Drop table If Exists Parent,child
create table Parent(
Pc1 int,
Pc2 int,
[Name] Varchar(10),
primary key (Pc1,Pc2))
GO

create table child(
c1 int,
c2 int,
[Name] Varchar(10),
foreign key(c1,c2) references parent(Pc1,Pc2)
)
GO
---------------------------------------------------------------
/*
INSERT INTO <table_name> (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...)
*/

DROP TABLE IF EXISTS TableForInsert1
GO


CREATE TABLE TableForInsert1
(
	ID INT,
	Family NVARCHAR(50),
	City NVARCHAR(20),
	DateRegister DATE
)
GO


-- فقط امکان درج یک رکورد در هر لحظه وجود داشت SQL 2008 تا قبل از
INSERT INTO TableForInsert1 (ID, Family, City, DateRegisteR)
	VALUES (1, 'احمدی', 'تهران', '2017-01-01')
GO


SELECT * FROM TableForInsert1
GO

INSERT INTO TableForInsert1 (ID, Family, City, DateRegisteR)
	VALUES (1, N'احمدی', N'تهران', '2017-01-01')
GO


SELECT * FROM TableForInsert1
GO

/*
Table Value Constructor
به‌بعد امکان درج بیش از یک رکورد در هر لحظه فراهم شد SQL 2008 از
*/
INSERT INTO TableForInsert1
	VALUES (2, N'محمدی', N'شیراز', '20150211'),
		   (3, N'اکبری', N'تبریز', GETDATE())
GO


SELECT * FROM TableForInsert1
GO


--------------------------------------------------------------------

/*
INSERT در عملیات DEFAULT و NULL بررسی مقادیر
*/

DROP TABLE IF EXISTS TableForInsert2
GO


CREATE TABLE TableForInsert2
(
	ID INT NOT NULL,
	Family NVARCHAR(50) NOT NULL,
	City NVARCHAR(20),
	DateRegister DATE DEFAULT GETDATE()
)
GO


INSERT INTO TableForInsert2 (ID, Family) -- حتما در این حالت باید نام فیلدها ذکر شود
	VALUES(1, N'مجیدی')
GO


SELECT * FROM TableForInsert2
GO


INSERT INTO TableForInsert2
	VALUES(2, N'سعادت', DEFAULT ,'20170125')
GO


SELECT * FROM TableForInsert2
GO

--------------------------------------------------------------------

/*
INSERT عملیات غیر مجاز
*/

DROP TABLE IF EXISTS TableForInsert3
GO


CREATE TABLE TableForInsert3
(
	ID TINYINT,
	Family NVARCHAR(50),
	City NVARCHAR(10),
	DateRegister DATE
)
GO


INSERT INTO TableForInsert3
	VALUES(256, N'سعادت', N'بندرعباس' ,'20170425')
GO


INSERT INTO TableForInsert3
	VALUES(255, N'سعادت', N'علی آباد کتول' ,'20160913')
GO


SELECT * FROM TableForInsert3
GO


INSERT INTO TableForInsert3
	VALUES(1, N'سعادت', N'اصفهان', 2017)
GO




