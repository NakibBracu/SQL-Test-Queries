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
