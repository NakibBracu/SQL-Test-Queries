--query 1
select Department,Sum(Salary) from Employee 
where Department in ('Accounting','IT','Admin')
group by Department having sum(Salary)>1000000;

--query 2, using sub-query
select Department, TotalSalary
from (
select Department, Sum(salary) as TotalSalary
from Employee where Department in ('Accounting','IT','Admin')
group by Department
) as DepartmentEmployeeSalary
where TotalSalary >1000000;