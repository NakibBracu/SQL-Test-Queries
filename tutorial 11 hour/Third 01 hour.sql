use EMS;

-- show the employee info in descending order by salary and comission
select employeeId,EmployeeName,Salary,coalesce(Comission,null,0) as comission,gender from Employee
order by Salary desc , coalesce(Comission,null,0) desc

-- now for department id 3, show employeeinfo + salary by descending but not for
-- the other record
select employeeId,EmployeeName,departmentid,Salary,isnull(comission,0) as comission,gender
from Employee 
order by 
case when DepartmentId = 3 then Salary else isnull(comission,0) end desc

-- create similar type of table to perform joins
create table employee2(
EmployeeId int primary key identity,
Name varchar(200) null,
Salary int null,
Gender varchar(20)
)

create table employee3(
EmployeeId int primary key identity,
Name varchar(200) null,
Salary int null,
Gender varchar(20)
)

-- seperate table value
select 'Nakib' Name

select 'Rakib' Name

-- same table value
select 'Nakib' Name
union
select 'Rakib' Name

insert into employee2(Name,Salary,Gender)
select 'Nakib',100000,'Male'
union
select 'Rakib',200000,'Male'
union
select 'Sayed',150000,'Male'
union
select 'Sarmila',175000,'Female'
union
select 'Sazzu',70000,'Female'

select * from employee2

insert into employee3(Name,Salary,Gender)
select 'Nakib1',100000,'Male'
union
select 'Rakib1',200000,'Male'
union
select 'Sayed1',150000,'Male'
union
select 'Sarmila1',175000,'Female'
union
select 'Sazzu1',70000,'Female'


select * from employee2
union
select * from employee3

-- Create Table EmployeeBonus
create table Employeebonus(
Bonusid int primary key identity,
Bonusamount int ,
Employeeid int
)

select * from employeebonus

insert into Employeebonus(Bonusamount,Employeeid)
select 1000,1
union
select 2000,2
union
select 3000,3
union
select 4000,4
union
select 5000,5

select e.Name,e.Salary,eb.Bonusamount from employee2 e inner join
Employeebonus eb on e.EmployeeId = eb.Employeeid

select * from employee2
--now insert a new employee
insert into employee2 (Name,Salary,Gender)
values ('Suhana',50000,'Male')
--Here we can see only the records that matches but what if I we want to see all the
-- employee though it matches or not
select e.Name,e.Salary,eb.Bonusamount from employee2 e left join
Employeebonus eb on e.EmployeeId = eb.Employeeid
--now insert a new employee
insert into employee2 (Name,Salary,Gender)
values (null,null,null)
--Insert bonus table with a non existing Employeeid
insert into Employeebonus
values (7000,8)
-- Now we have to use right join to get all the records of right table
select e.Name,e.Salary,eb.Bonusamount from employee2 e right join
Employeebonus eb on e.EmployeeId = eb.Employeeid

-- What if we want all the records of all table? Full join
select e.Name,e.Salary,eb.Bonusamount from employee2 e full outer join
Employeebonus eb on e.EmployeeId = eb.Employeeid

-- Now don't show null. It is a bad practise
select isnull(e.Name,'N/A') as Name,
isnull(e.Salary,0) as Salary,
isnull(eb.Bonusamount,0) as Bonus from employee2 e full outer join
Employeebonus eb on e.EmployeeId = eb.Employeeid