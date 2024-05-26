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

	--delete from TableOrder
	-- Insert data into the TableOrder table ensuring each customer buys at most 2 different products with different quantities
INSERT INTO TableOrder (CustomerID, ProductID, QTY)
VALUES
    (1, 1, 3),  -- John Smith buys 3 MI
    (1, 2, 1),  -- John Smith buys 1 APPLE

    (2, 1, 2),  -- Emily Johnson buys 2 MI
    (2, 3, 3),  -- Emily Johnson buys 3 Samsung

    (3, 2, 2),  -- Michael Williams buys 2 APPLE
    (3, 3, 1),  -- Michael Williams buys 1 Samsung

    (4, 1, 1),  -- Emma Brown buys 1 MI
    (4, 3, 2),  -- Emma Brown buys 2 Samsung

    (5, 1, 3),  -- Daniel Jones buys 3 MI
    (5, 2, 2),  -- Daniel Jones buys 2 APPLE

    (6, 2, 1),  -- Olivia Taylor buys 1 APPLE
    (6, 3, 3),  -- Olivia Taylor buys 3 Samsung

    (7, 1, 2),  -- William Miller buys 2 MI
    (7, 3, 1),  -- William Miller buys 1 Samsung

    (8, 1, 1),  -- Sophia Wilson buys 1 MI
    (8, 2, 3),  -- Sophia Wilson buys 3 APPLE

    (9, 2, 2),  -- Alexander Moore buys 2 APPLE
    (9, 3, 1),  -- Alexander Moore buys 1 Samsung

    (10, 1, 3), -- Ava Anderson buys 3 MI
    (10, 3, 2); -- Ava Anderson buys 2 Samsung

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


	--pivoting plug and play
	--see whatever we put other than totalprice
	-- it will make container along that
	--carefully observe the data
	--groups are made
	-- Alexandar apple, Alexadar Samsung two group
	-- AVa MI, AVA Samsung group
	-- so wisely use this
	select * from
	(select
	p.ProductName,
	(p.Price*tb.QTY) as totalPrice,
	CustomerName
	from product p
	inner join TableOrder tb
	on p.productID = tb.ProductID
	inner join customer c
	on c.CustomerID = tb.CustomerID
	)t
	pivot(
	sum(totalPrice)
	for ProductName in([MI],[APPLE],[Samsung])
	)pv