use C21_DB1;
--create static cursor

declare STC_StaticStudentPrinter cursor static for 
select Name, Subject, Grade from Students;

--open the cursor

open STC_StaticStudentPrinter;

--declare local var to use into cursor
declare @Name nvarchar(20);
declare @Subject nvarchar(20);
declare @Grade int;

--extract first row 
fetch next from STC_StaticStudentPrinter into @Name, @Subject, @Grade;


--loop over cursor row by row
while 
@@FETCH_STATUS = 0
	begin 
		print 'Student Name: ' + @Name + ', Subject / Grade: ' + @Subject +'/' +cast(@Grade as nvarchar(20));

		fetch next from STC_StaticStudentPrinter into @Name, @Subject, @Grade;

	end
--close and free memory 
	close STC_StaticStudentPrinter;

	deallocate STC_StaticStudentPrinter;
