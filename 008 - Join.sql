use Northwind 

/*
SELECT 
	<SELECT list>
FROM <table1>
CROSS JOIN <table2> 

SELECT 
	<SELECT list>
FROM <table1> , <table2>

*/

Select * from LastNameTable cross join nameTable

Select * from LastNameTable , nameTable



-- تمامی ترکیبات دو تایی میان مشتریان و کارمندان
SELECT
	Cu.CustomerID, Em.EmployeeID
FROM dbo.Customers AS Cu, dbo.Employees AS Em

-----------------------------------------------------------------
/*
SELF JOIN
join یک جدول با خودش
*/
Select * from 
NameTable as N1 Cross Join NameTable as N2

Select N1.Name from 
NameTable N1 Cross Join NameTable N2




/*
INNER JOIN: ANSI SQL-92

SELECT Column_list
FROM 
TABLE1 INNER JOIN TABLE2
ON Table1.ColName = Table2.ColName

*/
 



-- نمایش نام و نام‌خانوادگی هر کارمند و سفارشات ثبت‌شده توسط او
Select 
  e.FirstName+' '+e.LastName,OrderDate,Freight,ShipCity 
From 
Orders Inner Join Employees e
ON orders.EmployeeID=e.EmployeeID

-- نمایش نام و نام‌خانوادگی هر کارمند
--و سفارشات ثبت‌شده توسط او ، بشرطی که اسم کارمند با A شروع شود
Select
Em.FirstName+' '+Em.LastName,Ord.Orderid, Ord.Orderdate
From 
Orders Ord  Inner join Employees Em
On Ord.EmployeeID=em.EmployeeID
where em.FirstName like 'A%'


Select
Em.FirstName,Count(Ord.Orderid)
From 
Orders Ord  Inner join Employees Em
On Ord.EmployeeID=em.EmployeeID
where em.FirstName like 'A%'
group by Em.FirstName

Select
Em.FirstName,Count(Ord.Orderid)
From 
Orders Ord  Inner join Employees Em
On Ord.EmployeeID=em.EmployeeID
group by Em.FirstName
having count(orderid)>50

-- کلیدهای چند تایی
-- Composite Join
Create Table Fruit
(
FID1 int,
FID2 int,
Descriptin Varchar(30)
)

Create Table Food
(
DID1 int,
DID2 int,
Descriptin Varchar(30)
)
Insert into Fruit
Values
(1,100,'Apple'),
(1,200,'Orange'),
(2,100,'Banana'),
(2,200,'Peach')

Insert into Food
Values
(1,100,'Apple Juice'),
(1,100,'Apple Tart'),
(1,100,'Apple Ice Cream'),
(1,100,'Apple Jam'),
(1,200,'Orange Juice'),
(1,200,'Orange Tart'),
(2,100,'Banana Ice Cream'),
(2,100,'Banana Jam')

Select * from Fruit
Select * from Food

select * from 
Food Fo inner join fruit Fu 
on Fu.Fid1=Fo.DID1 and fu.FID2=fo.DID2

--Non-Equi---------------------------------------------------------
select * from NameTable
select * from LastNameTable


select * from
NameTable inner join LastNameTable
on NameTable.ID <> LastNameTable.ID


select * from 
NameTable N1  inner join NameTable N2
on N1.ID <> N2.ID



-------------------------------------------------------------------
--Multi Join
--تولید کنندگان سفارشهای ۱۰۲۴۸و۱۰۲۵۳ و۱۰۲۵۵
Select * from [Order Details]
where OrderID IN (10248,10253,10255)

Select CompanyName,Address from Suppliers

Select ProductID,ProductName,* from Products

Select Orderid,CompanyName,Address,pr.ProductID,ProductName From
Suppliers su inner join Products pr
On su.SupplierID = pr.SupplierID
Inner join [Order Details] Det
on det.ProductID=pr.ProductID
where OrderID IN (10248,10253,10255)



-- تمرین:سفارش هر مشتری به‌همراه عنوان شرکتش،
-- کد سفارش، کد محصول و تعداد سفارش
-- جداول order details,Customer, ?
select 
C.CompanyName,O.OrderID,ProductID,Quantity
From
[Order Details] OD Join Orders O
On  Od.OrderID=O.OrderID
Join Customers C 
On c.CustomerID = O.CustomerID
--------------------------------------------------------------------
/*
OUTER JOIN: ANSI SQL-92

SELECT 
	Column_list
FROM <table1>
LEFT | RIGHT | FULL [OUTER] JOIN <table2>
*/

Select * from Fruit
Select * from Food

select * from fruit Fu
Left Outer join Food Fo 
on Fu.Fid1=Fo.DID1 and Fu.Fid2=Fo.DID2

select * from fruit Fu
Right Outer join Food Fo 
on Fu.Fid1=Fo.DID1 and Fu.Fid2=Fo.DID2
Insert Into Food
values (3,300,'Mango Juice')
Select * from Fruit
Select * from Food
select * from fruit Fu

Full Outer join Food Fo 
on Fu.Fid1=Fo.DID1 and Fu.Fid2=Fo.DID2
--------------------------------------------------
create table Teachers 
(
Tid int,
TName nvarchar(50)
)

insert Teachers(Tid,TName) values (1,'Ali')
insert Teachers(Tid,TName) values (2,'Nima')
insert Teachers(Tid,TName) values (3,'Reza')
insert Teachers(Tid,TName) values (4,'Peyman')

create table ClassName 
(
Tid int,
CName varchar(50)
)

insert ClassName(Tid,CName) values (1,'SQL')
insert ClassName(Tid,CName) values (2,'VB.NET')
insert ClassName(Tid,CName) values (2,'VB6')
insert ClassName(Tid,CName) values (1,'Access')
insert ClassName(Tid,CName) values (3,'Word')
insert ClassName(Tid,CName) values (5,'C')
insert ClassName(Tid,CName) values (5,'SQL')

Select * from Teachers
Select * from ClassName

select *
From ClassName Inner join Teachers
On ClassName.Tid = Teachers.Tid

select ClassName.CName,ISNULL( Teachers.TName, N'ندارد')
From ClassName Left Outer join Teachers
On ClassName.Tid = Teachers.Tid
where Teachers.TName Is null

--Select * From 

-- نمایش سفارش تمامی مشتریان حتی آن‌هایی که سفارش نداشته‌اند
Select c.* from
Orders Right Outer Join Customers C
on Orders.CustomerID = C.CustomerID

-- نمایش مشتریانی که سفارش نداشتند
Select c.* from
Orders Right Outer Join Customers C
on Orders.CustomerID = C.CustomerID
where Orders.OrderID Is null
-- اسامی ۵ مشتری ای که بیشرین تعداد سفارش را داشته اند
select top 5 C.CompanyName,Count(orderID) OrderNum 
from orders O
Inner join Customers C on C.CustomerID=O.CustomerID
Group By C.CompanyName
order by Count(orderID) desc

-- اسامی ۵ مشتری برتر که بیشترین مبلغ را پرداخت کرده اند

-- استفاده از فیلدهای جدول Order Detail
-----------------------------------------------------


