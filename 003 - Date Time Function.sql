USE Northwind;
GO


--------------------------------------------------------------------
/*
دسترسی به تاریخ جاری
SYSDATETIME()        ->datetime2(7) 
SYSDATETIMEOFFSET()  ->datetimeoffset(7)
SYSUTCDATETIME()  	 ->datetime2(7)
CURRENT_TIMESTAMP  	 ->datetime 
GETDATE()  		  	 ->datetime 
GETUTCDATE()   	  	 ->datetime 
*/

SELECT SYSDATETIME()         As [SYSDATETIME]    
      ,SYSDATETIMEOFFSET()   AS [SYSDATETIMEOFFSET]  
      ,SYSUTCDATETIME()  	 AS [SYSUTCDATETIME] 
      ,CURRENT_TIMESTAMP     AS [CURRENT_TIMESTAMP]
      ,GETDATE()  		     AS [GETDATE] 		
      ,GETUTCDATE()   	     AS [GETUTCDATE]   	
--------------------------------------------------------------------

/*
YEAR/MONTH/DAY/TIME
تفکیک بخش‌های مختلف یک نوع‌داده از جنس تاریخ
*/
SELECT DAY('2015-04-30 01:01:01.1234567');
SELECT MONTH('2015-04-30 01:01:01.1234567');
SELECT YEAR('2015-04-30 01:01:01.1234567');


SELECT YEAR(0), MONTH(0), DAY(0)

SELECT 
	OrderID,
	YEAR(OrderDate) AS N'سال',
	MONTH(OrderDate) AS N'ماه',
	DAY(OrderDate) AS N'روز'
FROM dbo.Orders;
GO

--------------------------------------------------------------------

/*
DATENAME
دسترسی به عناوین بخش‌های مختلف تاریخ
datepart-Abbreviations
year:		yy, yyyy
quarter:	qq, q
month:		mm, m
dayofyear:	dy, y
day:		dd, d
week:		wk, ww
weekday:	dw, w
hour:		hh
minute:		mi, n
second:		ss, s
millisecond:ms
microsecond:mcs
nanosecond:	ns
*/

SELECT 
	 DATENAME(year, '20170915') AS N' سال میلادی'  
    ,DATENAME(month, '20170915') AS N'ماه میلادی'
    ,DATENAME(day, '20170915') AS N'چندمین روز از ماه'
    ,DATENAME(dayofyear, '20170915') AS N'چندمین روز از سال' 
    ,DATENAME(weekday, '20170915')AS N'عنوان روز هفته';
GO
-- تمرین کوئری بالا را بوسیله دستورات مختصر بنویسید



--------------------------------------------------------------------

/*
DATEPART
دسترسی به بخش‌های مختلف تاریخ
*/

SELECT 
	 DATEPART(year, '20170915') AS N' سال میلادی'  
    ,DATEPART(month, '20170915') AS N'ماه میلادی'
    ,DATEPART(day, '20170915') AS N'چندمین روز از ماه'
    ,DATEPART(dayofyear, '20170915') AS N'چندمین روز از سال' 
    ,DATEPART(weekday, '20170915')AS N'چندمین روز هفته';
GO

SELECT DATEPART(week, '2007-04-21 ')
      ,DATEPART(weekday, '2007-04-21 ')

SELECT DATEPART(millisecond, SYSUTCDATETIME())
      ,DATEPART(microsecond, SYSUTCDATETIME())	
	  ,DATEPART(nanosecond, SYSUTCDATETIME())	
--------------------------------------------------------------------

/*
DATEADD()
اضافه و کم کردن به تاریخ موردنظر
*/

SELECT 
	DATEADD(year, 1, '2019-10-05') AS N'افزایش سال',
	DATEADD(year, -1, '2019-10-05') AS N'کاهش سال',
	DATEADD(month, 1, '2019-10-05') AS N'افزایش ماه',
	DATEADD(month, -1, '2019-10-05') AS N'کاهش ماه',
	DATEADD(day, 1, '2019-10-05') AS N'افزایش روز',
	DATEADD(day, -1, '2019-10-05') AS N'کاهش روز';
GO
--------------------------------------------------------------------

/*
DATEDIFF ( datepart , startdate , enddate )  
خروجی  int (-2,147,483,648 to +2,147,483,647)
DATEDIFF_BIG ( datepart , startdate , enddate )  
خروجی bigint (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)
محاسبه اختلاف میان دو تاریخ
*/

SELECT DATEDIFF(day, '20190320',GETDATE());
GO

SELECT DATEDIFF(second, '20190320',GETDATE());
GO
--تمرین تعداد روزهای سپری شده از تاریخ تولد خود را بیابید


SELECT DATEDIFF(second, '18700320',GETDATE());
GO

--------------------------------------------------------------------

/*
ISDATE(
تشخیص معتبر بودن تاریخ
*/

SELECT ISDATE('20140212'), ISDATE('2000212');



