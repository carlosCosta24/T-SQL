use C21_DB1;

create function AvgGrade(@Subject nvarchar(20))
returns int 
as 
begin 
	declare @AvgGrade int;
	select @AvgGrade = avg(Grade) from Students where Subject = @Subject  

	return @AvgGrade;
end

-- run func

select Name,Subject, dbo.AvgGrade(Subject) 
from Teachers


select Name,Subject, dbo.AvgGrade(Subject) 
from Teachers
where dbo.AvgGrade(Subject) < 85;