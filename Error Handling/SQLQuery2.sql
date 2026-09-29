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


