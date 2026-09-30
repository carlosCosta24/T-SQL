--use @@rowcount to get number of affected rows
use C21_DB1;
update Employees set DepartmentID = 1 where DepartmentID = 3;
select @@ROWCOUNT as AffectedRows;
