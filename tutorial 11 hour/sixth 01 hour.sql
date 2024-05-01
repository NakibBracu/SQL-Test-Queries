select * into employee4 from employee3

select * from employee4

select * from Employeebonus
 -- Now keep only the employee in employee4 table where emplyeeid reference existed 
 -- in the employeeBonus  Table

delete from employee4 where EmployeeId not in  (
select EmployeeId from Employeebonus
) 

select * from employee4

--Now what if I want to override Identity Column and insert values on it 
-- Let's just insert some duplicate rows to find out
-- Allow explicit insertion of identity values
SET IDENTITY_INSERT employee4 ON;

-- Insert duplicate records
INSERT INTO employee4 (EmployeeId, name, salary, gender, departmentid) VALUES 
(1,'Nakib',101000,'Male',1),
(1,'Nakib',101000,'Male',1),
(3,'Sarmila',178000,'Female',2),
(3,'Sarmila',178000,'Female',2);

-- Disallow explicit insertion of identity values
SET IDENTITY_INSERT employee4 OFF;

select * from employee4

--Now we have to delete the duplicate records
--here we learn the concept of CTE and Row number
-- Now Row Number Partiton The records by EmployeeId and with that RN > 1 will be considered
-- as duplicate records
with duplicaterecords as
(
select *,ROW_NUMBER() over(partition by EmployeeId order by Salary desc) as RN
from employee4
)
delete from duplicaterecords where RN > 1

select * from employee4

-- How to insert apostrophe in a string in sql server?
-- using double quotation
select 'The bag was in Nakib''s house'

-- Now revise replace , Replicate, translate,len,substring
select Replace('Nakib1234','1234','')
select Replicate('#',26)
select Translate('Nakib1234','1234567890',Replicate('#',10)) --Important function
--Write while loop in sql
declare @i int = 1
while (@i<10)
begin
select @i
set @i = @i+1
end

-- But the above while loop only prints the number is seperate tables for each iteration
-- But we need to be part of a same table 
-- We can accomplish that only with recursive CTE

with whileLoop(cntr) as 
(
select 1 
union all 
select cntr+1 
from whileLoop
where cntr < 10
)
select * from whileloop 

-- Now let's say print each character of 'Nakib' in every row like below
-- N
-- a
-- k
-- i
-- b

with CharcterPrint(cntr,Name,charName) as
(
select 1, cast('Nakib' as varchar(10)),CAST(SUBSTRING('Nakib',1,1) as varchar(10))
union all
select cntr+1,CAST(Name as varchar(10)),CAST(SUBSTRING('Nakib',cntr+1,1) as varchar(10))
from CharcterPrint
where cntr < len(Name)
)
select * from CharcterPrint


DECLARE @Word VARCHAR(MAX) = 'pneumonoultramicroscopicsilicovolcanoconiosis';

WITH charPrintOnebyOne(counter, Name, charName) AS
(
    SELECT 1, CAST(@Word AS VARCHAR(MAX)), CAST(SUBSTRING(@Word, 1, 1) AS VARCHAR(MAX))
    UNION ALL
    SELECT counter + 1, CAST(@Word AS VARCHAR(MAX)), CAST(SUBSTRING(@Word, counter + 1, 1) AS VARCHAR(MAX))
    FROM charPrintOnebyOne
    WHERE counter < LEN(Name)
)
SELECT * FROM charPrintOnebyOne;

select 'scissors' 

--Find out from the word scissors that how many times 's' is repeated
select (LEN('scissors')-LEN(Replace('scissors','s','')))
select (LEN('scissors')-LEN(Replace('scissors','ss','')))/len('ss')

--Now let's Generalize This
declare @WordToDivide nvarchar(max) = 'scissors'
declare @character nvarchar(max) = 'ss'
select (LEN(@WordToDivide)-LEN(REPLACE(@WordToDivide,@character,'')))/LEN(@character)

--Now You have a unwanted mixutre data of Name and Salary collectively 
--select Translate('Nakib123456','1234567890',REPLICATE('',10)) -- This is wrong
--The second and third arguments of the TRANSLATE 
--built-in function must contain an equal number of characters.

select Replace(Translate('Nakib123456','1234567890',REPLICATE('#',10)),'#','') as Name
select 
Replace(Translate('Nakib123456','abcdefghijklmnopqrstuvwxyz',REPLICATE('#',26)),'#','') 
as salary

--Now Generalize it
declare @MixedInput nvarchar(max)= 'Nakib123456'
-- Extract salary and Name from it
select replace(TRANSLATE(@MixedInput,'1234567890',REPLICATE('#',10)),'#','') as Name
select 
replace(TRANSLATE(@MixedInput,'abcdefghijklmnopqrstuvwxyz',replicate('#',26)),'#','')
as Salary
