USE Northwind
--بررسی تعداد 
SELECT 
	CustomerID, Region, City
FROM dbo.Customers 
	WHERE Region = N'Sp'

SELECT 
	CustomerID, Region, City
FROM dbo.Customers 
	WHERE Region <> N'Sp'

--اختلاف برای چیست؟

SELECT 
	CustomerID, Region, City
FROM dbo.Customers 
	WHERE Region IS null

SELECT 
	CustomerID, Region, City
FROM dbo.Customers
	WHERE Region <> N'Sp'
	OR Region IS NULL

SELECT 
	CustomerID, Region, City
FROM dbo.Customers
	WHERE  Region IS Not NULL

-- تابع ISNULL برای عوض کردن NULL با مقدار دلخواه
select isnull(null,N'ندارد')

SELECT 
	CustomerID, Isnull(Region,'Nothing'), City
FROM dbo.Customers

SELECT 
	CustomerID, Region, City
FROM dbo.Customers 
	WHERE Region IS null

SELECT 
	CustomerID, Region, City, Isnull(region,'SSS') as NewColumn
FROM dbo.Customers 
where Isnull(region,'SSS')='SSS'
---	WHERE Isnull(Region,'Ali') ='Ali'

-----------------------------------------------------
/*
Distinct:

Select Distinct Field1,Field2, ....
From TableName
*/


SELECT 
	EmployeeID
FROM Orders
	WHERE CustomerID = 'ALFKI'


SELECT 
	DISTINCT EmployeeID
FROM Orders
	WHERE CustomerID = 'ALFKI'

--نحوه عملیات بیش از یک فلید
SELECT 
	EmployeeID, YEAR(OrderDate) AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY EmployeeID


SELECT 
	DISTINCT EmployeeID, YEAR(OrderDate) AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY EmployeeID


-- آیا ترتیب فیلد ها تاثیر دارد؟
SELECT 
	 DISTINCT [State],EmployeeID
FROM PersianEmployee
ORDER BY EmployeeID

SELECT 
	 distinct EmployeeID,[State]
FROM PersianEmployee
ORDER BY EmployeeID



 
 ---------------------------------------------------
  /*
 TOP:
      [   
         TOP (expression) [PERCENT]  
         [ WITH TIES ]  
     ]  
 */
 SELECT 
	OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS


 
SELECT 
	TOP (5) OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS
ORDER BY OrderDate desc

--عملگر بدون پردانتز
SELECT 
	TOP 5 OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS
ORDER BY OrderDate 

--استفاده از یک عبارت
SELECT 
	TOP (5+6*2) OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS
ORDER BY OrderDate 


-- TOP (expression) PERCENT

SELECT 
	OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS
where Year(OrderDate)=1998 and MONTH(OrderDate) in (4,3)

SELECT 
	TOP (10) PERCENT OrderID, OrderDate, ShipName, ShipAddress
FROM ORDERS
Where Year(OrderDate)=1998 and MONTH(OrderDate) in (4,3)
ORDER BY OrderDate

-- TOP (expression) PERCENT
SELECT 
	TOP (5) OrderID, OrderDate, CustomerID, EmployeeID
FROM Orders

select orderid,orderdate
from orders
order by orderdate desc

SELECT 
	TOP (5) WITH TIES OrderID, OrderDate
FROM ORDERS
ORDER BY OrderDate DESC

SELECT 
	TOP (5) WITH TIES  OrderDate,OrderID
FROM ORDERS
ORDER BY OrderID DESC
