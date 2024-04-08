-- Write a query that can show the odd or even status 
-- for the first digit of Salary base
select FirstName,Salary,LEFT(Salary,1) as LeftMostDigitOfSalary, 
case
  when left(Salary,1)%2 = 0  then 'Even'
  else 'Odd'
end as Odd_Even_Status
from Employee
-- Now we use CTE to solve the expression
With Left_Most_Digit
as
(
Select WorkerID,FirstName,Salary,Left(Salary,1) as First_Digit from Employee
)
select *,
case 
 when First_Digit % 2 = 0 then 'Even'
 else 'odd'
end as Odd_Even_Status
from Left_Most_Digit
-- CTE notes
--CTE stands for Common Table Expression.
--It's a temporary named result set that you can reference 
--within the scope of a single SELECT, INSERT, UPDATE, or DELETE statement,
--just like a regular table or view.
--CTEs are defined using the WITH clause and can help improve the readability 
--and maintainability of complex SQL queries by breaking them down into smaller, 
--more manageable parts. They are particularly useful for recursive queries, 
--complex joins, or when you need to reference the same subquery multiple times 
--within a single query.