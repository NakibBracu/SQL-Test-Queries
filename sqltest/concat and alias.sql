use school;
--concat and alias
select WorkerID,FirstName,LastName from Employee;
select WorkerID,Concat(FirstName,'_',LastName) as 'Full Name' from Employee;