select E1.EmpId,E1.Name Emp_Name,E2.Name Manager_Name ,
E1.Salary Employee_Salary,
E2. Salary Manager_Salary,
E1.Salary - E2.Salary Difference_Salary
from EmployeeInfo E1 inner join EmployeeInfo E2
on E1.ManagerId = E2.EmpId
where E1.Salary > E2.Salary