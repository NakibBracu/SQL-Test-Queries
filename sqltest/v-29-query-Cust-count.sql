select * from Item

-- query 1
select cust_id,product_id,CONVERT(Date,Purchase_date) as date 
from Item

--query 2, Date Distinct Count we needed
select cust_id,product_id,
Count(Distinct(convert(date,purchase_date))) as date_distinct_count
from item group by cust_id,product_id

-- we need to find out the customer count who buy same thing in two
-- different days
select cust_id,product_id,
Count(Distinct(convert(date,purchase_date))) as date_distinct_count
from item group by cust_id,product_id having 
Count(Distinct(convert(date,purchase_date))) > 1
-- query 3 , the count
select count(cust_id) Total_Customer_count from 
(
select cust_id,product_id,
Count(Distinct(convert(date,purchase_date))) as date_distinct_count
from item group by cust_id,product_id having 
Count(Distinct(convert(date,purchase_date))) > 1
) temp