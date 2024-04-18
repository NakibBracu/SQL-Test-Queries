-- write a query to get player name, Player average run, speciality who
-- has average run less than 50
with cte as(
select PlayerName,Sum(run) as Total_Run,
Count(PlayerName) as Total_Played_Matches,
(Sum(run) / Count(PlayerName)) as Average_Run
from score
group by PlayerName
having (Sum(run) / Count(PlayerName)) < 50
) 

select s.Player_Name,s.Speciality,c.Average_Run from cte c join 
Speciality s on 
s.Player_Name = c.PlayerName
order by c.Average_Run desc

