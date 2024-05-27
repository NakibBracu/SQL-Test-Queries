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

go
create or alter procedure insertMultipleEmployees
@AllEmployees nvarchar(max)=null
as
begin
declare @handlr int
exec SP_Xml_PrepareDocument @handlr output, @AllEmployees
insert into Employee(EmployeeName,Gender,Salary,Comission,DepartmentId,MaritalStatus)
select
Name,
Gender,
Salary,
Comission,
DepartmentId,
MaritalStatus from 
openxml(@handlr,'/root/Employee',1) with
(
Name varchar(100) '@EmployeeName',
Gender varchar(100) '@Gender',
Salary int '@Salary',
Comission int '@Comission',
DepartmentId int '@DepartmentId',
MaritalStatus varchar(100) '@MaritalStatus'
)
end
go

select * from Employee
DECLARE @AllEmployees3 NVARCHAR(MAX);

SET @AllEmployees3 = 
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
exec insertMultipleEmployees @AllEmployees3

go
create or alter procedure insertMultipleEmployees2
@AllEmployees nvarchar(max)=null
as
begin
declare @handlr int
exec SP_Xml_PrepareDocument @handlr output, @AllEmployees
insert into Employee(EmployeeName,Gender,Salary,Comission,DepartmentId,MaritalStatus)
select
Name,
Gender,
Salary,
Comission,
DepartmentId,
MaritalStatus from 
openxml(@handlr,'/root/Employee',2) with
(
Name varchar(100) 'EmployeeName',
Gender varchar(100) 'Gender',
Salary int 'Salary',
Comission int 'Comission',
DepartmentId int 'DepartmentId',
MaritalStatus varchar(100) 'MaritalStatus'
)
end
go

delete from Employee where employeeId in (18,19,20)
select * from Employee
DECLARE @AllEmployees4 NVARCHAR(MAX);

SET @AllEmployees4 = 
'
<root>
  <Employee>
    <EmployeeName>
      Rahman Khan
    </EmployeeName>
    <Salary>
      80000
    </Salary>
    <Gender>
      Male
    </Gender>
    <Comission>
      600
    </Comission>
    <DepartmentId>
      1
    </DepartmentId>
    <MaritalStatus>
      Married
    </MaritalStatus>
  </Employee>
  <Employee>
    <EmployeeName>
      Fatima Begum
    </EmployeeName>
    <Salary>
      55000
    </Salary>
    <Gender>
      Female
    </Gender>
    <Comission>
      300
    </Comission>
    <DepartmentId>
      2
    </DepartmentId>
    <MaritalStatus>
      Single
    </MaritalStatus>
  </Employee>
  <Employee>
    <EmployeeName>
      Aminul Islam
    </EmployeeName>
    <Salary>
      70000
    </Salary>
    <Gender>
      Male
    </Gender>
    <Comission>
      450
    </Comission>
    <DepartmentId>
      3
    </DepartmentId>
    <MaritalStatus>
      Married
    </MaritalStatus>
  </Employee>
</root>
';
exec insertMultipleEmployees2 @AllEmployees4

--Now we learn pagination with the help of offset and fetch next
-- Left ---> Offset
-- Take --> fetch next
declare @pageSize int = 3,
 @pageNumber int = 3
select * from Employee
order by employeeId
offset (@pageNumber - 1)*@pageSize rows
fetch next @pageSize rows only

--Now let's create a store procedure with this
go
create or alter procedure paginationWithPageNumberPagesize
 @pageNumber int,
@pageSize int
as
begin
select * from Employee
order by employeeId
offset (@pageNumber - 1)*@pageSize rows
fetch next @pageSize rows only
end
go

exec paginationWithPageNumberPagesize 3,5