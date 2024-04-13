-- Create the Device table
CREATE TABLE Device (
    Visitor_ID INT,
    Sale_Date DATE,
    Device_Type VARCHAR(50)
);

-- Insert the given data into the Device table
INSERT INTO Device (Visitor_ID, Sale_Date, Device_Type)
VALUES
    (1, '2022-08-15', 'Mobile'),
    (1, '2022-08-15', 'Tablet'),
    (1, '2022-08-15', 'Laptop'),
    (2, '2022-08-22', 'Mobile'),
    (2, '2022-08-22', 'Laptop'),
    (3, '2022-09-02', 'Mobile');

	select * from Device