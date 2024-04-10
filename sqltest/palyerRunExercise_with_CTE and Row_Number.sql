use school;


with CTE as
(select  PlayerName,sum(Run) as PlayerRun from CricketScores 
group by PlayerName)

SELECT PlayerName, PlayerRun
FROM (
    SELECT PlayerName, PlayerRun,
           ROW_NUMBER() OVER (ORDER BY PlayerRun DESC) AS RowNum
    FROM CTE
) AS Ranked
WHERE RowNum = 1;

-- Top 3 scorer in all matches
with CTE as
(select  PlayerName,sum(Run) as PlayerRun from CricketScores 
group by PlayerName)

SELECT PlayerName, PlayerRun
FROM (
    SELECT PlayerName, PlayerRun,
           ROW_NUMBER() OVER (ORDER BY PlayerRun DESC) AS RowNum
    FROM CTE
) AS Ranked
WHERE RowNum <= 3;

-- Now find out by match type highest scorer
with CTE2
as(
select 
Match_Type,max(Run) as MaximumRun from CricketScores group by Match_Type)
SELECT 
    c.Match_Type,
    c.MaximumRun,
    cs.PlayerName
FROM 
    CTE2 c
JOIN 
    CricketScores cs ON c.Match_Type = cs.Match_Type AND c.MaximumRun = cs.Run;