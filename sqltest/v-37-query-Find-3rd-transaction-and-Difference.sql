select * from User_Third_Transaction
-- write a query to find the expense for every 3rd transaction and
-- also the difference
-- The below query has a problem. That's why we need to use Datepart Function
select *,ROW_NUMBER() over(partition by 
Transaction_Date order by 
Transaction_Date) as Ranking from User_Third_Transaction
-- Query with DatePart
with cte as
(select User_ID,Spend,DatePart(Year,Transaction_date) as Transaction_Year,
ROW_NUMBER() over(partition by DatePart(Year,Transaction_date) 
order by
Transaction_date) as Ranking from User_Third_Transaction)

select User_ID,Spend,LAG(Spend,1,Spend) over(order by Transaction_Year ) 
as Previous_Expense,ABS(Spend-
(LAG(Spend,1,Spend) over(order by Transaction_Year ))),
Transaction_Year from cte where Ranking = 3