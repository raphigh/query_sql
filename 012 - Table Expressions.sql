USE Northwind


/*
Table Expressions
- Derived Tables
- Common Table Expressions
- View
- Inline TVF (Inline Table value Function)
*/

-- اسامی شرکتهایی که بیش از 15 سفارش دارند

-- Use :Join
SELECT
	C.CompanyName,
	COUNT(O.OrderID) AS Num
FROM dbo.Customers AS C
	INNER JOIN Orders AS O
		ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName 
	HAVING COUNT(O.OrderID) > 20


-- Use : Sub Query






-- Use: Derive Table




--------------------------------------------------------------------

/*
بررسی الزامات
*/

-- Do Not use order by
SELECT * FROM 
	(SELECT 
		CustOmerID, CompanyName,Country
	 FROM dbo.Customers
		WHERE Country = N'UK'
	 ORDER BY CustomerID
	 ) AS Tmp  


--2) All field must have Name
SELECT * FROM
	(SELECT
		CustomerID, 'Country Name Is:' + CompanyName  
	 FROM dbo.Customers
		WHERE Country = N'UK') AS Tmp

SELECT * FROM
	(SELECT
		CustomerID, Len(CompanyName)  
	 FROM dbo.Customers
		WHERE Country = N'UK') AS Tmp
----------------------------------

SELECT * FROM
	(SELECT
		CustomerID, 'Country Name Is:' + CompanyName Cname  
	 FROM dbo.Customers
		WHERE Country = N'UK') AS Tmp


--3) Unique Column Name

SELECT * FROM
	(SELECT C.CustomerID, O.CustomerID /*AS Cid*/ 
	 FROM dbo.Orders AS O
		JOIN dbo.Customers AS C
			ON C.CustomerID = O.CustomerID
	) AS Tmp

SELECT * FROM
	(SELECT C.CustomerID , O.CustomerID AS Cid 
	  FROM dbo.Orders AS O
		JOIN dbo.Customers AS C
			ON C.CustomerID = O.CustomerID
	) AS Tmp
--------------------------------------------------------------------

/*
کوئری‌ای بنویسید که مشخص کند کدام مشتری 
در هر فاکتور بیش از 5 مورد کالا سفارش داده است


*/

--------------------------------------------------------------------

/*
WITH <CTE_Name> [(<Column_List>)[ ,...n ]]
AS
(
	<Inner_Query_Defining_CTE> 
)
<Outer_Query_Against_CTE>;
*/

WITH Customer_Num AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear, CustomerID
	FROM dbo.Orders
)
SELECT
	OrderYear,
	COUNT(DISTINCT CustomerID) AS Cust_Num
FROM Customer_Num
GROUP BY OrderYear

-- نرخ رشد تعداد مشتریان هرسال نسبت به سال قبل

SELECT
	CurrentYearCustomerCount.OrderYear,
	CurrentYearCustomerCount.Cust_Num AS Cust_Num,
	PrevoiusYearCustomerCount.Cust_Num AS Previous_Cust_Num,
	CurrentYearCustomerCount.Cust_Num - PrevoiusYearCustomerCount.Cust_Num AS Growth
FROM (   SELECT
		   YEAR(OrderDate) AS OrderYear,
		   COUNT(DISTINCT CustomerID) AS Cust_Num
	     FROM dbo.Orders
	     GROUP BY YEAR(OrderDate)
	  ) AS CurrentYearCustomerCount 
	LEFT Outer JOIN 
	(    SELECT 
		    YEAR(OrderDate) AS OrderYear,
		    COUNT(DISTINCT CustomerID) AS Cust_Num 
		 FROM dbo.Orders 
		 GROUP BY YEAR(OrderDate)
	) AS PrevoiusYearCustomerCount 
		ON CurrentYearCustomerCount.OrderYear = PrevoiusYearCustomerCount.OrderYear + 1;
GO

-- Use CTE
WITH Current_Previous
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		COUNT(DISTINCT CustomerID) AS Cust_Num
	FROM dbo.Orders AS O
	GROUP BY YEAR(OrderDate)
)
SELECT
	CurrentYearCustomerCount.OrderYear,
	CurrentYearCustomerCount.Cust_Num,
	PrevoiusYearCustomerCount.OrderYear AS Previous_Cust_Num,
	CurrentYearCustomerCount.Cust_Num - PrevoiusYearCustomerCount.Cust_Num AS Growth
FROM Current_Previous AS CurrentYearCustomerCount
	LEFT outer JOIN Current_Previous AS PrevoiusYearCustomerCount
		ON CurrentYearCustomerCount.OrderYear = PrevoiusYearCustomerCount.OrderYear + 1;

-- تغییر نام ستونهای CTE به نامهای دلخواه
WITH Customer_Num(C1,C2) AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear, CustomerID
	FROM dbo.Orders
)
SELECT
	C1,
	COUNT(DISTINCT C2) AS Cust_Num
FROM Customer_Num
GROUP BY C1;

/*
تودرتو CTE

WITH <CTE_Name1> [(<column_list>)]
AS
(
	<inner_query_defining_CTE>
),
	<CTE_Name2> [(<column_list>)]
AS
(
	<inner_query_defining_CTE>
)
	<outer_query_against_CTE>;
*/

WITH Current_Year
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		COUNT(DISTINCT CustomerID) AS Cust_Num
	FROM Orders AS O
	GROUP BY YEAR(OrderDate)
),
Previous_Year
AS
(
	SELECT
		YEAR(OrderDate) AS OrderYear,
		COUNT(DISTINCT CustomerID) AS Cust_Num
	FROM Orders AS O
	GROUP BY YEAR(OrderDate)
)
SELECT
	Current_Year.OrderYear,
	Current_Year.Cust_Num,
	Previous_Year.OrderYear AS Previous_Cust_Num,
	Current_Year.Cust_Num - Previous_Year.Cust_Num AS Growth
FROM Current_Year
	LEFT Outer JOIN Previous_Year
		ON Current_Year.OrderYear = Previous_Year.OrderYear + 1
GO
