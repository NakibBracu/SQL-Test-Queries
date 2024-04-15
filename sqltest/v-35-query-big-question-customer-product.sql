/*
Write a query to show the Total Earning Points of each customer for 
only january month who enrolled in a Gold Program but make sure you 
will follow the below criteria in your query "-
1) Before join as program, each customer earns 10 Points on the 
spend of Rs.1 but if the Product is "SUSHI" then give him 20 Points 
on the spend of Rs.1.
2) In the first week after a customer joins the program (including their 
join date) they earn 20 points on all items, not just for "SUSHI"? 
(It includes all)
3) After complete a week as a Member of program, each customer earns 
again 10 Points on the spend of Rs.1 & if the Product is "SUSHI" then 
give him 20 Points on the spend of Rs.1. */
/*
We have 3 Tables here : 1) Sales - Having sales data 2) Menu - Product 
& Price data 3) Members: data of Join date of program
*/
select * from sales
select * from menu
select * from members

select customer_id,sum(earning_points) as total_earning_points from 
(select s.Customer_ID,m.Product_Name,m.Price,mem.joining_date,s.Order_Date,
DATEADD(DAY,6,mem.joining_date) as after_join_week_date,
EOMONTH('2021-01-01') as last_date,
case 
-- before join calculation
when Order_Date >= '2021-01-01' and Order_date < joining_date and
Product_Name = 'sushi' then price*20 
when Order_Date >= '2021-01-01' and Order_date < joining_date then price*10 
--after join calculation till weekend
when Order_Date >= joining_date and Order_Date < DATEADD(DAY,6,mem.joining_date)
then Price*20
--after join till end of month
when Order_Date > DATEADD(DAY,6,mem.joining_date) and
Order_Date <= EOMONTH('2021-01-01') and Product_Name = 'sushi' then 
Price*20
when Order_Date > DATEADD(DAY,6,mem.joining_date) and
Order_Date <= EOMONTH('2021-01-01')  then 
Price*10
end as Earning_points
from sales s inner join menu m on s.Product_ID = m.Product_Id
inner join Members mem on s.Customer_ID  = mem.Customer_ID) temp
group by Customer_ID