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