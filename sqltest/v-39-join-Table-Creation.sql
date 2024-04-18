create table TableA
(
ColA int,
ColB nvarchar(1)
)

create table TableB
(
ColA int,
ColB nvarchar(1)
)

insert into TableA values
(10,'A'),
(20,'B'),
(20,'C'),
(30,'D'),
(40,'E'),
(null,'F'),
(null,'G')

insert into TableB
values (10,'X'), (10,'Y'),(20,'Z'),(40,'S'),(null,'X')