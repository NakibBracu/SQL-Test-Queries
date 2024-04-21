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
-- Find The employees where departmentId is 1 and they should be in descending order
select * from Employee Where DepartmentId  = 1 order by Salary desc
-- Find The employees where departmentId is 1 and they should be in descending order
-- But firstly They want to show Female salary, Then Male Salary
select * from Employee Where DepartmentId  = 1 order by Gender,Salary desc
-- Write the EmployeeName with First two characters
select EmployeeName, Substring(EmployeeName,1,2) as First_two_characters 
from Employee
-- Now sort the EmployeeName with Last Two characters in ascending order
-- as we have to include the 2nd last character so we subtract 1
select EmployeeName, Substring(EmployeeName,len(EmployeeName)-1,2) as 
last_two_characters from Employee order by EmployeeName asc
-- Find the ObjectId of Employee Table
Select OBJECT_ID('Employee') As EmployeeTableIDInEMSDatabase
-- Now create a temporary table Name EmployeeTemp 
if OBJECT_ID('tempdb..#EmployeeTemp') is not null drop table #EmployeeTemp
create table #EmployeeTemp(
Name nvarchar(50)
)
-- Now insert 4 entry in the #EmployeeTemp table with select and union
-- But Let's say insert the rows with their salary in the same column
insert into #EmployeeTemp(Name)
select 'Abrar10000'
union
select 'Sachin25000'
union 
select 'Rayda4500'
union
select 'Nabil3300'
-- Extract Only Numbers from Nabil12345
SELECT Replace(TRANSLATE('Nabil12345', 'abcdefghijklmnopqrstwxyz', 
REPLICATE('#', len('abcdefghijklmnopqrstwxyz'))),'#','') as Onlysalary
-- Now use CTE for that
WITH TranslatedString AS (
    SELECT TRANSLATE('Nabil12345', 'abcdefghijklmnopqrstwxyz', 
	REPLICATE('#', LEN('abcdefghijklmnopqrstwxyz'))) AS TranslatedValue
)
SELECT REPLACE(TranslatedValue, '#', '') AS OnlySalary
FROM TranslatedString;
-- select all rows
select * from #EmployeeTemp
--Abrar10000
--Nabil3300
--Rayda4500
--Sachin25000
-- Now Let's consider this as wrong entry and want to sort them as their salary 
-- in descending order
-- if we don't cast the Extracted salary then SQL Server consider the
-- field as nvarchar. So make sure to cast
select *, cast(Replace(TRANSLATE(Name, 'abcdefghijklmnopqrstwxyz', 
REPLICATE('#', len('abcdefghijklmnopqrstwxyz'))),'#','') as int) as Onlysalary
from #EmployeeTemp order by Onlysalary desc