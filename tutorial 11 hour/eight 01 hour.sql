create table #Employeetttt2(
Name nvarchar(max)
)


insert into #Employeetttt2
select 'Nakib,Rakib,Akib'
union 
select 'Karena,Rahima,Sakina'
union
select 'Tambula,Kabila,Saliba'
union
select 'Baharain,Marain,Dumbi'

select Name, item from #Employeetttt2
cross apply splitstring2(Name)
-- cross apply is like below. When a single value is distributed to multiple values
-- then that many rows will be present in the column like below and it will only end 
-- when the left rows values are end
/*
Name	                 item
Baharain,Marain,Dumbi	Baharain
Baharain,Marain,Dumbi	Marain
Baharain,Marain,Dumbi	Dumbi
Karena,Rahima,Sakina	Karena
Karena,Rahima,Sakina	Rahima
Karena,Rahima,Sakina	Sakina
Nakib,Rakib,Akib	    Nakib
Nakib,Rakib,Akib	    Rakib
Nakib,Rakib,Akib	    Akib
Tambula,Kabila,Saliba	Tambula
Tambula,Kabila,Saliba	Kabila
Tambula,Kabila,Saliba	Saliba
*/

select item from #Employeetttt2
cross apply splitstring2(Name)

--cross apply 

create table Teacher(
TeacherID int primary key identity,
Name nvarchar(max)
)

create table TSubject(
SubjectID int primary key identity,
SubjectName nvarchar(max),
TeacherID int
)

insert into Teacher(Name) 
values ('Annajiat'),('Kaonain'),('Rakib'),('Jalal Uddin'),('Sachin')

insert into TSubject(SubjectName,TeacherID) 
values ('Math',1),('Math',2),('Math',3),('Computer Science',1),('Computer Science',2),
       ('History',3),('Bangla',4),('SQL',5)

select * from Teacher
select * from TSubject

--Find out who teacher what subject
select t.Name,ts.SubjectName from Teacher t inner join TSubject ts 
on t.TeacherID = ts.TeacherID 
/*
Name	SubjectName
Annajiat	Math
Kaonain	    Math
Rakib	    Math
Annajiat	Computer Science
Kaonain	    Computer Science
Rakib	    History
Jalal Uddin	Bangla
Sachin	    SQL
*/

-- Now I want the output to be like Annajiat Math,Computer Science
select t.Name,
STRING_AGG (ts.SubjectName,',') as Subjects from Teacher t inner join TSubject ts 
on t.TeacherID = ts.TeacherID
group by t.TeacherID , t.Name
--string_agg is a aggregate function

-- But what if my sql server version don't support STRING_AGG
select * from Teacher for xml path('')
/*
<TeacherID>1</TeacherID><Name>Annajiat</Name><TeacherID>2</TeacherID><Name>Kaonain</Name><TeacherID>3</TeacherID><Name>Rakib</Name><TeacherID>4</TeacherID><Name>Jalal Uddin</Name><TeacherID>5</TeacherID><Name>Sachin</Name>
*/
-- see the output for xml path
-- but what if we use to concatanate string with xml path
select ','+Name from Teacher for xml path('')
-- ,Annajiat,Kaonain,Rakib,Jalal Uddin,Sachin
-- you see the output here
-- whenever we concatanate any string with the xml path it replaces the tag
-- from xml
-- Now we have to replace the first unwanted comma
select stuff((select ','+Name from Teacher for xml path('')),1,1,'')
-- Here We replace the first character  with an empty string
-- The below query is error prone
/*
SELECT REPLACE(
    (SELECT ',' + Name FROM Teacher FOR XML PATH('')),
    SUBSTRING((SELECT ',' + Name FROM Teacher FOR XML PATH('')), 1, 1),
    ''
);

*/

select 
t.Name,
stuff((
select ','+SubjectName from TSubject 
where TeacherID = t.TeacherID for xml path('')
),1,1,'') Subject
from Teacher t inner join TSubject ts on 
t.TeacherID = ts.TeacherID
group by t.TeacherID,t.Name

-- Now lets talk about DateTime
-- Normal Format of DateTime is yyyy-mm-dd

select '2024-12-05'

select DateAdd(day,1,'2024-12-05')
select DateAdd(hour,1,'2024-12-05')
select DateAdd(month,1,'2024-12-05')
select DateAdd(year,1,'2024-12-05')

--What if we want to go to the back


select DateAdd(day,-1,'2024-12-05')
select DateAdd(hour,-1,'2024-12-05')
select DateAdd(month,-1,'2024-12-05')
select DateAdd(year,-1,'2024-12-05')

--Now difference
select DATEDIFF(day,'2023-12-05','2024-12-05')
select DATEDIFF(month,'2023-12-05','2024-12-05')
select DATEDIFF(hour,'2023-12-05','2024-12-05')
select DATEDIFF(year,'2023-12-05','2024-12-05')

-- Now DateName
select DATENAME(DW,'2024-05-09') --Thursday
select DATENAME(DAYOFYEAR,'2024-05-09') --130 --that means 130'th Day of the year