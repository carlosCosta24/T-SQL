use C21_DB1;

-- window functions

-- row number
select * , 
row_number() over (order by Grade  desc) as RowNumber 
from Students;

-- rank

select * , 
rank() over (order by Grade  desc) as RankNumber 
from Students;

-- dense rank better for accuracy 

select * , 
DENSE_RANK() over ( order by grade desc) as RankNumber
from Students;


-- use of partition

select * , 
DENSE_RANK() over (partition by subject order by grade desc) as RankNumber
from Students;

select *, max(Grade) over (partition by Subject ) as MaxGrade,
min(Grade) over (Partition by Subject) as MinGrade,
avg(Grade) over (partition by Subject) as AvarageGrade,
dense_rank() over (partition by subject order by grade) as SubjectName
from Students order by subject;

-- Lag and Lead

select * , lag(Grade,1) over (partition by Subject order by Grade desc) as PreviousGrade,
Grade,
lead(Grade, 1) over (partition by Subject order by Grade desc) as NextGrade
from Students;

-- paging result 
declare @PageNumber int = 2;
declare @RowNumber int = 3;

select * from Students order by Name 

offset (@PageNumber - 1) * @RowNumber rows
fetch next @RowNumber rows only;

use CarsDetails;
declare @CarPageNumber int = 1;
declare @RowNumberPerPage int = 10;

select * from CarMakers order by MakeID 

offset (@CarPageNumber - 1) * @RowNumberPerPage rows
fetch next @RowNumberPerPage rows only;

