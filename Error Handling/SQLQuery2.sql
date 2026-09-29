-- try catch block

use C21_DB1

begin try

	insert into Employees3 (EmployeeID, Name, Position) VALUES (1, 'John Doe', 'Sales Manager');
	insert into Employees3 (EmployeeID, Name, Position) VALUES (1, 'Ricardo John', 'Markting Manager');
end try 
begin catch
	
	print 'An error occurred: ' + error_message();
end catch