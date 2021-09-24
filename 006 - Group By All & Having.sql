Use Northwind

SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE EmployeeID > 5
GROUP BY EmployeeID
ORDER BY EmployeeID



--تعداد سفارشات مشتریان در هر سال با کدهای زیر
--ANATR,ANTON,AROUT
SELECT
	EmployeeID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID in ('ANATR','ANTON','AROUT')
GROUP BY EmployeeID
ORDER BY EmployeeID
--
SELECT
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS NumOrders,
	SUM(Freight) AS TotalFreight
FROM dbo.Orders
where CustomerID IN ('ANATR','ANTON','AROUT')
GROUP BY CustomerID, YEAR(OrderDate)



-- نمایش پنج تا از مشتریان که بیشترین سفارش را داشته اند
SELECT
	TOP 5 CustomerID,
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY NUM DESC


--------------------------------------------------------------------
-- Group by All Field1 ,Filed2
-- نمایش همه نتایج حتی آنهایی که فیلتر شده اند

SELECT 
	EmployeeID, 
	COUNT(OrderID) AS Num
FROM dbo.ORDERS
	WHERE EmployeeID BETWEEN 1 AND 3
GROUP BY all EmployeeID
ORDER BY EmployeeID


-- تعداد سفارشاتی که کارمندان با شماره ۵ به
-- بعد ثبت کردند و تعداد سفارشات بیش از 71 است
select
Employeeid,
count(orderid)
from orders
where count(orderid)>71 and EmployeeID>5
group by EmployeeID

select
Employeeid,
count(orderid)
from orders
where  EmployeeID>5
group by EmployeeID
having count(orderid)>71
--------------------------------------------------------------------

SELECT
	CustomerID, 
	COUNT(OrderID) AS Num
FROM dbo.ORDERS
GROUP BY CustomerID
-- ?
HAVING Num > 20

SELECT
	CustomerID, 
	COUNT(OrderID) AS Num
FROM dbo.ORDERS
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
--------------------------------------------------------------------
drop table if exists SampleTable
CREATE TABLE SampleTable  (Id int , Col1 char(1) NULL) 
INSERT INTO  SampleTable VALUES (1,'A') 
INSERT INTO  SampleTable VALUES (2,'A') 
INSERT INTO  SampleTable VALUES (3,'B') 
INSERT INTO  SampleTable VALUES (4,'B')
INSERT INTO  SampleTable VALUES (5,NULL) 
INSERT INTO  SampleTable VALUES (6,NULL)

Select * from SampleTable

Select count(*) from SampleTable

Select count(Col1) from SampleTable


Select count(distinct Col1) from SampleTable
--------------------------------------------------------------- 
 