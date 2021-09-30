USE Northwind


/*
Correlated Subquery
*/

-- نمایش جدیدترین سفارش هر مشتری
SELECT
	CustomerID,
	MAX(OrderID) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID

-- شماره مشتری به همراه آخرین شماره سفارش
SELECT
	CustomerID,
	(SELECT MAX(OrderID) FROM dbo.Orders) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID

-- آخرین سفارشی که ثبت شده
SELECT
	CustomerID,
	OrderID
FROM dbo.Orders
	WHERE OrderID = (SELECT MAX(OrderID) FROM dbo.Orders)

SELECT
	CustomerID,
	MAX(OrderID) AS NewOrder
FROM dbo.Orders
GROUP BY CustomerID

SELECT
	CustomerID,
	(SELECT MAX(OrderID) FROM dbo.Orders AS O2 
	WHERE O2.CustomerID = O1.CustomerID) AS NewOrder
FROM dbo.Orders AS O1
GROUP BY CustomerID


SELECT
	CustomerID,
	OrderID
FROM dbo.Orders AS O1
	WHERE OrderID =	(SELECT
						MAX(O2.OrderID)
					 FROM dbo.Orders AS O2
						WHERE O2.CustomerID = O1.CustomerID
						)


 


 -- تمرین
-- Correlated Subquery نمایش تعداد سفارش همه شرکت‌ها با استفاده از 


