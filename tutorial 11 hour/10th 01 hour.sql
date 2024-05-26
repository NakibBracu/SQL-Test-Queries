--Now we started learning about pivoting
-- Pioting in easy words we will convert any column values to a seperate column
create table product
(
productID int primary key identity,
ProductName varchar(150),
Price int
)

create table customer
(
CustomerID int primary key identity,
CustomerName varchar(150)
)

create table TableOrder
(
OrderID int primary key identity,
CustomerID int,
ProductID int,
QTY int
)

-- Insert data into the product table
INSERT INTO product (ProductName, Price)
VALUES 
    ('MI', 500),
    ('APPLE', 1000),
    ('Samsung', 700);

	INSERT INTO customer (CustomerName)
VALUES 
    ('John Smith'),
    ('Emily Johnson'),
    ('Michael Williams'),
    ('Emma Brown'),
    ('Daniel Jones'),
    ('Olivia Taylor'),
    ('William Miller'),
    ('Sophia Wilson'),
    ('Alexander Moore'),
    ('Ava Anderson');

	INSERT INTO TableOrder (CustomerID, ProductID, QTY)
VALUES
    (1, 1, 3),  -- Customer 1 buys 3 MI
    (2, 2, 2),  -- Customer 2 buys 2 APPLE
    (3, 3, 1),  -- Customer 3 buys 1 Samsung
    (4, 1, 2),  -- Customer 4 buys 2 MI
    (5, 2, 1),  -- Customer 5 buys 1 APPLE
    (6, 3, 3),  -- Customer 6 buys 3 Samsung
    (7, 1, 1),  -- Customer 7 buys 1 MI
    (8, 2, 2),  -- Customer 8 buys 2 APPLE
    (9, 3, 1),  -- Customer 9 buys 1 Samsung
    (10, 1, 2); -- Customer 10 buys 2 MI


	select * from product
	select * from customer
	select * from TableOrder


	--Now let's see who order how much using join
	--basic join
	select 
	c.CustomerName,
	p.ProductName,
	p.Price,
	o.QTY,
	p.Price * o.QTY as TotalPrice
	from TableOrder o
	inner join customer c
	on o.CustomerID = c.CustomerID
	inner join product p
	on p.productID = o.ProductID
	order by TotalPrice

    --Now let's find out the TotaPrice by productName
	select 
	max(case when Productname = 'APPLE' then GrandTotal else '' end ) as APPLE ,
	max(case when Productname = 'MI' then GrandTotal else '' end) as MI,
	max(case when Productname = 'Samsung' then GrandTotal else '' end) as Samsung
	from
	(select 
	Productname,
	SUM(TotalPrice) as GrandTotal
	from
	(select 
	c.CustomerName,
	p.ProductName,
	p.Price,
	o.QTY,
	p.Price * o.QTY as TotalPrice
	from TableOrder o
	inner join customer c
	on o.CustomerID = c.CustomerID
	inner join product p
	on p.productID = o.ProductID
	) t
	group by ProductName
	) tt

	--Now implement the same thing with the help of pivot
	select * from
	(select
	p.ProductName,
	(p.Price*tb.QTY) as totalPrice
	from product p
	inner join TableOrder tb
	on p.productID = tb.ProductID) t --here this t table will be used to make pivot
	pivot(
	sum(totalPrice)
	for ProductName in([MI],[APPLE],[Samsung])
	)pv