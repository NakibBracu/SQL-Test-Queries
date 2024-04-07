-- Create the table
CREATE TABLE CricketScores (
    PlayerName VARCHAR(50),
    Run INT,
    Match_Type VARCHAR(10)
);

INSERT INTO CricketScores (PlayerName, Run, Match_Type)
VALUES
('Virat Kohli', 102, 'ODI'),
('Virat Kohli', 78, 'T20'),
('Virat Kohli', 115, 'Test'),
('Rohit Sharma', 92, 'ODI'),
('Rohit Sharma', 63, 'T20'),
('Rohit Sharma', 80, 'Test'),
('Joe Root', 105, 'ODI'),
('Joe Root', 55, 'T20'),
('Joe Root', 70, 'Test'),
('Kane Williamson', 95, 'ODI'),
('Kane Williamson', 45, 'T20'),
('Kane Williamson', 85, 'Test'),
('Babar Azam', 110, 'ODI'),
('Babar Azam', 60, 'T20'),
('Babar Azam', 75, 'Test'),
('Steve Smith', 98, 'ODI'),
('Steve Smith', 65, 'T20'),
('Steve Smith', 45, 'Test'),
('David Warner', 112, 'ODI'),
('David Warner', 67, 'T20'),
('David Warner', 88, 'Test'),
-- Add more records for other players in similar fashion...
('Quinton de Kock', 120, 'ODI'),
('Quinton de Kock', 58, 'T20'),
('Quinton de Kock', 82, 'Test'),
('Eoin Morgan', 105, 'ODI'),
('Eoin Morgan', 72, 'T20'),
('Eoin Morgan', 68, 'Test'),
('Aaron Finch', 85, 'ODI'),
('Aaron Finch', 53, 'T20'),
('Aaron Finch', 77, 'Test'),
('Shakib Al Hasan', 93, 'ODI'),
('Shakib Al Hasan', 50, 'T20'),
('Shakib Al Hasan', 80, 'Test');

