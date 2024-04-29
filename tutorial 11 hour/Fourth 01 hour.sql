-- Find out the employees who doesnot get any bonus
-- Here we use left join
select e.EmployeeId,
isnull(e.Name,'N/A') as Name,
isnull(e.Salary,0) as Salary,
isnull(eb.Bonusamount,0) as BonusAmount from employee2 e left join 
Employeebonus eb on e.EmployeeId = eb.Employeeid
where Bonusamount is null
-- Now we have to find out without performing join the employee who doesnot 
-- got a bonus
select * from employee2 where EmployeeId not in(
select EmployeeId from Employeebonus
)

-- Now we have to find out whether two tables are exactly same or not
select * from employee2
truncate table employee3
select * from employee3
--copy all the tables data to another table . Employee2 --> employee3
insert  into employee3 (Name,Salary,Gender)
select Name,Salary,Gender from employee2
-- Now check if both of the tables are exactly same or not
-- we can easily check it by 
-- we know that union always combine the common datas from each table
-- Think logically here
-- This is an example of Inline View or Table
select COUNT(EmployeeId) as TotalRows from (select * from employee2 where EmployeeId not in (
select EmployeeId from employee3
)
union
select * from employee3 where EmployeeId not in (
select EmployeeId from employee2
)) t

--Now find the employees whose bonus is greater than the particular Employee 'Nakib'
select e.EmployeeId,e.Name,eb.Bonusamount from employee2 e inner join 
Employeebonus eb
on e.EmployeeId = eb.Employeeid
where eb.Bonusamount > (
select eb.Bonusamount from employee2 e inner join
Employeebonus eb
on e.EmployeeId = eb.Employeeid
where Name = 'Nakib'
)
-- Now find out the employees where their bonus is less than sazzu
select e.EmployeeId,e.Name,eb.Bonusamount from employee2 e inner join 
Employeebonus eb
on e.EmployeeId = eb.Employeeid
where eb.Bonusamount < (
select eb.Bonusamount from employee2 e inner join Employeebonus eb on
e.EmployeeId = eb.Employeeid 
where Name = 'sazzu'
)

--Now find out the total salary of all department
select sum(salary) from employee2
-- Find out how many records are available in a table
select count(*) as TotalRecords from employee2
select count(1) as TotalRecords from employee2
-- Find out the average salary of the company
select avg(salary) from employee2
-- Now add department to employee2
select * from employee2
--adding a new column in employee2
alter table employee2
add DepartmentId int null
-- update multiple row
update employee2
set departmentid = 2
where EmployeeId in (3,4)
-- update single row
update employee2
set departmentid = 3
where EmployeeId = 5
-- Create table Department and add info there
create table Department
(
ID int primary key identity,
Name varchar(200)
)

-- Now insert values in department
insert into Department
select 'HR'
union
select 'DEV'
union
select 'QA'
union
select 'BA'

select * from Department

--Now find out the total employees
select * from employee2 e inner join
Department d on e.DepartmentId = d.ID 
-- As some of the employees don't hold any department
-- we have to use right join
select d.ID,d.Name,count(e.departmentid) as TotalEmployees from employee2 e
right join Department d
on e.DepartmentId = d.ID
group by d.Name,e.departmentid,d.ID 
--Now find out the department which has more than one employee
select d.ID,d.Name,count(e.departmentid) as TotalEmployees from employee2 e
right join Department d on e.departmentid = d.ID
group by d.Name,d.ID
having count(e.departmentid) > 1 