--let's create a hiring table
create table TblHiring
(
HiringID int primary key identity,
EmpID int,
HiringDate DateTime 
)

--Insert some sample data
INSERT INTO TblHiring (EmpID, HiringDate)
VALUES 
    (1, '2015-01-15 09:30:00'),
    (2, '2016-02-16 10:00:00'),
    (3, '2017-03-17 11:15:00'),
    (4, '2018-04-18 14:45:00'),
    (5, '2019-05-19 08:00:00'),
    (6, '2020-06-20 12:30:00'),
    (7, '2021-07-21 09:00:00'),
    (8, '2022-08-22 10:30:00'),
    (9, '2023-09-23 11:00:00'),
    (10, '2024-10-24 13:45:00');

select * from TblHiring
select * from Employee

select 
e.employeeId,
e.EmployeeName,
e.Salary,
Format(Th.HiringDate,'dd MMM yyyy') as HiringDate
from Employee e 
inner join TblHiring Th
on e.employeeId = th.EmpID

select 
e.employeeId,
e.EmployeeName,
e.Salary,
Th.HiringDate
from Employee e 
inner join TblHiring Th
on e.employeeId = th.EmpID
order by th.HiringDate desc


--Now we want to find out the joininig days difference between the employee's
-- Olivia and John

select 
ABS(DateDiff(day,HOlivia,HJohn)) as HireDiffdays from
(select 
Max(case when EmployeeName='Olivia' then HiringDate else '' end) as HOlivia,
Max(case when EmployeeName='John' then HiringDate else '' end) as HJohn
from Employee e 
inner join TblHiring Th
on e.employeeId = th.EmpID) t

--Recall CTE 
with cte(i) as
(
select 1 
union all
select i+1
from cte
Where i<10 --Here < means =
)
select * from cte;
--Now let's print 10 to 1
with cte2(i) as
(
select 10
union all
select i-1
from cte2
where i>1 --Here < means =
)
select * from cte2;


-- Now let's say we have two inputs StartDate and EndDate
-- We have to find out the total working days
DECLARE @StartDate DATETIME = '2024-01-01', @EndDate DATETIME = '2024-08-31';

WITH daycte(StartDate, dw, EndDate) AS (
    SELECT @StartDate, DATENAME(dw, @StartDate), @EndDate
    UNION ALL
    SELECT DATEADD(day, 1, StartDate), DATENAME(dw, DATEADD(day, 1, StartDate)), EndDate
    FROM daycte
    WHERE StartDate < EndDate
)
SELECT count(1) as WorkingDays 
FROM daycte
WHERE dw NOT IN ('Friday', 'Saturday')
OPTION (MAXRECURSION 400);

--now let's say you have only given a year string you have to find out the total working days
-- of that year
DECLARE @year NVARCHAR(10) = '2023';
DECLARE @StartDate1 NVARCHAR(10) = @year + '-01-01';

;WITH GivenYearWorkingDays(StartDate, DW) AS (
    SELECT CAST(@StartDate1 AS DATETIME) AS StartDate, DATENAME(DW, CAST(@StartDate1 AS DATETIME)) AS DW
    UNION ALL
    SELECT DATEADD(day, 1, StartDate), DATENAME(DW, DATEADD(day, 1, StartDate))
    FROM GivenYearWorkingDays
    WHERE StartDate < DATEADD(year, 1, CAST(@StartDate1 AS DATETIME))
)
SELECT count(1) as totalworkingDays
FROM GivenYearWorkingDays
WHERE DW NOT IN ('Friday', 'Saturday')
OPTION (MAXRECURSION 400);


--Now lets create this as a scalar value function
--If we don't enclose our function between Go -- GO
-- Then in the middle of the queryBatch 
-- we can't create function
GO
create or alter function GetBusinessDaysCount (@Year varchar(10))
returns int --This function will return and integer; It's a scalar value function
begin
declare @Count int;
Declare @StartDate2 varchar(100) = @Year+'-01-01'
;with workdays(startDate2,dw) as
(
select CAST(@StartDate2 as datetime) as startDate2,DATENAME(dw,CAST(@StartDate2 as datetime))
union all
select DATEADD(DAY,1,startDate2),DATENAME(dw,DATEADD(DAY,1,startDate2))
from workdays
where startDate2 < DATEADD(YEAR,1,CAST(@StartDate2 AS DATETIME))
)
select @Count = count(*) from workdays
where dw not in ('Friday','Saturday')
option (maxrecursion 400);--because after 100 loops it will stop
return @Count
end
GO

SELECT dbo.GetBusinessDaysCount('2025') AS BusinessDaysCount;