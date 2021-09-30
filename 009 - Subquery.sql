/*
Self-Contained Scalar-Valued Subquery
*/

USE Northwind


-- استفاده از Subquery تک مقدار




SELECT MAX(OrderID) FROM dbo.Orders
-- مستقل Subquery جدید‌ترین سفارش ثبت‌شده با استفاده
SELECT
	OrderID, EmployeeID, CustomerID
FROM Orders
	WHERE OrderID = (SELECT MAX(OrderID) FROM dbo.Orders)

------------------------------------------------------
Declare
  @Num int
Set @Num=(SELECT MAX(OrderID) FROM dbo.Orders)

SELECT
	OrderID, EmployeeID, CustomerID
FROM Orders
	WHERE OrderID =@Num

-------------------------------------------------
Declare
  @Num int
Select @Num=(SELECT MAX(OrderID) FROM dbo.Orders)
--------------------------------------------------------------------
-- تعداد سفارشات هر کارمند چند درصد کل سفارشات است

SELECT
    EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY EmployeeID

Select Count(*) From Orders

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num,
	(Select Count(*) From Orders) As CountOrderNumber
FROM dbo.Orders
GROUP BY EmployeeID

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num,
	COUNT(OrderID) / 830.0
FROM dbo.Orders
GROUP BY EmployeeID

 
-- سفارشات کارمند چند درصد از کل سفارشات است

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num,
	(SELECT COUNT(OrderID) FROM dbo.Orders) AS Total
FROM dbo.Orders
GROUP BY EmployeeID


--------------------------------------------------------------------
Use Northwind

SELECT
	OrderID,E.LastName
FROM dbo.Orders AS O
	Inner JOIN Employees AS E
		ON O.EmployeeID = E.EmployeeID
	WHERE E.LastName LIKE N'D%'

Select LastName,EmployeeID from Employees

SELECT
	OrderID
FROM dbo.Orders
	WHERE EmployeeID IN	(SELECT
							E.EmployeeID
						 FROM dbo.Employees AS E
							WHERE E.lastname LIKE N'D%') 



SELECT
	CustomerID, City
FROM Customers
	WHERE City like 'B%'

Select City from Customers
where City like 'B%'

SELECT
	CustomerID, City
FROM Customers
	WHERE City IN 
	(Select City from Customers
where City like 'B%')
---------------------------------------------
SELECT * FROM 
dbo.Customers AS C
LEFT JOIN dbo.Orders AS O
		ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL

Select * from 
Customers 
where
CustomerID Not In 
(select CustomerID
from Orders
)



/*
تعداد سفارشات به تفکیک هر کارمند 
به همراه بیشترین و کمترین تاریخ سفارش
*/



/*
استفاده از Exists
EXISTS ( Subquery ) 
*/

SELECT * FROM dbo.Orders
	WHERE EXISTS (SELECT * FROM dbo.Customers
					WHERE City = N'London')

SELECT * FROM dbo.Orders
	WHERE Not EXISTS (SELECT * FROM dbo.Customers
						WHERE City = N'Tehran')

