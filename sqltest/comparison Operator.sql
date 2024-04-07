use school;
-- comparison operator
select * from Employee;
select * from Employee where FirstName in ('John','Jane','Amanda') -- in operator
select * from Employee where Department = 'HR' and WorkerID > 2 -- and operator
select * from Employee where Salary between 90000 and 100000 -- between operator
select * from Employee where Department = 'HR' or Department = 'Admin' -- or operator
select * from Employee where not WorkerID = 4 -- not operator
--like operator
select * from Employee where LastName like '%a' -- ends with a
select * from Employee where FirstName like 'W%m' -- starts with W and ends with m
select * from Employee where LastName like '___' -- only 3 characters long
select * from Employee where FirstName like 'D%d'-- starts with 'D' and ends with d
select * from Employee where FirstName like '____n' -- length 5 and ends with n
