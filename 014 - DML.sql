
/*
SELECT [ ALL | DISTINCT ]   
    [TOP ( expression ) [PERCENT] [ WITH TIES ] ]   
    < select_list >  
    [ INTO new_table ]     <-----
    [ ON filegroup ]       <-----
    [ FROM { <table_source> } [ ,...n ] ]   
    [ WHERE <search_condition> ]   
    [ <GROUP BY> ]   
    [ HAVING < search_condition > ]   
*/
Select 
CustomerID
,Year(Orderdate) AS YearOrder
,SUM(Freight ) AS SumValue
--INTO NEWCustomerOrders
From Orders
Where CustomerID In ('ANATR','ANTON','AROUT')
GROUP BY CustomerID,Year(Orderdate)


SELECT * FROM NEWCustomerOrders

-----------------------------------------------------------
-- Constraints, Keys, Persmissions, Triggers Not Transfer
-----------------------------------------------------------

DROP TABLE IF EXISTS NEWCustomerOrders

Select 
IDENTITY (int, 100, 5) AS TableID
,CustomerID
,Year(Orderdate) AS YearOrder
,SUM(Freight) AS FreightSum
INTO NEWCustomerOrders
From Orders
Where CustomerID In ('ANATR','ANTON','AROUT')
GROUP BY CustomerID,Year(Orderdate)

SELECT * FROM NEWCustomerOrders
----------------------------------------
--Problem: Use ( And )
SELECT * INTO dbo.CustomerOrders1
FROM 
    (SELECT
	  C.CustomerID, C.City, O.OrderID
    FROM dbo.Customers AS C
	  JOIN dbo.Orders AS O ON C.CustomerID = O.CustomerID 
	  ) ddd

-----------------------------------------
/*
INSERT   
{  
        [ TOP ( expression ) [ PERCENT ] ]   
        [ INTO ]   
    {  
        [ ( column_list ) ]   
        { VALUES ( { DEFAULT | NULL | expression } [ ,...n ] ) [ ,...n     ]   
        | derived_table   
        | execute_statement  
        | <dml_table_source>  
        | DEFAULT VALUES   
        }  
    }  
}  
*/

Drop TABLE IF EXISTS ProductsTemp
Create Table ProductsTemp
(
ProductName VARCHAR(50),
SupplierName VARCHAR(80),
CategoryName VARCHAR(30),
TotalValue decimal
)

Select ProductName,s.CompanyName,c.CategoryName,o.UnitPrice*o.Quantity As TotalValue 
From Products p
INNER JOIN [Order Details] o on o.ProductID=p.ProductID
INNER JOIN Suppliers s ON s.SupplierID=p.SupplierID
INNER JOIN Categories c On c.CategoryID=p.CategoryID

Insert Into ProductsTemp(ProductName,SupplierName)
Select ProductName,s.CompanyName 
From Products p
INNER JOIN [Order Details] o on o.ProductID=p.ProductID
INNER JOIN Suppliers s ON s.SupplierID=p.SupplierID
INNER JOIN Categories c On c.CategoryID=p.CategoryID

Select * from ProductsTemp
where CategoryName is null

/*
DELETE 
    [ FROM [database_name . [ schema ] . | schema. ] table_name ]   
    [ WHERE <search_condition> ]   
    [ OPTION ( <query_options> [ ,...n ]  ) ]  
[; ]  
*/
DROP TABLE IF EXISTS dbo.Students;
GO

CREATE TABLE Students
(
	ID INT IDENTITY,
	[Name] NVARCHAR(10),
	Family NVARCHAR(20)
)

INSERT Students Values
('Ahmad','Ahmadi'),
('Reza','Rezaei'),
('Mohammad','Mohammadi'),
('Akbar','Akbari')

Select * 
--delete
from Students
where id=3

Delete From Students
WHERE id =2

Select * from Students

Delete From Students


Select * from Students
DBCC Checkident ('Students',reseed ,0)

INSERT Students Values ('Behzad','Behzadi')
Select * from Students
/*
TRUNCATE TABLE { database_name.schema_name.table_name | schema_name.table_name | table_name }  
*/
DROP TABLE IF EXISTS dbo.Students;
GO

CREATE TABLE Students
(
	ID INT IDENTITY,
	[Name] NVARCHAR(10),
	Family NVARCHAR(20)
)

INSERT Students Values
('Ahmad','Ahmadi'),
('Reza','Rezaei'),
('Mohammad','Mohammadi'),
('Akbar','Akbari')

Select * from Students

Set Identity_insert OFF/ON

Truncate Table  Students
INSERT Students Values ('Behzad','Behzadi')

Select * from Students


-----------------------------------------
-- Delete For Refrences Data
DROP TABLE IF EXISTS Child,Parent
GO

CREATE TABLE Parent
(
	ID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(10),
	Age int
);
GO

INSERT INTO Parent
	VALUES 
	('Ahmadi',45),
	('Rezaei',38),
	('Mohammadi',30)
GO

SELECT * FROM Parent
GO
CREATE TABLE Child
(
	ID INT REFERENCES Parent(ID),
	Name varchar(30)
)

INSERT INTO Child
	VALUES 
	(1,'Mohammad'),
	(1,'Reza'),
	(1,'Maryam'),
	(2,'Alireza'),
	(2,'Fatemeh'),
	(3,'Ahmad')
GO

select * from Child

Select * 
from Parent
JOIN Child on Child.id=Parent.id

Delete From Parent
Where id=2
----------------------------------------
Delete from Child
where ID=2

Delete From Parent
Where id=2
----------------------------------------
DROP TABLE IF EXISTS Child,Parent
GO

CREATE TABLE Parent
(
	ID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(10),
	Age int
);
GO

INSERT INTO Parent
	VALUES 
	('Ahmadi',45),
	('Rezaei',38),
	('Mohammadi',30)
GO

SELECT * FROM Parent
GO
CREATE TABLE Child
(
	ID INT REFERENCES Parent(ID) ON DELETE CASCADE,
	Name varchar(30)
)

INSERT INTO Child
	VALUES 
	(1,'Mohammad'),
	(1,'Reza'),
	(1,'Maryam'),
	(2,'Alireza'),
	(2,'Fatemeh'),
	(3,'Ahmad')
GO
SELECT * From Child

Delete From Parent
Where id=2

SELECT * From Parent
SELECT * From Child

-----------------------------------------
/*
UPDATE [ database_name . [ schema_name ] . | schema_name . ] table_name   
SET { column_name = { expression | NULL } } [ ,...n ]  
[ FROM from_clause ]  
[ WHERE <search_condition> ]   
[ OPTION ( LABEL = label_name ) ]  
[;]  
*/
SELECT * 
INTO Products1 
From products


UPDATE Products1
	SET ProductName = Concat('-', ProductName ,'-')
GO

Select * from Products1

UPDATE Products1
	SET ProductName = Replace( ProductName ,'-','')
GO
Select * from Products1

UPDATE Products1
	SET ProductName = 'Cheese'
	Where ProductName='Tofu'
GO
-- Join
Select * 
INTO OD1
from [Order Details]
--کسانی که بیش از ۴۰ قلم کالا در سفارش خود دارند تخفیف ۳۰ درصدی به آنها داده شود
Select * 
from OD1 JOIN Products1 P
On OD1.ProductID=p.ProductID
where OD1.Quantity>40

UPDATE OD1
SET Discount=0.3
from OD1 JOIN Products1 P
On OD1.ProductID=p.ProductID
where OD1.Quantity>40

