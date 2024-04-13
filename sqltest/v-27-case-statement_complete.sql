-- Here we found the device_Type by numbering with case statement
select Device_Type,
case when Device_Type = 'Mobile' then 1 Else 0 End as Mobile,
case when Device_Type = 'Tablet' then 1 Else 0 End as Tablet,
case when Device_Type = 'Laptop' then 1 Else 0 End as Laptop
from Device

-- Now we can calculate by aggregate function sum
select sum(
case when Device_Type = 'Mobile' then 1 Else 0 End)as Mobile,
sum(
case when Device_Type = 'Tablet' then 1 Else 0 End)as Tablet,
sum(
case when Device_Type = 'Laptop' then 1 Else 0 End)as Laptop
from Device

-- now combine Mobile and Laptop in one category
select sum(case when Device_Type in ('Mobile','Laptop') then 1 
else 0 End) as Mobile_Laptop,
sum(case when device_type = 'Tablet' then 1 else 0 end) as Tablet
from device