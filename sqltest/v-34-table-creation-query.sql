-- Create the table
CREATE TABLE Email (
    Email_ID INT,
    User_ID INT,
    SignUp_Date DATE
);

-- Insert data into the table
-- Insert data into the table
INSERT INTO Email (Email_ID, User_ID, SignUp_Date)
VALUES
    (1001, 1001, '2024-01-01'),
    (1002, 1002, '2024-01-02'),
    (1003, 1003, '2024-01-03'),
    (1004, 1004, '2024-01-04'),
    (1005, 1005, '2024-01-05'),
    (1006, 1006, '2024-01-06'),
    (1007, 1007, '2024-01-07'),
    (1008, 1008, '2024-01-08'),
    (1009, 1009, '2024-01-09'),
    (1010, 1010, '2024-01-10');


	select * from Email

	CREATE TABLE Text (
    Text_ID int,
    Email_ID INT,
    Sign_Up_Action VARCHAR(20)
);

-- Insert data into the table
INSERT INTO Text (Text_ID, Email_ID, Sign_Up_Action)
VALUES
    (1001, 1001, 'Confirmed'),
    (1002, 1002, 'Not Confirmed'),
    (1003, 1003, NULL),
    (1004, 1004, 'Confirmed'),
    (1005, 1005, 'Not Confirmed'),
    (1006, 1006, 'Confirmed'),
    (1007, 1007, 'Not Confirmed'),
    (1008, 1008, NULL),
    (1009, 1009, 'Confirmed'),
    (1010, 1010, 'Not Confirmed'),
    (1011, 1001, NULL),
    (1012, 1002, 'Confirmed'),
    (1013, 1003, 'Not Confirmed'),
    (1014, 1004, 'Confirmed'),
    (1015, 1005, 'Not Confirmed'),
    (1016, 1006, NULL),
    (1017, 1007, 'Confirmed'),
    (1018, 1008, 'Not Confirmed'),
    (1019, 1009, 'Confirmed'),
    (1020, 1010, 'Not Confirmed');

	select * from text