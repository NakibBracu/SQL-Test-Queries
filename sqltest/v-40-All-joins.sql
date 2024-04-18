select * from TableA;
select * from TableB;

--only common record come, inner join
select A.ColA as TableA,B.ColA as TableB
from TableA A inner join TableB B on A.ColA = b.ColA

-- common record come from right table and uncommon from left, Left join
select A.ColA as TableA,B.ColA as TableB
from TableA A left join TableB B on A.ColA = b.ColA

-- common record come from left table and uncommon from right, Left join
select A.ColA as TableA,B.ColA as TableB
from TableA A right join TableB B on A.ColA = b.ColA

-- common+uncommon record come from left table and
-- the right table
select A.ColA as TableA,B.ColA as TableB
from TableA A full  join TableB B on A.ColA = b.ColA

-- cross join
select A.ColA as TableA,B.ColA as TableB
from TableA A cross join TableB B 