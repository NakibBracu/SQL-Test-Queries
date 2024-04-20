-- Database creation Query
create database EMS

-- Use Database Query
Use EMS

-- table creation query
create table Employee
(
EmployeeId int identity primary key,
EmployeeName varchar(250),
Salary int,
Gender varchar(10),
Comission int
)

-- Table delete Query
-- Drop Table Employee
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
values ('Nakib',50000,'male',null)

-- Select All columns
select * from Employee