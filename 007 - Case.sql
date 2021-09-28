
USE Northwind
/*
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END
*/

-- لیست تمامی محصولات
SELECT
	ProductID, ProductName, CategoryID
FROM dbo.Products



SELECT 
	ProductID, ProductName, CategoryID,
	CASE CategoryID
		WHEN 1 THEN N'نوشیدنی'
		WHEN 2 THEN N'ادویه‌جات'
		WHEN 3 THEN N'مرباجات'
		WHEN 4 THEN N'محصولات لبنی'
		WHEN 5 THEN N'حبوبات'
		WHEN 6 THEN N'گوشت و مرغ'
		WHEN 7 THEN N'ارگانیک'
		WHEN 8 THEN N'دریایی'
		ELSE N'متفرقه'
	END AS CateryName
FROM dbo.Products
ORDER BY CateryName

SELECT 
	ProductID, ProductName, CategoryID,
	CASE 
		WHEN CategoryID=1 THEN N'نوشیدنی'
		WHEN CategoryID=2 THEN N'ادویه‌جات'
		WHEN CategoryID=3 THEN N'مرباجات'
		WHEN CategoryID=4 THEN N'محصولات لبنی'
		WHEN CategoryID=5 THEN N'حبوبات'
		WHEN CategoryID=6 THEN N'گوشت و مرغ'
		WHEN CategoryID=7 THEN N'ارگانیک'
		WHEN CategoryID=8 THEN N'دریایی'
		ELSE N'متفرقه'
	END AS CateryName
FROM dbo.Products
ORDER BY CateryName
--------------------------------------------------------------------

-- محصولات براساس قیمت پایه
SELECT
	ProductID, UnitPrice
FROM dbo.[Order Details]


SELECT ProductID, UnitPrice,
	CASE
		WHEN UnitPrice < 50 THEN N'کمتر از 50'
		WHEN UnitPrice BETWEEN 50 AND 100 THEN N'بین 50 تا 100'
		WHEN UnitPrice > 100 THEN N'بیشتر از 100'
	ELSE N'نامشخص'
	END AS UnitPriceCatery
FROM dbo.[Order Details]
ORDER BY UnitPrice

-------------------------------------------------
-- Use in order by
use [AdventureWorks2017]

SELECT BusinessEntityID, SalariedFlag  
FROM [HumanResources].[Employee]
ORDER BY 
      CASE SalariedFlag WHEN 1 THEN BusinessEntityID END DESC  
      ,CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END

-----------------------------------------------------



