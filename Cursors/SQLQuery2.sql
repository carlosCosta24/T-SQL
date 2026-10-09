--declare a dynamic cursor

declare DYC_PrintLiveData cursor dynamic for
select Name, Subject, Grade from Students;


--open cursor

open DYC_PrintLiveData

declare @Name nvarchar(20), @Subject nvarchar (25), @Grade int;

fetch next from DYC_PrintLiveData into @Name,@Subject,@Grade;

--loop over data and print it dynamically 
while @@fetch_status = 0
	begin 
		print 'Student Name: ' + @Name + ', Subject / Grade: ' + @Subject +'/' +cast(@Grade as nvarchar(20));

		fetch next from DYC_PrintLiveData into @Name, @Subject, @Grade;
	end

--close the cursor

close DYC_PrintLiveData;

--free memory 
deallocate DYC_PrintLiveData;
