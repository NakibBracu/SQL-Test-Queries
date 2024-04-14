-- Create the table
CREATE TABLE Data (
    No INT,
    Name VARCHAR(50),
    Date DATETIME
);

-- Insert values into the table
INSERT INTO Data (No, Name, Date) VALUES
(1, 'Ashish', '2022-12-01 00:00:00.000'),
(2, NULL, '2022-12-02 00:00:00.000'),
(3, 'Raman', '2022-12-03 00:00:00.000'),
(4, NULL, '2022-12-04 00:00:00.000'),
(5, NULL, '2022-12-05 00:00:00.000'),
(6, 'Akshay', '2022-12-06 00:00:00.000'),
(7, NULL, '2022-12-07 00:00:00.000'),
(8, NULL, '2022-12-08 00:00:00.000'),
(9, NULL, '2022-12-09 00:00:00.000'),
(10, 'Manish', '2022-12-10 00:00:00.000');

select * from data