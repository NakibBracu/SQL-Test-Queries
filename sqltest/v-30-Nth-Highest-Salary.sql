select * from EmpSalary order by Salary Desc

-- we have to find out the 3rd highest let's say. 
-- we can use self join here
select Distinct(Salary) from EmpSalary E1 
where 3 - 1 = (select Distinct(Count(Salary)) from EmpSalary E2
where E2.Salary > E1.Salary)
-- I mean Here Count ta ber kortesi je oi Salary theke koita 
-- boro salary ase then oita nije bad taholei highest tah ase 
-- porbe