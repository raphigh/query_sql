USE Northwind

create table Grades
(
  GradeNumber int 
)

insert into grades values
(1),(4),(5),(10),(3)

select * from grades

/*
-- Aggrigate Functions Count,Sum,Max,Min,Avg
Count ( [ ALL | DISTINCT ] expression ) 
Sum ( [ ALL | DISTINCT ] expression )
Min ( [ ALL | DISTINCT ] expression )
Max ( [ ALL | DISTINCT ] expression )
Avg ( [ ALL | DISTINCT ] expression )
*/
select
  '1 , 4 , 5 , 10 , 3' As Input,
  Count(GradeNumber) AS [Count],
  Sum(GradeNumber)   AS [Sum],
  Max(GradeNumber)   AS [Max],
  Min(GradeNumber)   AS [Min],
  Avg(GradeNumber) 	 AS [Avg]
from grades




--------------------------------------------------

SELECT
	 EmployeeID,CustomerID
FROM dbo.Orders
GROUP BY EmployeeID,CustomerID



-- همه فیلدهای Select باید در Group by باشند
SELECT
	EmployeeID, CustomerID
FROM dbo.Orders
GROUP BY EmployeeID


 
SELECT
	EmployeeID
FROM dbo.Orders
GROUP BY EmployeeID, CustomerID

-- استفاده از توابع تجمعی

SELECT
	CustomerID, 
	COUNT(OrderID) AS Num
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY CustomerID


SELECT
	CustomerID, 
	COUNT(OrderID) AS Num,
	MAX(OrderDate) AS MaxDate
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY CustomerID


--------------------------------------------------------------------


--گروه‌بندی چند سطحی


SELECT
	Region, City,
	COUNT(CustomerID) AS Num
FROM dbo.Customers
GROUP BY Region,City

-- سفارشات هر کارمند به تفکیک سال که شامل تعداد کل سفارش و مجموع کرایه‌های ثبت شده

select * from Orders

