use C21_DB1;

--create instead of delete trigger

create trigger TRG_SoftDelete on Students
instead of delete
as begin 
	update Students set IsActive = 0 from Students s
	inner join deleted d on s.StudentID = d.StudentID;
end


-- test delete student with id = 4

select * from Students;
delete from Students where StudentID = 4;

--create instead of update trigger on view
use C21_DB1;

create trigger TRG_UpdateStudentView on StudentView
instead of update
as begin 
	
	update PersonalInfo set Name = I.name 
	from PersonalInfo inner join inserted I 
	on PersonalInfo.PersonID = I.PersonID

	update AcademicInfo set Subject = I.Subject, Grade = I.Grade
	from AcademicInfo inner join inserted I on AcademicInfo.PersonID = I.PersonID
	end

	-- test instead of update trigger 
	update StudentView set Name = 'Carlos' where PersonID = 2;

	select * from StudentView;

