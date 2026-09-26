use C21_DB1;

-- simple case statement

-------------------------------
print 'simple case statement on Employee table';

select EmployeeID,
case DepartmentID
	when 1 then 'Engineering'
	when 2 then 'HR'
	when 3 then 'Sales'
	else 'Other'
end as DepartmentName
from Employees;
