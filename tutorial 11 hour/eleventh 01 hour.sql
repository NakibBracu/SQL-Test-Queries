--Store procedure
create or alter procedure GetAllEmployees
as
begin
select * from Employee
end

exec GetAllEmployees --No parameter

go
create or alter procedure GetEmployeeByDepartMent
@DeptID int
as
begin
select * from Employee where DepartmentId = @DeptID
end
go

exec GetEmployeeByDepartMent 2 --Only one parameter thats why it is okay to pass the parameter value only

go
create or alter procedure GetEmployeeByDeptAndSalaryAndMaritalStatus
@DeptId int,
@Salary int,
@MaritalStatus varchar(20)
as
begin
select * from Employee where DepartmentId = @DeptId and Salary > @Salary and MaritalStatus = @MaritalStatus
end
go

exec dbo.GetEmployeeByDeptAndSalaryAndMaritalStatus @DeptID = 2, @Salary = 50000,@maritalstatus = 'single';

--by multiple parameter we also called it
--Now lets create a store procedure that will returns an output; That means store proedure with 
-- output parameter
go
create or alter procedure GetEmployeeNames
@deptID int,
@salary int,
@EmpName varchar(max) output
as
begin
select * from Employee
where DepartmentId = @deptID and Salary > @salary
select @EmpName = STUFF(
(select ','+EmployeeName
from Employee where DepartmentId=@deptID for xml path('')
),1,1,'')
end
go


DECLARE @emppName VARCHAR(MAX);

EXEC GetEmployeeNames @DeptID = 2, @Salary = 50000, @EmpName = @emppName OUTPUT;

SELECT @emppName;
