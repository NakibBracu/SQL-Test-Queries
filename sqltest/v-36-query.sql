/*Assume there are three Spotify tables containing information 
about the artists, songs, and music charts. I Write a query to determine
the top 5 artists whose songs appear in the Top 10 of the global_song_rank 
table the highest number of times.
Output the top 5 artist names and give ranking 1st of who has the most 
appearances.
Assumptions: If two artists' songs have the same number of appearances, 
the artists should have the same rank. The rank number should be 
continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5)*/

select * from Artists
select * from Songs
select * from global_song_rank

select Artist_Name , Rank from
(select Artist_Name, Total_Appearence,
DENSE_RANK() over(order by Total_Appearence desc) as Rank
from
(select A.Artist_Name,COUNT(G.Rank) as Total_Appearence from Artists A inner join Songs S on
A.Artist_Id = S.Artist_Id
inner join global_song_rank G on
s.Song_Id = G.Song_Id
where Rank <= 10 
group by A.Artist_Name) A) N
where rank <=5