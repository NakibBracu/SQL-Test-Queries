use school;
-- Write a query that can seperate EmployeeName and Their E-mail Domain 
-- from Email Field
-- Firstly using left command We can extract EmployeeName from Email to get characters
-- before @
-- then using Right command we can get the characters from Right Side to before '@'
select Email,LEFT(Email,CHARINDEX('@',Email)-1) as EmployeeName,
Right(Email, LEN(Email)-CHARINDEX('@',Email)) as DomainName
from EmployeeInfo