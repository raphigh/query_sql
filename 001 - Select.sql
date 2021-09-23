/*
SELECT select_list [ INTO new_table ]
[ FROM table_source ] [ WHERE search_condition ]
[ GROUP BY group_by_expression ]
[ HAVING search_condition ]
[ ORDER BY order_expression [ ASC | DESC ] ]
*/

USE Northwind


SELECT 1


SELECT N'محمد'


-- کل جدول Orders
SELECT * FROM Orders




-- انتخاب ستون دلخواه
SELECT OrderID, OrderDate, EmployeeID, CustomerID
FROM [dbo].[Orders]


-- ایجاد نام مستعار
SELECT Ord.OrderID, Ord.EmployeeID
FROM [dbo].[Orders]  AS ord

SELECT Ord.OrderID, Ord.EmployeeID
FROM [dbo].[Orders]  ord

--
SELECT * FROM Order Details
SELECT * FROM [Order Details]

------------------------------------------------------
--مشخصات کارمند با شماره 6 از جدول سفارشات
select  [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
  from [Northwind].[dbo].[Orders]
  where EmployeeID=6


--Where Clause
/* Comparison Operators:
	=   >   <   >=   <=   <>
*/

SELECT * FROM Products
WHERE UnitPrice = 18


SELECT * FROM Products
WHERE UnitPrice >= 14

SELECT * FROM Products
WHERE UnitPrice <> 18

-- Operator : Between , In , Not

select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
	where OrderID IN (10248, 10253, 10320)


select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
	where OrderID NOT IN (10248, 10253, 10320)
	
SELECT * FROM Products
where ProductName in ('Chai' , 'Chang' , 'Aniseed Syrup')

select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
	where EmployeeID BETWEEN 5 AND 7

-- Or & And
select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
where EmployeeID=4 or EmployeeID=6

-- معادل between  کوئری بالا
select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
where EmployeeID >= 5 and EmployeeID<=7


select CustomerID, EmployeeID, OrderDate , OrderID
from Orders
where EmployeeID >= 5 and OrderID<=10275

-- LIKE
/*
match_expression [ NOT ] LIKE pattern [ ESCAPE escape_character ]

% : Any string of zero or more characters.
_ (underscore) : Any single character.
[ ] : Any single character within the specified range ([a-f]) or set ([abcdef]).
[^] : Any single character not within the specified range ([^a-f]) or set ([^abcdef]).
*/
select * 
from customers 
where customerid like '%aa'


select * 
from customers 
where customerid like '%z%'

select * 
from customers 
where customerid like 'A%'

select * 
from customers 
where customerid like 'A[^N]%'


select *
from PersianEmployee
	where LastName LIKE N'س%'



select *
from PersianEmployee
	where LastName NOT LIKE N'م%'



select *
from PersianEmployee
	where LastName LIKE N'%ی'



select *
from PersianEmployee
	where LastName LIKE N'[س-ق]%'


-- دو علامت _
select *
from PersianEmployee
	where FirstName LIKE N'س__'



/* تمرین
Symbol	Meaning
LIKE '5[%]'	
LIKE '[_]n'	
LIKE '[a-cdf]'	
LIKE '[-acdf]'	
LIKE '[ [ ]'	
LIKE ']'	
LIKE 'abc[_]d%'	
LIKE 'abc[def]'	
*/
--------------------------------------------------------------------

/* Logical Operators:
	AND OR
*/

select 
	OrderID, EmployeeID, OrderDate
from Orders
	where OrderDate >= '19970430'
		AND EmployeeID IN(1, 2, 3)


--------------------------------------------------------------------

/*
Arithmetic Operators:
	+   –   *   /   % 
*/

select 
	OrderID as id, productid pid, [Quantity], [UnitPrice], [Discount]
	,[Quantity] * UnitPrice * (1 - Discount) AS val
from [Order Details]

--------------------------------------------------------------------

/*
اولویت اجرای اپراتورها

1. ( ) (Parentheses)
2. * (Multiplication), / (Division), % (Modulo)
3. + (Positive), – (Negative), + (Addition), + (Concatenation), – (Subtraction)
4. =, >, <, >=, <=, <>  (Comparison operators)
5. NOT
6. AND
7. BETWEEN, IN, LIKE, OR
8. = (Assignment)

*/

select 10 + 2 * 3


select ( 10 + 2 ) * 3


select 
	OrderID, CustomerID, EmployeeID, OrderDate
from Orders
	where CustomerID = 'VINET'
		AND EmployeeID IN(1, 3, 5)
		OR CustomerID = 'ALFKI'
		AND EmployeeID IN(2, 4, 6)



select 
	OrderID, CustomerID, EmployeeID, OrderDate
from Orders
	where
	(CustomerID =  'VINET'
	AND EmployeeID IN(1, 3, 5))
		OR
	(CustomerID = 'ALFKI'
	AND EmployeeID IN(2, 4, 6))


---  Ordering
SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
Order by EmployeeID desc


SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY EmployeeID DESC 




SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY  OrderYear

--مرتب سازی بر اساس دو فیلد
SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY  EmployeeID DESC, OrderYear

SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY  EmployeeID DESC, OrderYear desc
-- مرتب سازی بر اساس فیلدهایی که در select می آیند
SELECT 
	EmployeeID, OrderDate AS OrderYear
FROM Orders
	WHERE CustomerID = 'ALFKI'
ORDER BY  2 desc,1


--مرتب سازی بر اساس فیلدی که select وجود ندارد
SELECT [OrderID]
      ,[CustomerID]
      ,[OrderDate]
  FROM [Northwind].[dbo].[Orders]
  WHERE CustomerID = 'ALFKI'
  order by EmployeeID

-- مشتریانی که کد آنها با حرف تی شروع می شود و کشور آنها امریکا است 
-- را به ترتیب کد پستی نزولی نمایش دهید





