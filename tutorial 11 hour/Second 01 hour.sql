-- Select Top 5 records
select top 5 * from Employee
-- Select Top 5 records randomly
select top 5 * from Employee order by newid()
-- filter data using null
select * from Employee where Comission is null
-- filter data using is not null
select * from Employee where Comission is not null
-- In operator to set = null
update Employee
set Comission = null
where employeeId in(5,6)
--  Now we should use coalesce operator to replace any value of column with anything
-- we want
select EmployeeId,EmployeeName,Comission,coalesce(Comission,0) as Comission
from Employee
-- we can also use isnull in a way to do the same operation like coalesce
select EmployeeId,EmployeeName,Comission,isnull(Comission,0) as Comission
from Employee
-- Find the Employees whose name start with S
select * from Employee where EmployeeName like 's%'
-- Find the Employees whose name end with S
select * from Employee where EmployeeName like '%s'
-- Find the Employees whose name contains only 5 characters
select * from Employee where EmployeeName like '_____'
-- Find the Employees whose name contains only 5 characters but start with a
select * from Employee where EmployeeName like 'a____'
-- Find the Employees whose name contains only 5 characters but end with a
select * from Employee where EmployeeName like '____a'
-- Find the Employees whose name contains character i but before that anything can
-- be here after that anything can be there
select * from Employee where EmployeeName like '%i%'
-- Find the Employees whose name contains character 'c' and 'h' together
select * from Employee where EmployeeName like '%ch%'