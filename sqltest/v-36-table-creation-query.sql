create table Artists(
Artist_Id int,
Artist_Name nvarchar(max)
)
create table Songs(
Song_Id int,
Artist_Id int
)

create table global_song_rank(
Day int,
Song_Id int,
Rank int
)

-- Inserting data into the Artists table
INSERT INTO Artists (Artist_Id, Artist_Name) VALUES
(1, 'Ed Sheeran'),
(2, 'Taylor Swift'),
(3, 'Beyoncé'),
(4, 'The Weeknd'),
(5, 'Drake'),
(6, 'Adele'),
(7, 'Bruno Mars'),
(8, 'Rihanna'),
(9, 'Justin Bieber'),
(10, 'Ariana Grande'),
(11, 'Katy Perry'),
(12, 'Shawn Mendes'),
(13, 'Lady Gaga'),
(14, 'Post Malone'),
(15, 'Billie Eilish');

-- Inserting data into the Songs table
INSERT INTO Songs (Song_Id, Artist_Id) VALUES
(101, 1), -- Ed Sheeran
(102, 2), -- Taylor Swift
(103, 3), -- Beyoncé
(104, 4), -- The Weeknd
(105, 5), -- Drake
(106, 6), -- Adele
(107, 7), -- Bruno Mars
(108, 8), -- Rihanna
(109, 9), -- Justin Bieber
(110, 10), -- Ariana Grande
(111, 11), -- Katy Perry
(112, 12), -- Shawn Mendes
(113, 13), -- Lady Gaga
(114, 14), -- Post Malone
(115, 15), -- Billie Eilish
(116, 1), -- Ed Sheeran
(117, 2), -- Taylor Swift
(118, 3), -- Beyoncé
(119, 4), -- The Weeknd
(120, 5); -- Drake

-- Inserting data into the global_song_rank table
INSERT INTO global_song_rank (Day, Song_Id, Rank) VALUES
(1, 101, 1), -- Ed Sheeran - Song 1
(1, 102, 2), -- Taylor Swift - Song 1
(1, 103, 3), -- Beyoncé - Song 1
(1, 104, 4), -- The Weeknd - Song 1
(1, 105, 5), -- Drake - Song 1
(1, 106, 6), -- Adele - Song 1
(1, 107, 7), -- Bruno Mars - Song 1
(1, 108, 8), -- Rihanna - Song 1
(1, 109, 9), -- Justin Bieber - Song 1
(1, 110, 10), -- Ariana Grande - Song 1
(1, 111, 11), -- Katy Perry - Song 1
(1, 112, 12), -- Shawn Mendes - Song 1
(1, 113, 13), -- Lady Gaga - Song 1
(1, 114, 14), -- Post Malone - Song 1
(1, 115, 15), -- Billie Eilish - Song 1
(1, 116, 1), -- Ed Sheeran - Song 2
(1, 117, 2), -- Taylor Swift - Song 2
(1, 118, 3), -- Beyoncé - Song 2
(1, 119, 4), -- The Weeknd - Song 2
(1, 120, 5); -- Drake - Song 2


select * from Artists
select * from Songs
select * from global_song_rank