select * from data

-- Here we first order by date the whole data
-- assign group_id for the data.
-- after executing the query we can easily see that
-- Till null and non-null values there will be a group created
-- after the cte we use first_value function to extract
-- first value from each group and Replace the null with that value
-- in the respective group
with cte as(
select *,count(Name) over(order by date) as group_id from data)
 
 select *, FIRST_VALUE(Name) over(partition by group_id
 order by Date
 ) as New_Name from cte