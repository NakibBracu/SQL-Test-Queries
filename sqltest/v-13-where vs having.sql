use school;
select * from Employee

-- Having vs where
-- Below line will give us error
-- Select FirstName,sum(Salary) from Employee where Department in ('HR','Admin'); 
-- Msg 8120, Level 16, State 1, Line 5
-- Column 'Employee.FirstName' is invalid in the select list because it is not contained in either

-- query 1
Select Department,sum(Salary) from Employee where Department in ('HR','Admin') group by Department; 
-- Here whatever we selected make sure it is contained in aggregate function or group by clause.
-- query 2 , rewrite the query 1 with group by clause
Select Department,sum(Salary) from Employee group by Department
Having Department in ('HR','Admin');
; 
-- we will get the same output

-- query 3, this will run into error
Select Department,sum(Salary) from Employee where sum(Salary) < 1350000  group by Department; 
-- Msg 147, Level 15, State 1, Line 19
--An aggregate may not appear in the WHERE clause unless 
--it is in a subquery contained in a HAVING clause or a select list,
--and the column being aggregated is an outer reference.
-- solution to this is  using the 'sum(Salary) < 1350000' in having clause or subquery
-- query 3 , solve 1 -- using having clause
SELECT Department, SUM(Salary)
FROM Employee
GROUP BY Department
HAVING SUM(Salary) < 1350000;
-- query 3 , solve 2 -- using sub query
Select Department, TotalSalary
from (
select Department, Sum(Salary) as TotalSalary
from Employee group by Department --Here we calculate Total_Salary for each department
) as DepartmentSalaries
where TotalSalary < 1350000;
-- query 4
select PlayerName,Sum(run) as TotalScores from CricketScores 
group by PlayerName having sum(run) < 235; 
-- query 5, rewritten of query 4
select PlayerName, TotalScores
from (
select PlayerName,sum(run) as TotalScores 
from CricketScores group by PlayerName
) as Individual_player_Total_Run
where TotalScores < 235