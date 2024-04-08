use school;
-- here we will learn, Rank , Dense Rank and Row Number
select FirstName,Department,Salary,Rank() over (Order by Salary) 
as Rank from Employee -- Rank Will work like it will skip the same amount n times as
-- it finds
select FirstName,Department,Salary,Dense_Rank() over (Order by Salary)
as Dense_Rank from Employee
-- Dense Rank will not skip any number just put same number in same amount and
-- go next
select FirstName,Department,Salary,Row_Number() over (Order by Salary)
as Row_Number from Employee
-- Row_Number will not skip any number. It just serialize the row by condition
-- Now write query to find out these three function behavoiur for each department
select FirstName,Department,Salary,
Rank() over (Partition by Department Order by Salary) as Rank from Employee
-- Now for Dense Rank
select FirstName,Department,Salary,
DENSE_RANK() over(partition by Department order by Salary) as Dense_Rank from Employee
-- Now for Row_Number
select FirstName,Department,Salary,
ROW_NUMBER() over(partition by Department order by Salary) as Row_Number
from Employee