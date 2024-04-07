-- use of group by clause.
-- group by is used to make Rows into summary rows
select Department from Employee group by Department -- normal group by
-- Now we find out how many employees works under one department
select Department,COUNT(FirstName) as No_of_Employees from Employee group by Department;
select Department,Max(Salary) as Maximum_salary from Employee group by Department;
select Department,AVG(Salary) as Average_salary from Employee group by Department order by Average_salary desc;