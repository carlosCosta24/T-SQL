use C21_DB1;

declare @ReportMonth int;
declare @ReportYear int;
declare @TotalDays int;
declare @EmployeeID int;
declare @AbsentDays int;
declare @LeaveDays int;
declare @PresentDays int;

set @ReportMonth = 7;
set @ReportYear = 2026;
set @EmployeeID = 101;

set @TotalDays = DAY(EOMONTH(DateFromParts(@ReportYear, @ReportMonth, 1)));

select @PresentDays = count(*) from EmployeeAttendance 
where EmployeeID = @EmployeeID and month(AttendanceDate) = @ReportMonth
and year(AttendanceDate) = @ReportYear and Status = 'Present';

select @AbsentDays = count(*) from EmployeeAttendance 
where EmployeeID = @EmployeeID and month(AttendanceDate) = @ReportMonth
and year(AttendanceDate) = @ReportYear and Status = 'Absent';

select @LeaveDays = count(*) from EmployeeAttendance 
where EmployeeID = @EmployeeID and month(AttendanceDate) = @ReportMonth
and year(AttendanceDate) = @ReportYear and Status = 'Leave';

print 'Employee Attendance Report:';
print 'Employee ID: ' + cast(@EmployeeID as varchar);
print 'Report Month: ' + cast(@ReportMonth as varchar) + '/' + cast(@ReportYear as varchar);
print 'Days Of Month: ' + cast(@TotalDays as varchar);
print 'Present Days: ' + cast(@PresentDays as varchar);
print 'Leave Days: ' + cast(@LeaveDays as varchar);
print 'Absent Days: ' + cast(@AbsentDays as varchar);

