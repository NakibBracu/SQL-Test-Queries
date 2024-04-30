--Fifth One Hour Tutorial
select * from employee2
-- Now we will learn RowNumber, Rank, Dense_Rank
select *,ROW_NUMBER() over(order by departmentId) as RN
from employee2 --Just Like Identity
select *,Rank() over(order by departmentId) as RN 
from employee2 -- for Same number of value that is used in order by will be given
-- same number then next consecutive row will be considered the cumalitive sum +1
-- lets say we have same department Id 1 thrice So first three rows will be given 1
-- then next row will be given number 4
select *,DENSE_RANK() over(order by departmentId) as RN 
from employee2 -- For same department Id it will be given same number

--Now Find the 2nd highest salary of DEV department
select * from (select e.EmployeeId,d.ID,e.Salary,d.Name,DENSE_RANK() 
over (partition by d.ID order by e.salary desc) as RN
from employee2 e inner join Department d on e.DepartmentId = d.ID) t
where RN = 2 and t.Name = 'DEV'
