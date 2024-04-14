-- Create the table
CREATE TABLE EmpSalary (
    F_Name VARCHAR(50),
    L_Name VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);

-- Insert data into the table
INSERT INTO EmpSalary (F_Name, L_Name, Salary, Department) VALUES
('Ashish', 'Rawat', 50000, 'Data Analyst'),
('Diksha', 'Chauhan', 60000, 'HR'),
('Raman', 'Verma', 55000, 'Finance'),
('Chahat', 'Choudhary', 45000, 'Operation'),
('Renuka', 'Dwivedi', 50000, 'HR'),
('Mansi', 'Aggarwal', 48000, 'Operation'),
('Narendra Singh', NULL, 45000, 'Finance'), -- If the last name is NULL
('Sikha', 'Triwedi', 35000, 'Operation'),
('Rishabh', 'Rai', 40000, 'Finance');

select * from EmpSalary