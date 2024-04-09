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