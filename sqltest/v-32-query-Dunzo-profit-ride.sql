select * from dunzo
--Ques: Write a query to show Unique_ID,
--Count total no of Rides for each ID and Profit_Ride. 
--**Profit_RIDE (Where End_Location of the current ride is 
--the same as Start_Location of next ride.)
select *,LEAD(Start_Location,1) over(partition by Id
order by start_location
) as next_start_LOC from dunzo
-- This above query will extract the next_starting_location
with cte as(
select *,LEAD(Start_location,1) over(partition by Id
order by start_location
) as next_start_LOC from dunzo
)

select Id,count(id) as total_ride,sum(
case when end_location = next_start_LOC then 1
else 0 end) as profit_ride
 from cte
group by id