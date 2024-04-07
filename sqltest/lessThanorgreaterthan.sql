use school;
select * from class1;
select * from class1 where Roll <> 1 -- not equals to 1
select * from class1 where LEN(STName) <= 6 
select * from class1 where LEN(STName) >= 2 
select * from class1 where LEN(STName) < 6 
select * from class1 where LEN(STName) > 2  
select * from class1 where STName = 'Nakib'