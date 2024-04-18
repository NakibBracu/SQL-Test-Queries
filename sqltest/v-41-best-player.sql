create table Cricket(
Year int,
Player_Name nvarchar(max),
Innings int,
Runs int,
Balls int,
Outs int,
HS int,
F8 int,
F9 int,
[4s] int,
[6s] int
)

INSERT INTO Cricket (Year, Player_Name, Innings, Runs, Balls, Outs, HS, F8, F9, [4s], [6s])
VALUES
(2021, 'Rohit Sharma', 12, 560, 650, 3, 37, 2, 0, 15, 0),
(2021, 'Shubman Gill', 2, 120, 90, 2, 80, 1, 10, 1, 3),
(2022, 'Virat Kohli', 16, 850, 950, 11, 113, 2, 1, 32, 2),
(2023, 'Shubman Gill', 29, 1584, 1503, 25, 208, 9, 5, 181, 41),
(2023, 'KL Rahul', 24, 1060, 1208, 16, 111, 7, 2, 93, 18),
(2022, 'Rohit Sharma', 8, 249, 218, 6, 76, 3, 0, 31, 12),
(2023, 'Rohit Sharma', 26, 1255, 1072, 24, 131, 9, 2, 131, 67),
(2021, 'KL Rahul', 12, 600, 650, 11, 108, 1, 1, 11, 6),
(2023, 'Virat Kohli', 24, 1377, 1389, 19, 166, 8, 6, 122, 24),
(2021, 'Virat Kohli', 15, 400, 500, 3, 66, 2, 0, 10, 1),
(2022, 'MS Dhoni', 10, 280, 320, 5, 78, 1, 1, 22, 4),
(2023, 'Rishabh Pant', 18, 920, 870, 14, 112, 5, 3, 92, 18),
(2024, 'Rohit Sharma', 20, 1400, 1250, 18, 180, 8, 3, 145, 33),
(2024, 'KL Rahul', 22, 1100, 1050, 12, 123, 3, 2, 95, 12),
(2024, 'Virat Kohli', 25, 1600, 1550, 21, 178, 12, 4, 165, 40),
(2024, 'Jasprit Bumrah', 7, 20, 80, 1, 10, 0, 0, 0, 0);

select * from Cricket