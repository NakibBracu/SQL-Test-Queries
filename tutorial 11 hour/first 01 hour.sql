-- Database creation Query
create database EMS

-- Use Database Query
Use EMS

-- table creation query
create table Employee
(
EmployeeId int identity primary key,
EmployeeName varchar(250) null,
Salary int null,
Gender varchar(10) null,
Comission int null
)

-- Table delete Query
--    Drop Table Employee
-- Table Data Delete Query
-- 'Truncate table Employee'
-- Database Delete Query
-- 'Drop database EMS'
-- Table modify Query
-- You cannot directly alter an existing column to add the 
-- IDENTITY property.
-- Alter Table Employee
-- Alter column EmployeeId int identity primary key  




-- Inserting values
insert into Employee(EmployeeName,Salary,Gender,Comission)
values ('Nakib',50000,'male',null),
        ('Rakib',10000,'male',1000),
		('Akina',50000,'Female',500),
		('Sakrina',65000,'Female',null)
		;

-- Update Table Values
   Update Employee
   set EmployeeName = 'Rumana' ,Salary = 45000,Gender = 'Female'
   where EmployeeId = 2

-- Use in operator with where clause
   Update Employee
   set Comission = 450
   where EmployeeId in (1,2)

-- Adding a new column in Employee Table (Existing)
   Alter Table Employee
   Add DepartmentId int null

-- Now adding Department Id to the Employee
  Update Employee
  set DepartmentId = 3
  where EmployeeId = 4

-- insert new data as new column added
   INSERT INTO Employee (EmployeeName, Salary, Gender, Comission, Departmentid)
VALUES 
    ('John', 60000, 'male', 2000, 2),
    ('Emily', 55000, 'female', 1500, 1),
    ('Michael', 70000, 'male', 3000, 3),
    ('Sophia', 48000, 'female', 1200, 2),
    ('William', 62000, 'male', 2500, 4),
    ('Olivia', 51000, 'female', 1800, 5),
    ('James', 58000, 'male', 2200, 1),
    ('Ava', 53000, 'female', 1600, 3),
    ('Benjamin', 64000, 'male', 2700, 4),
    ('Emma', 49000, 'female', 1400, 2);

-- Select All columns
select * from Employee

-- select rows where departmentId - 1, female
select * from Employee where departmentid = 1 and gender = 'female'

-- return the Employees Where Employee Salary is greater than 40000 and less
-- than 50000
select * from Employee
where Salary > 40000 and Salary < 50000

-- Find the employee Name , EmployeeId, Comission
-- But whose comission is greater than 1000 and less than 2000
select EmployeeId,EmployeeName,Comission from Employee
where Comission > 1000 and Comission < 2000

-- Now adding a new Column in Employee Table
alter Table Employee
add MaritalStatus varchar(15)

-- Now set marital Status
update Employee
set maritalStatus = 'Married'
where EmployeeId not in (1,2,3,4,5)

-- Now show employee Full Name as mr or mrs. or ms.
select 
EmployeeId,
case when Gender = 'female' and MaritalStatus = 'married' then
'Mrs. '+EmployeeName
when Gender = 'female' and MaritalStatus = 'single' then
'Ms. '+EmployeeName
when Gender = 'male' then 'Mr. ' + EmployeeName end as EmployeeName,
MaritalStatus,
Gender
from Employee