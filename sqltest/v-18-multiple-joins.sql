use school;
select * from Orders
-- query to find only the customer FirstName, E-mail , OrderDate and Amount
-- for the last 200 days who buys more that 150 taka 
select c.FirstName,c.Email, FORMAT(o.OrderDate, 'dd MMMM, yyyy') 
AS OrderDate,o.TotalAmount as Totalbuy from 
Customers c inner join Orders o on c.CustomerID = o.CustomerID
inner join Categories ct on o.CategoryID = ct.CategoryID
where (o.OrderDate < (select GETDATE()-200) and o.TotalAmount > 150)