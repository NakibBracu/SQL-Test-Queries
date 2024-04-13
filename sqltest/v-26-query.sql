use school

-- we need to show the running total here
-- firstly here for withdrawal if we put a minus sign before amount, then it 
-- would be easier for calculation
with CTE as (
select transaction_date,sum(case when Type = 'Withdrawal' then Amount*-1
else Amount end) as Total_Amount
from Transactions group by Transaction_date)

SELECT
    *,
    SUM(Total_Amount) OVER (
        PARTITION BY MONTH(Transaction_date), YEAR(Transaction_date)
        ORDER BY Transaction_date
    ) AS Running_total
FROM
    CTE order by Transaction_date;