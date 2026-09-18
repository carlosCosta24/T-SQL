use C21_DB1;

declare @DepartmentID int;
declare @StartDate date;
declare @EndDate date;
declare @DepartmentName varchar(50);
declare @TotalEmployees int;

set @DepartmentID =3;
set @StartDate = '2023-1-1';
set @EndDate = '2023-12-31';

select @DepartmentName = Name from Departments where DepartmentID = @DepartmentID;

select @TotalEmployees = count(*) from Employees
where DepartmentID = @DepartmentID 
and HireDate between @StartDate and @EndDate;

print 'Report: ';
print 'Department Name ';
print 'Time Period ' + cast(@StartDate as varchar) + 'To' + cast (@EndDate as varchar);
print 'Total Employees Hired in ' + cast(year(@StartDate) as varchar) + ': ' + cast(@TotalEmployees as varchar); 
