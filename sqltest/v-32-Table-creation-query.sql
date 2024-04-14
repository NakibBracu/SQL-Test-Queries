-- Create the table
CREATE TABLE dunzo (
    Id VARCHAR(10),
    Start_Time TIME,
    End_Time TIME,
    Start_Location VARCHAR(50),
    End_Location VARCHAR(50)
);

-- Insert data into the table
INSERT INTO dunzo (Id, Start_Time, End_Time, Start_Location, End_Location) VALUES
('R_1', '09:00:00.0000000', NULL, 'Delhi', 'Noida'),
('R_1', '10:00:00.0000000', '10:30:00.0000000', 'Noida', 'Gr_Noida'),
('R_1', '10:30:00.0000000', '10:45:00.0000000', 'Gr_Noida', 'Delhi'),
('R_2', '11:00:00.0000000', '11:25:00.0000000', 'Gaziabad', 'Muradabad'),
('R_2', '11:35:00.0000000', '11:55:00.0000000', 'Muradabad', 'Delhi');

select * from dunzo