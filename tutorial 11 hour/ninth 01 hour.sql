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


