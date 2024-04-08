-- Write a query that can show the odd or even status 
-- for the first digit of Salary base
select FirstName,Salary,LEFT(Salary,1) as LeftMostDigitOfSalary, 
case
  when left(Salary,1)%2 = 0  then 'Even'
  else 'Odd'
end as Odd_Even_Status
from Employee