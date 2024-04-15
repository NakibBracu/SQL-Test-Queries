create table sales(
Customer_ID nvarchar(max),
Order_Date Date,
Product_ID int
)
select * from sales
INSERT INTO sales (Customer_ID, Order_Date, Product_ID) VALUES
('A', '2021-01-01', 1),
('A', '2021-01-01', 2),
('A', '2021-01-07', 2),
('Α', '2021-01-10', 3),
('A', '2021-01-11', 3),
('A', '2021-01-11', 3),
('B', '2021-01-01', 2),
('B', '2021-01-02', 2);

create table menu(
Product_Id int,
Product_Name nvarchar(max),
Price int
)

-- Insert data into the table
INSERT INTO menu (Product_Id, Product_Name, Price) VALUES
(1, 'Sushi', 100),
(2, 'Pizza', 150),
(3, 'Salad', 80),
(4, 'Sandwich', 90),
(5, 'Pasta', 120),
(6, 'French Fries', 60),
(7, 'Chicken Wings', 180),
(8, 'Biriyani', 200),
(9, 'Taco', 110),
(10, 'Burrito', 130);

select * from menu

create table Members(
Customer_ID nvarchar(max),
joining_date date
)

insert into Members values('A','2021-01-07'),('B','2021-01-09')
select * from Members