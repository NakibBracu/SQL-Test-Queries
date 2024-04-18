create table score
(
PlayerName nvarchar(max),
Run int
)

-- Sample international cricketer names
DECLARE @CricketerNames TABLE (Name nvarchar(max));
INSERT INTO @CricketerNames (Name)
VALUES
    ('Virat Kohli'),
    ('Kane Williamson'),
    ('Joe Root'),
    ('Steve Smith'),
    ('David Warner'),
    ('Rohit Sharma'),
    ('Babar Azam'),
    ('Kagiso Rabada'),
    ('Jasprit Bumrah'),
    ('Shakib Al Hasan');

-- Truncate existing data if needed
TRUNCATE TABLE score;

-- Insert realistic data for each player
INSERT INTO score (PlayerName, Run)
VALUES
    ('Virat Kohli', 50),
    ('Virat Kohli', 60),
    ('Virat Kohli', 70),
    ('Kane Williamson', 45),
    ('Kane Williamson', 55),
    ('Kane Williamson', 65),
    ('Joe Root', 40),
    ('Joe Root', 50),
    ('Joe Root', 60),
    ('Steve Smith', 55),
    ('Steve Smith', 65),
    ('Steve Smith', 75),
    ('David Warner', 60),
    ('David Warner', 70),
    ('David Warner', 80),
    ('Rohit Sharma', 65),
    ('Rohit Sharma', 75),
    ('Rohit Sharma', 85),
    ('Babar Azam', 70),
    ('Babar Azam', 80),
    ('Babar Azam', 90),
    ('Kagiso Rabada', 3),
    ('Kagiso Rabada', 5),
    ('Kagiso Rabada', 8),
    ('Jasprit Bumrah', 2),
    ('Jasprit Bumrah', 4),
    ('Jasprit Bumrah', 6),
    ('Shakib Al Hasan', 30),
    ('Shakib Al Hasan', 40),
    ('Shakib Al Hasan', 50);

Create Table Speciality(
Player_Name nvarchar(max),
Speciality nvarchar(max)
)
INSERT INTO Speciality (Player_Name, Speciality)
VALUES
    ('Virat Kohli', 'Batsman'),
    ('Kane Williamson', 'Batsman'),
    ('Joe Root', 'Batsman'),
    ('Steve Smith', 'Batsman'),
    ('David Warner', 'Batsman'),
    ('Rohit Sharma', 'Batsman'),
    ('Babar Azam', 'Batsman'),
    ('Kagiso Rabada', 'Bowler'),
    ('Jasprit Bumrah', 'Bowler'),
    ('Shakib Al Hasan', 'AllRounder');

	select * from Speciality