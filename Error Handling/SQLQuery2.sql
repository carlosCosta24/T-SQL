-- try catch block

use C21_DB1

begin try

	insert into Employees3 (EmployeeID, Name, Position) VALUES (1, 'John Doe', 'Sales Manager');
	insert into Employees3 (EmployeeID, Name, Position) VALUES (1, 'Ricardo John', 'Markting Manager');
end try 
begin catch
	
	print 'An error occurred: ' + error_message();
end catch
-----------------
--Error functions
declare @Counter int = 1;

begin try 
	set @Counter = @Counter /0;
end try 
begin catch
select 
	 error_number() as NumberOfError,
	 error_severity() as Severity,
	 error_state() as ErrorState,
	 error_procedure() as ProcedureName,
	 error_line() as ErrorLine,
	 error_message() as ErrorMessage;
end catch


-----------------
--Throw statement
	declare @NewStockQty int = -5;
	begin try 
		if @NewStockQty < 0
		throw 50001, 'Stock quantity can''t be negative',1 ;
		update Products set ProductQuantity = @NewStockQty where ProductID = 1;
	end try
	begin catch
		select 
			error_message() as ErrorMessage,
			ERROR_NUMBER() as NumberOfError;
	end catch

-------------------------------
-- @@error function
use C21_DB1;
insert into Departments (DepartmentID, Name) values (1, 'IT');
declare @ErrorNumber int = @@error;

if @ErrorNumber <> 0
	begin
		
		print 'An error ocured while excuting the previous query'
		print 'Error Number: ' + cast(@ErrorNumber as varchar);
	end

		
