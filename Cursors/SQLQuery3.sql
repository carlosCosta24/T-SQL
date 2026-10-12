-- Forward-only cursor 
use C21_DB1;

declare FC_EmployeesListing cursor static forward_only for 
select Name, PerformanceRating from Employees2;

open FC_EmployeesListing;

declare @Name nvarchar(20), @Rating int, @Status nvarchar(20);

fetch next from FC_EmployeesListing into @Name, @Rating;

while @@FETCH_STATUS = 0
	begin
		
		if @Rating < 80 
			begin
				set @Status = 'Need Performance Review';
			end
		else
			begin
				set @Status = 'Performing';
			end

		print 'Name: ' + @Name + ', Rate: ' + 
		cast(@Rating as nvarchar) + '% Current Performance Status:' + @Status ;

		fetch next from FC_EmployeesListing into @Name, @Rating;

	end

close FC_EmployeesListing;

deallocate FC_EmployeesListing; 