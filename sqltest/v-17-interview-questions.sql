use school;
select * from Employee;
-- q1 show firstname as All Caps and Show LastName as All smalls also use alias
select Upper(FirstName) as Fname,Lower(LastName) as Lname from Employee;
-- q2 show worker Id, FistName but whose firstName starts with 'A'
select WorkerId, FirstName from Employee where FirstName like 'a%'
-- q3 write a query to show firstname, lastname , department where the department is it or hr
select FirstName,LastName,Department from Employee where Department in ('HR','IT') 
-- q4 Write a query to show FirstName , Salary, where salary is more than 1 lakh
select FirstName,Salary from Employee where Salary > 100000
-- q5 Write a query to show FirstName , Salary, where salary is between 1 lakh to 2 lakh
select FirstName,Salary from Employee where Salary between 100000 and 200000
-- q6 Write a query to show FirstName , Salary, where salary is 95000 or 100000
select FirstName, Salary from Employee where Salary in (95000,100000)
-- or
select FirstName, Salary from Employee where Salary = 95000 or Salary = 100000
-- q7 Write a query to show FirstName  where firstName holds only 5 or 7 characters
select FirstName from Employee where FirstName like '_____' or 
FirstName like '_______'
-- q7 Write a query to show lastName  where lastName starts with r
select lastname from Employee where Lastname like 'r%'
-- q7 Write a query to show lastName  where lastName holds r, o or s
select lastname from Employee where Lastname like '%R%o%s%'
select lastname from Employee where Lastname like '%R%o%s' -- that means end with s