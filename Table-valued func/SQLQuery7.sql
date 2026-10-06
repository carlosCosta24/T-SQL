--Inline table-valued func (ITVFs)

use C21_DB1;

create function GetStudentsBySubject(@Subject nvarchar(20))
returns table
as return 
	(
	select * from Students where Subject = @Subject
	)

-- Run GetStudentsBySubject func

select name, Subject, Grade from dbo.GetStudentsBySubject('Math') where Grade < 90;

select
avg(Grade) as MathAverage from dbo.GetStudentsBySubject('Math');

-- use with join 

select s.name as StudentName, t.Name as TeacherName, s.Grade
from dbo.GetStudentsBySubject('Math') s 
join teachers t on s.Subject = t.Subject;


create function GetTopStudents(@Number int)
returns @Result table
	(
		StudentID int ,
		Name nvarchar(20),
		Subject nvarchar(20),
		Grade int
	)
as begin  
	insert into @Result(StudentID,Name,Subject,Grade )
	select top (@Number) StudentID,Name,Subject,Grade 
	from Students order by Grade desc;

	return ; 
end;

select * from dbo.GetTopStudents(2);

