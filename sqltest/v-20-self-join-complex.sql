-- Write a query by which we can find the Employee
-- aws question
-- write a query to find out the EmployeeName and Their manager Name
-- where Employee get more salary than their manager
-- Here we perform self join here.
select E.EmpId,E.Name,M.Name ManagerName,E.Salary Emp_Salary,
M.Salary Manager_Salary,
E.Salary - M.Salary as SalaryDifference
from EmployeeInfo E 
inner join EmployeeInfo M
--on M.ManagerId = E.EmpId -- this is wrong
on E.ManagerId = M.EmpId
where E.Salary > M.Salary