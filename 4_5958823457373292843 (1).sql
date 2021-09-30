select c.CompanyName,p.ProductName
from Customers as c join orders as o
on c.CustomerID = o.CustomerID
join
[Order Details] as od
on od.OrderID = o.OrderID
join
Products as p
on p.ProductID = od.ProductID
group by c.CompanyName,p.ProductName
 

 select e.EmployeeID,p.ProductName
from Employees as e join orders as o
on e.EmployeeID = o.CustomerID
join
[Order Details] as od
on od.OrderID = o.OrderID
join
Products as p
on p.ProductID = od.ProductID
group by e.EmployeeID,p.ProductName
--ببخشید،دقیقا یادم نبود توی این دو تا سوال چه چیز هایی رو میخواست آخه صورت سوالو به اسکریپتم اضافه کردم ولی برقا رفت همش پرید
-- اسامی ۵ مشتری برتر که بیشترین مبلغ را پرداخت کرده اند
select top(5) c.CompanyName,(od.UnitPrice * od.Quantity) as buy
from Customers as c join orders as o
on c.CustomerID = o.CustomerID
join
[Order Details] as od
on od.OrderID = o.OrderID
order by (od.UnitPrice * od.Quantity) desc

/*
تعداد سفارشات به تفکیک هر کارمند 
به همراه بیشترین و کمترین تاریخ سفارش
*/
select EmployeeID,count(OrderID) as count_of_orders ,max(OrderDate) as max_date,min(OrderDate) as min_date
from Orders
group by EmployeeID

--اینو سر کلاس نتونستم بفرستم چون وسط تایپم شارژلپتاپ تموم شد برقا هم رفته بود



