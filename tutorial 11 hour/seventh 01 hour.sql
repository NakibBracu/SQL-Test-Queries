create table #TestSperateName(
Name varchar(50)
)

insert into #TestSperateName
select 'Nakib123456'
union
select 'Rakib356589'
union
select 'Sazzad7894560'
union
select 'Ruhan78562021'
union
select 'Nabik450589021'

-- Now seperate the Name and Salary from the #TestSperateName Column and put them
-- in Name and Salary Column
select *,Replace(TRANSLATE(Name,'1234567890',REPLICATE('#',10)),'#','') as Name,
Replace(TRANSLATE(Name,'abcdefghijklmnopqrstuvwxyz',Replicate('#',26)),'#','') as Salary
from #TestSperateName

create table #tested2(
Name varchar(max)
)

insert into #tested2
select 'Nakib123$#%56'
union
select 'Rakib35!$#%89'
union
select 'Sazzad78#$#%94560'
union
select 'Ruhan78562!!@#$#%021'
union
select 'Nabik45058$#%9021'

--Remove the Special Character From the field column
select *,
REPLACE(Name,
Replace(TRANSLATE(Name,'abcdefghijklmnopqrstuvwxyz',REPLICATE('.',26)),'.',''),'')
as Name2
from #tested2

Create Table #Test3
(
Name varchar(max)
)

insert into #Test3
select 'Nakib Rahaman'
union
select 'Rakib Hossain'
union
select 'Sazzad Showmik'
union
select 'Rumana Khatun'
union
select 'Walid Ibrahim'


select *,
SUBSTRING(Name,1,1)+'.'+
SUBSTRING(Name,CHARINDEX(' ',Name)+1,1)
as Initial
from #Test3