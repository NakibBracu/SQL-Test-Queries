with cte as
(select Year,Player_Name,Runs,(Runs/Innings) as average,
LAG((Runs/Innings),1,0) over(partition by Player_Name
order by Player_Name,Year) as Previous_Year_Runs,
case  when (Runs/Innings) > LAG((Runs/Innings),1,0) 
over(partition by Player_Name
order by Player_Name,Year) then 1 else 0 end as Status
from Cricket)

select Player_Name from cte where status = 1 group by Player_Name
having count(Status) = 4