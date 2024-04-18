select * from EmpSalary
-- Now we have to find the nth highest or n'th lowest salary
select Distinct(Salary) from EmpSalary E1
where  2 - 1 = (select Distinct(count(Salary)) from EmpSalary E2
where E2.Salary > E1.Salary
)
-- Here 2 means 2nd highest
select Distinct(Salary) from EmpSalary E1
where  3 - 1 = (select Distinct(count(Salary)) from EmpSalary E2
where E2.Salary < E1.Salary
)
-- Here 3 means 3rd lowest as per the logic
-- Here we are comparing the two tables but both of them are same