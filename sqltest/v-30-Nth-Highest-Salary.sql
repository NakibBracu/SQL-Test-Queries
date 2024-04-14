select * from EmpSalary order by Salary Desc

-- we have to find out the 3rd highest let's say. 
-- we can use self join here
select Distinct(Salary) from EmpSalary E1 
where 3 - 1 = (select Distinct(Count(Salary)) from EmpSalary E2
where E2.Salary > E1.Salary)
-- I mean Here Count ta ber kortesi je oi Salary theke koita 
-- boro salary ase then oita nije bad taholei highest tah ase 
-- porbe
-- Way 2 Nested Max
-- Lets say we want to find the 2nd highest salary
select max(salary) from EmpSalary where
Salary < (select max(Salary) from EmpSalary)
-- Now for third highest salary we can go
select max(salary) as third_highest_salary from EmpSalary where 
Salary <(select max(Salary) from EmpSalary 
Where Salary <(select max(Salary) from EmpSalary 
))
-- as we see many nested query here. So, it is very much hardcoded
-- We now use Limit clause here
-- Here we find the second highest salary
-- We are skipping 3 row that means 4th highest salary is ignored
-- Here for offset we can take input from user
SELECT Distinct(Salary) FROM EmpSalary ORDER BY Salary DESC
OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;

-- Now we can find n'th highest by using dense rank
select Distinct(Salary),DENSE_RANK() over(
order by salary desc
) as salary_rank from EmpSalary 
as temp -- query Test
-- from the query Test we can do a good ranking for finding the
-- nth highest salary
-- Let's say we want to find the 2nd highest salary
select Salary from (
select Distinct(Salary),DENSE_RANK() over(
order by salary desc
) as salary_rank from EmpSalary 
) as temp
where salary_rank = 3

-- we want to find the 2nd highest salary only using not in
select max(salary) as second_highest_salary from EmpSalary 
where Salary not in
(select max(salary) from EmpSalary)

-- using operator sign
select max(salary) from EmpSalary where Salary <>
(select max(salary) from EmpSalary)