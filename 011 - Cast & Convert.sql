/*
-- CAST Syntax:  
CAST ( expression AS data_type [ ( length ) ] )  
  
-- CONVERT Syntax:  
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  

Find Styles And Implicit conversions:
https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15
*/


DECLARE @myval decimal (5, 2);  
SET @myval = 193.57;  
SELECT CAST(@myval AS decimal(10,1));  
-- Or, using CONVERT  
SELECT CONVERT(decimal(10,5),@myval);
-- How To Round
SELECT  CAST(10.6496 AS int) as trunc1,
         CAST(-10.6496 AS int) as trunc2,
         CAST(10.6496 AS numeric) as round1,
         CAST(-10.6496 AS numeric) as round2;

-- Convert Null
DECLARE @x NVARCHAR(10) 
select NCHAR(0x10000)
SET @X= 'ab' + NCHAR(0x10000);  
Select @x
SELECT CAST (@x AS NVARCHAR(3))
---------------------------------------------
USE AdventureWorks2017;  
GO  
SELECT SUBSTRING(Name, 1, 30) AS ProductName, ListPrice  
FROM Production.Product  
WHERE CAST(ListPrice AS int) LIKE '33%';  
GO  
  
-- Use CONVERT.  
USE AdventureWorks2017;  
GO  
SELECT SUBSTRING(Name, 1, 30) AS ProductName, ListPrice  
FROM Production.Product  
WHERE CONVERT(int, ListPrice) LIKE '33%';  
GO  
----------------------------------------



