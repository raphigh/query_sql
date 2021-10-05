--------------------------------------------------------------
/*
CREATE [ OR ALTER ] VIEW [ schema_name . ] view_name [ (column [ ,...n ] ) ]   
[ WITH <view_attribute> [ ,...n ] ]   
AS select_statement   
[ WITH CHECK OPTION ]   
[ ; ]  
  
<view_attribute> ::=   
{  
    [ ENCRYPTION ]  
    [ SCHEMABINDING ]  
    [ VIEW_METADATA ]       
} 
*/

-- اسامی مشتریان به همراه تعداد سفارشات
SELECT
	C.CompanyName,
	C.City,
	(SELECT COUNT(O.OrderID) FROM dbo.Orders AS O 
		WHERE C.CustomerID = O.CustomerID) AS Num
FROM dbo.Customers AS C;
GO

-- اسامی مشتریان لندنی به همراه تعداد سفارشات
SELECT
	C.CompanyName,
	C.City,
	(SELECT COUNT(O.OrderID) FROM dbo.Orders AS O 
		WHERE C.CustomerID = O.CustomerID) AS Num
FROM dbo.Customers AS C
Where c.City='London'
GO

-- اسامی مشتریان پاریسی به همراه تعداد سفارشات
SELECT
	C.CompanyName,
	C.City,
	(SELECT COUNT(O.OrderID) FROM dbo.Orders AS O 
		WHERE C.CustomerID = O.CustomerID) AS Num
FROM dbo.Customers AS C
Where c.City='Paris'
GO

DROP VIEW IF EXISTS CustomerOrderList;
GO

CREATE VIEW dbo.CustomerOrderList
AS
SELECT
	C.CompanyName,
	C.City,
	(SELECT COUNT(O.OrderID) FROM dbo.Orders AS O 
		WHERE C.CustomerID = O.CustomerID) AS Num
FROM dbo.Customers AS C
GO

Select * From  CustomerOrderList
where CustomerOrderList.city='Paris'

Select * From  CustomerOrderList
where CustomerOrderList.city='Madrid'

--در صورتی که جدول شما تغییر می کند از * در ویو استفاده نکنید
DROP TABLE IF EXISTS TestTable
GO

CREATE TABLE TestTable
(
	ID INT
)
GO

INSERT INTO TestTable
VALUES (1),(2),(3);
GO

select * from TestTable

DROP VIEW IF EXISTS TestView
GO

-- VIEW ایجاد
CREATE VIEW TestView
AS
	SELECT * FROM TestTable
GO

-- VIEW فراخوانی
SELECT * FROM TestView
GO

-- Test_VIEW اضافه کردن فیلد جدید به جدول
ALTER TABLE TestTable
ADD Code INT IDENTITY
GO

SELECT * FROM TestTable
GO

-- ذخیره شده است VIEW فقط اطلاعات مربوط به قبل از تغییرات جدول در متا‌دیتای
SELECT * FROM TestView
GO

/*
(VIEW به‌روزرسانی) VIEW اعمال تغییرات جدول بر روی
*/
EXEC sp_refreshview 'TestView';
GO
SELECT * FROM TestView
GO
EXEC sp_refreshsqlmodule 'TestView';
GO
SELECT * FROM TestView
GO

ALTER VIEW TestView
AS
	SELECT ID,Code FROM TestTable
GO

SELECT * FROM TestView
GO

--------------------------------------------------------------------

--VIEW بدست آوردن اطلاعاتی درباره 
SP_HELPTEXT 'TestView'
GO

SELECT * FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'TestView'
GO

SELECT * FROM sys.sql_modules 
	WHERE object_id = object_id('TestView');
GO
select object_id('TestView')

create view aa
as
select 'Mohammad' vvv

select * from aa

drop view if exists aa

create view OrdCustEmp
as
select OrderID,c.CompanyName,e.LastName
From orders o join customers c on o.CustomerID=c.CustomerID
     join Employees e on e.EmployeeID=o.EmployeeID

select * from OrdCustEmp

--------------------------------------------------------------------
-- دیگر VIEW در VIEW فراخوانی یک

DROP VIEW IF EXISTS EmpOrdersCount, EmpOrdersCountWithCondition;
GO

-- ای که از طریق آن تعداد سفارشات هر کارمند شمارش می‌شود VIEW
CREATE VIEW EmpOrdersCount
AS
	SELECT 
		EmployeeID,
		COUNT(OrderID) AS Num
	FROM dbo.Orders
	GROUP BY EmployeeID
GO

SELECT * FROM EmpOrdersCount
GO

-- دیگری فراخوانی می‌شود VIEW ای که در آن VIEW
CREATE VIEW EmpOrdersCountWithCondition
AS
	SELECT * FROM EmpOrdersCount
		WHERE NUM > 100;
GO

SELECT * FROM EmpOrdersCountWithCondition
GO

drop view EmpOrdersCount
