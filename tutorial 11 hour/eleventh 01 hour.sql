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

go
create or alter procedure insertEmployee
@EmployeeName varchar(max),
@Salary int = null,
@Gender varchar(max) = null,
@Comission int = null,
@DepartmentId int = null,
@MaritalStatus  varchar(max) = null
as
begin
insert into Employee (EmployeeName,Salary,Gender,Comission,DepartmentId,MaritalStatus)
values(@EmployeeName,@Salary,@Gender,@Comission,@DepartmentId,@MaritalStatus)
end
go

select * from employee
exec insertEmployee @EmployeeName = 'Sajeda', @Salary = 25000, @Gender = 'female',
@Comission = 5000, @DepartmentId = 3,  @MaritalStatus = 'single'


--This will return all the columns of a specific table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE, 
    COLUMN_DEFAULT
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'Employee';

declare @AllEmployees nvarchar(max)
select @AllEmployees =
'
<root>
<Employee>
<EmployeeName>
Azad Ali
</EmployeeName>
<Salary>
75000
</Salary>
<Gender>
Male
</Gender>
<Comission>
500
</Comission>
<DepartmentId>
3
</DepartmentId>
<MaritalStatus>
Single
</MaritalStatus>
<EmployeeName> 
Naveda
</EmployeeName>
<Salary>
50000
</Salary>
<Gender>
Female
</Gender>
<Comission>
250
</Comission>
<DepartmentId>
4
</DepartmentId>
<MaritalStatus>
Married
</MaritalStatus>
</Employee>
</root>
'

DECLARE @AllEmployees2 NVARCHAR(MAX);

SET @AllEmployees2 = 
'
<root>
  <Employee 
    EmployeeName="Azad Ali" 
    Salary="75000" 
    Gender="Male" 
    Comission="500" 
    DepartmentId="3" 
    MaritalStatus="Single" 
  />
  <Employee 
    EmployeeName="Naveda" 
    Salary="50000" 
    Gender="Female" 
    Comission="250" 
    DepartmentId="4" 
    MaritalStatus="Married" 
  />
</root>
';

declare @handlr int
exec SP_xml_PrepareDocument @handlr output, @AllEmployees2
select @handlr

select * from openxml(@handlr,'/root/Employee',1) with
(
Name varchar(100) '@EmployeeName',
Gender varchar(100) '@Gender',
Salary int '@Salary',
Comission int '@Comission',
DepartmentId int '@DepartmentId',
MaritalStatus varchar(100) '@MaritalStatus'
)
