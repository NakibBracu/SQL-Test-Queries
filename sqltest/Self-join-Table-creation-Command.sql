use school;
-- Creating the EmployeeInfo table with additional properties
CREATE TABLE EmployeeInfo (
    EmpId INT PRIMARY KEY,
    ManagerId INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    FOREIGN KEY (ManagerId) REFERENCES EmployeeInfo(EmpId)
);

-- Inserting records into EmployeeInfo table
INSERT INTO EmployeeInfo (EmpId, ManagerId, Name, Email, Salary, Department) VALUES 
(1, NULL, 'John Doe', 'john.doe@example.com', 60000.00, 'Management'),
(2, 1, 'Alice Smith', 'alice.smith@example.com', 50000.00, 'Marketing'),
(3, 1, 'Bob Johnson', 'bob.johnson@example.com', 55000.00, 'Marketing'),
(4, 2, 'Emma Brown', 'emma.brown@example.com', 45000.00, 'Sales'),
(5, 2, 'Charlie Wilson', 'charlie.wilson@example.com', 48000.00, 'Sales'),
(6, 3, 'Olivia Davis', 'olivia.davis@example.com', 52000.00, 'HR'),
(7, 3, 'Ethan Miller', 'ethan.miller@example.com', 51000.00, 'HR'),
(8, 4, 'Sophia Garcia', 'sophia.garcia@example.com', 47000.00, 'Finance'),
(9, 4, 'Liam Martinez', 'liam.martinez@example.com', 49000.00, 'Finance'),
(10, 5, 'Ava Rodriguez', 'ava.rodriguez@example.com', 53000.00, 'Engineering'),
(11, 5, 'Noah Hernandez', 'noah.hernandez@example.com', 54000.00, 'Engineering'),
(12, 6, 'Isabella Lopez', 'isabella.lopez@example.com', 46000.00, 'IT'),
(13, 6, 'Mason Gonzalez', 'mason.gonzalez@example.com', 47000.00, 'IT'),
(14, 7, 'Sophia Perez', 'sophia.perez@example.com', 48000.00, 'Operations'),
(15, 7, 'Jacob Wilson', 'jacob.wilson@example.com', 51000.00, 'Operations'),
(16, 8, 'Olivia Scott', 'olivia.scott@example.com', 49000.00, 'Customer Support'),
(17, 8, 'Ethan Lee', 'ethan.lee@example.com', 50000.00, 'Customer Support'),
(18, 9, 'Emma Walker', 'emma.walker@example.com', 47000.00, 'Quality Assurance'),
(19, 9, 'William Perez', 'william.perez@example.com', 48000.00, 'Quality Assurance'),
(20, 10, 'Ava Young', 'ava.young@example.com', 52000.00, 'Research');
Select * from EmployeeInfo