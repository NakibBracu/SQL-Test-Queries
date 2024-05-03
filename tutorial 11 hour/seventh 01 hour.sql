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

-- select string_split('Nakib,Rakib,Kabila,Nabik',',') from #Test3
-- This might not work all the time
-- So, we have to create a custom function to do the work
-- Let's create a simple function first
-- below function is a scalar function, because it returns a scalar value
create function printMessage(@message nvarchar(max))
returns nvarchar(max)
begin
    return @message;
end
drop function printMessage
DECLARE @outputMessage nvarchar(max);

SET @outputMessage = dbo.printMessage('Your message goes here.');

SELECT @outputMessage AS OutputMessage;

-- Let's say revise the cte first
with cte(name,i) as
(
  select 'Nakib', 1 Name
  union all
  select Name,i+1 from cte
  where i<5
)
select * from cte

--Below Function is tabular function, because it returns a table
alter function splitstring(@str varchar(max))
returns Table
return
(
 with CTE (strr,item,remainingSTR) as
 (
 select cast(@str+',' as varchar(max)),
 cast(substring(@str+',',1,charindex(',',@str+',')-1) as varchar(max)),
 cast(substring(@str+',',charindex(',',@str+',')+1,len(@str+',')) as varchar(max))
 union all
 select cast(@str as varchar(max)),
 cast(substring(remainingSTR,1,charindex(',',remainingSTR)-1) as varchar(max)),
 cast(substring(remainingSTR,charindex(',',remainingSTR)+1,len(remainingSTR)) as 
 varchar(max))
 from CTE
 where CHARINDEX(',',remainingSTR)>1
 )

 select * from CTE

)


select * from splitstring('Nakib,Rakib,Akib,Nabik')

create function splitstring2(@str varchar(max))
returns Table
return
(
 with CTE (strr,item,remainingSTR) as
 (
 select cast(@str+',' as varchar(max)),
 cast(substring(@str+',',1,charindex(',',@str+',')-1) as varchar(max)),
 cast(substring(@str+',',charindex(',',@str+',')+1,len(@str+',')) as varchar(max))
 union all
 select cast(@str as varchar(max)),
 cast(substring(remainingSTR,1,charindex(',',remainingSTR)-1) as varchar(max)),
 cast(substring(remainingSTR,charindex(',',remainingSTR)+1,len(remainingSTR)) as 
 varchar(max))
 from CTE
 where CHARINDEX(',',remainingSTR)>1
 )

 select item from CTE

)

select * from splitstring2('Nakib,Rakib,Akib,Nabik')

