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

--Now see some inserts
insert into employee2(Name,Salary,Gender,DepartmentId)
values('Azad',12000,'male',4) -- insert way 1
  

insert into employee2 (Name,Salary,Gender,DepartmentId) --insert way 2 using union
select 'Mohini',15000,'Female',4
union
select 'Maryam',45000,'Female',3
union
select 'Kabila',17000,'Male',2

-- Now copy a table data to another table using the command
-- Let's say copy 'employee2' table data to a temporary table 'Employee1'
-- Create the Temporary table First
-- Temporary table will be deleted automatically after the query windows closed
create table #Employee1(
EmployeeId int primary key identity,
Name varchar(20) null, 
Salary int null, 
Gender varchar(20) null,
DeptID int null
)

select * from #Employee1
-- Now we can insert all data of employee2 to #Employee1
insert into #Employee1(Name,Salary,Gender,DeptID) --insert way 3
select Name,Salary,Gender,DepartmentId from employee2

--Now create a table copying schema and also data from a table
-- Create a table Name 'EmployeeHistory' copying the schema and data from employee2
select * into EmployeeHistory  -- this command create a new table and also copy all the datas
from employee2

--But what if we want to just create the table not the data to be copied
select * into EmployeeHistory1 from employee2 where 1 = 2 -- Here where condition 
-- should be falsed to avoid data copying