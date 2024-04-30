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

select * from EmployeeHistory1

--Now we like to add  column with default value
alter table EmployeeHistory1
add Lastname varchar(20) default('NA')

insert into EmployeeHistory1 (Name,Salary,Gender,DepartmentId)
values ('Paresh',100000,'Male',3) --As we don't insert any values for LastName it will
-- set to default 

-- Now we have to add dynamically calculated value
alter table EmployeeHistory1 
add EmployeeCode as 'NPS'+cast(employeeid as nvarchar(20))+'_DPG'

alter table EmployeeHistory1 -- dropping a column if something wrong
drop column EmployeeCode 

insert into EmployeeHistory1 (Name,Salary,Gender,DepartmentId)
values ('Zayed',50000,'Male',2)


-- Advance Update. Update the employees salary with their bonuses added to them
select e.EmployeeId,e.Name,e.Salary,eb.Bonusamount,(e.Salary+eb.Bonusamount) as New_salary
from employee2 e inner join 
Employeebonus eb on e.EmployeeId = eb.Employeeid

-- Here we are updating the salary performing inner join
update e
set e.Salary = e.Salary + eb.Bonusamount
from employee2 e
inner join Employeebonus eb
on e.EmployeeId = eb.Employeeid

select * from employee2

select * from employee3

alter table employee3
add DepartmentId int null


-- Now Make employee2 and employee3 records same doing merge
-- In real Life scenario lets say we have same columns table operations might need to get
-- updated from one table to another
select * from employee2

merge employee3 as Target
using employee2 as Source
on Target.EmployeeID = Source.EmployeeID
when matched then update set 
Target.Name = Source.Name,
Target.Salary = Source.Salary,
Target.Gender = Source.Gender,
Target.DepartmentId = Source.DepartmentId
when not matched then insert (Name,Salary,Gender,DepartmentId)
values(Source.Name,Source.Salary,Source.Gender,Source.DepartmentId)
when not matched by Source then delete;

select * from employee2
select * from employee3