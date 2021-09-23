use northwind
/*
نحوه تعریف متغیر محلی 
DECLARE   
{{ @local_variable [AS] data_type } [ =value ] } [,...n]  
 نحوه مقدار دهی به متغیر ها
 Set @VariableName= value
*/
DECLARE 
  @myvar char(20);  
SET @myvar = 'This is a test';  
SELECT @myvar;

DECLARE  
  @NewBalance  int 
SET  @NewBalance  =  10;  
SET  @NewBalance  =  @NewBalance  *  @NewBalance;  
SELECT  @NewBalance;  


/*
SET @local_variable {+= | -= | *= | /= | %= | &= | ^= | |= } expression
Compound assignment operator:

+= Add and assign
-= Subtract and assign
*= Multiply and assign
/= Divide and assign
%= Modulo and assign
&= Bitwise AND and assign
^= Bitwise XOR and assign
|= Bitwise OR and assign
*/
/* Example Two */  
DECLARE @Balance int = 10;  
SET @Balance *= 10;  
SELECT @Balance;  

--Declare
-- @a tinyint,
-- @b tinyint

-- Set @a=5
-- Set @b=1
-- set @a|=@b
-- select @a
--------------------------------------------------------------------
/*
ASCII ( character_expression )  
کد اسکی متناظر را برمیگرداند

CHAR ( integer_expression )  
کاراکتر متناظر کد اسکی را برمی گرداند
خروجی بین 0 تا 255
*/
SELECT ASCII('A') AS A
	 , ASCII('B') AS B
	 , ASCII('a') AS a
	 , ASCII('b') AS b
	 , ASCII(1) AS [1]
	 , ASCII(2) AS [2]

SELECT ASCII('a')- ASCII('A')

SELECT CHAR(65) AS [65]
	 , CHAR(66) AS [66]
	 , CHAR(97) AS [97]
	 , CHAR(98) AS [98]
	 , CHAR(49) AS [49]
	 , CHAR(50) AS [50]

SELECT ASCII('æ') AS [Extended_ASCII]
SELECT Char(230) AS [Extended_Char]

SELECT ASCII('rerb') 
SELECT Char(256)
SELECT Char(255)

select char(0x41)

SELECT ASCII(N'a') 
SELECT ASCII(N'ب') 
SELECT ASCII(N'م') 

SELECT Char(63)
/*
NCHAR ( integer_expression ) 
کاراکتر یونیکد عدد مشخص شده را برمی گرداند
Dec: 0-65535 
Hex:0-0FFFF 
*/
SELECT NChar(1575) AS [1575], 
	   NChar(1576) AS [1576],
	   NChar(1662) AS [1662],
	   NChar(1578) AS [1578]


SELECT NCHAR(143743); 

/*
UNICODE ( 'ncharacter_expression' ) 
کد کاراکتر یونیکد را برمی گرداند

*/
SELECT unicode(N'ا') AS N'ا', 
	   unicode(N'ب') AS N'ب',
	   unicode(N'پ') AS N'پ',
	   unicode(N'ت') AS N'ت'

SELECT unicode(N'الف')


/*
LEN ( string_expression )
طول رشته

DATALENGTH ( expression )
مقدار حافظه تخصیص داده شده برای رشته

*/

SELECT LEN('Ali');
Go

SELECT DATALENGTH('Ali');
GO

SELECT LEN(N'علی');
Go

SELECT DATALENGTH(N'علی');
Go


-- ۵ فاصله خالی گذاشته شده
SELECT LEN(N'Ali     ');
Go

SELECT DATALENGTH(N'Ali     ');
Go 

SELECT Datalength('Ali     ')

SELECT LEN('aa  BB')
GO
--------------------------------------------------------------------

/*
LOWER ( character_expression )
کوچک کردن حروف رشته برای رشته های انگلیسی

UPPER ( character_expression )
بزرگ کردن حروف رشته برای رشته های انگلیسی

*/

SELECT UPPER('heLLo wOrld') [upper];
Go
SELECT LOWER('heLLo wOrld') [lower];
GO

--------------------------------------------------------------------

/*
RTRIM ( character_expression )
حذف فاصله از سمت راست رشته


LTRIM ( character_expression )
حذف فاصله از سمت چپ رشته

*/

SELECT RTRIM('  My String  ') 
Go

SELECT LTRIM(' My String ')
Go

/*
Trim ( character_expression )
حذف فاصله از دو طرف رشته

*/


Select Trim(' My String ')
Go

SELECT RTRIM(LTRIM(' My String '))
GO

/*
TRIM ( [ characters FROM ] string )
حذف کاراکترهای دلخواه از دو طرف رشته

*/
SELECT TRIM( '.,! ' FROM  '  ,   #  ,   test  !  .') AS Result;

--------------------------------------------------------------------

/*
LEFT ( character_expression , integer_expression ) 
نمایش بخشی از سمت چپ رشته

RIGHT ( character_expression , integer_expression ) 
نمایش بخشی از سمت راست رشته

*/

SELECT LEFT('abcdefg', 3);
Go

SELECT RIGHT('abcdefg', 3);
GO

--------------------------------------------------------------------

/*
SUBSTRING ( expression , start , length )
نمایش بخشی از رشته بر اساس شروع و طول رشته
*/

SELECT SUBSTRING('My String', 1, 4)
GO

--------------------------------------------------------------------

/*
CHARINDEX ( expressionToFind , expressionToBeSearched [ , start_location ] )
 اولین موقعیتِ کاراکتر در رشته

*/

SELECT CHARINDEX('E','SQL Server');
GO

SELECT CHARINDEX('S','SQL Servers',4);
GO

SELECT CHARINDEX('S','SQL Servers',5);
GO

SELECT CHARINDEX('S','SQL Servers',6);
GO

SELECT CHARINDEX(null,'SQL Servers');
GO

SELECT CHARINDEX('er','SQL Servers');
GO

SELECT CHARINDEX('em','SQL Servers');
GO

declare
@T text
set @t='Hello'
SELECT CHARINDEX('l',@t);
GO

SELECT CHARINDEX(char(69),'SQL Servers');
GO


--------------------------------------------------------------------

/*
PATINDEX ( '%pattern%' , expression )  
 اولین موقعیتِ الگو در رشته

*/
SELECT PATINDEX('%ter%', 'interesting data');

SELECT PATINDEX('%en_ure%', 'please ensure the door is locked'); 

SELECT PATINDEX('%[4-9]%', 'ab12cd34ef56gh');

SELECT PATINDEX('%[4-9]%', 'ab12c7d34ef56gh');
GO

--------------------------------------------------------------------

/*
REPLACE ( string_expression =  , string_pattern , string_replacement )

جایگزین کردن بخشی از رشته با رشته موردنظر

*/

SELECT REPLACE('This is a sql Class', 'sql', 'R');

select replace('ab12c7d34ef54gh', '4' , '**')
GO

-- تمرین شمارش تعداد حروف خاص

GO
--------------------------------------------------------------------

/*
REPLICATE ( string_expression ,integer_expression )

تکرار یک رشته به تعداد دلخواه
*/

SELECT REPLICATE('Ali', 3);
GO


/* تمرین
*/
ِDrop Table IF Exists Practice01 
GO  
CREATE TABLE Practice01   
(  
 c1 char(3)  
);  
GO  
INSERT INTO Practice01 VALUES ('2'), ('37'),('597');  
GO 
/* خروجی
Varchar Column        
--------------------  
002                     
037                     
597                     
*/
--------------------------------------------------------------------
/*
REVERSE ( string_expression )  

یک رشته را برعکس می کند
*/
SELECT REVERSE('Ali');
GO

SELECT REVERSE(N'علی');
GO

SELECT REVERSE(1234) AS Reversed ;  
GO 
--------------------------------------------------------------------

/*
الحاق دو رشته
Concatenation  
*/

SELECT 'Hello' + ' '+ 'World'+' '+'!'
	
GO

/*
CONCAT ( string_value1, string_value2 [, string_valueN ] )

*/

SELECT CONCAT('my', ',', 'String', ',', 'is' ,',' , 'simple', '!');
GO

SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;  
Go
/*
CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
الحاق رشته ها با هم بوسیله یک جدا کننده
*/
SELECT CONCAT('City', NULL, NULL, 'Street', 'Allay', 142) AS Address; 

SELECT CONCAT_WS('-','City', NULL, NULL, 'Street', 'Allay', 142) AS Address; 

SELECT CONCAT_WS(1,'Sesaon','Episode') AS FilmAddress; 

SELECT CONCAT_WS(1,'Sesaon','Episode',null) AS FilmAddress; 

SELECT CONCAT_WS(1,'Sesaon','Episode','') AS FilmAddress; 
--------------------------------------------------------------------
/*
STUFF ( character_expression , start , length , replaceWith_expression ) 

حذف بخشی از رشته و جایگزین کردن رشته موردنظر
*/

SELECT STUFF('Password', 2, 5, N'***');
GO
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  
GO  
--------------------------------------------------------------------
/*
TRANSLATE ( inputString, characters, translations)

جایگزین کردن قسمتی از رشته با رشته دلخواه
*/
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');


SELECT TRANSLATE('[137.4, 72.3]' , '[,]', '( )') AS Point
SELECT TRANSLATE('(137.4 72.3)' , '(  )', '[,,]') AS Coordinates;

SELECT TRANSLATE('abcdefabc','abc','bcd') AS Translated
-- تمرین:عبارت بالا را بدون استفاده از تابع ترجمه بنویسید


SELECT TRANSLATE('abcdef','abc','bc d') AS Translated

--------------------------------------------------------------------
/*
STRING_SPLIT ( string , separator )  

جدا سازی (تکه کردن) عناصر یک رشته بر اساس یک جدا کننده
*/
SELECT * FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');
SELECT * FROM STRING_SPLIT('clothing,road,,touring,bike' , ',');

--------------------------------------------------------------------
/*
SPACE ( integer_expression )  

به تعداد دلخواه کاراکتر فاصله تولید می کند
*/
Select 'FirstName' + Space(5) + 'LastName'
--تمرین تابع را با استفاده از Replicate بنویسید
