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
