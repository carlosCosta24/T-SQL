use C21_DB1;

--create insert after trigger on student table 
create trigger TRG_StudentInsert on Students
after insert
as begin
	insert into InsertLog (StudentID, Name, Subject,Grade)
	select StudentID, Name, Subject, Grade from inserted;
end

--execute insert statement on student table 

insert into Students (StudentID,Name, Subject, Grade) values (10,'Carlos', 'Math', 99);

select * from InsertLog;


-- create update trigger 

create trigger TRG_StudentUpdateLog on Students
after update 
as begin 
	if UPDATE(Grade)
	begin
		insert into StudentsUpdate(StudentID, OldGrade, NewGrade)
		select i.StudentID, d.Grade as OldGrade, i.Grade as NewGrade 
		from inserted i
		inner join deleted d on i.StudentID = d.StudentID;
	end
end

select * from Students;

update Students set Grade = 99 where StudentID = 5;

select * from StudentsUpdate;