use C21_DB1;

-- common string func

select len(Name) as NameLength from Employees;

select upper (Department) as Department from Employees2;

select lower (Department) as Department from Employees2;

select concat(Name , '-' , DepartmentID) as NameDep from Employees;

select concat (CustomerID , ' / ', upper(Name), ' / ' , LoyaltyPoints) as Summary from Customers;

-- Date func

select getdate() as TodayDate;

select sysdatetime() as SystemTime;

select dateadd(MONTH,2,getdate()) as DateAfter2Months; 

select dateadd(MONTH,-2,getdate()) as DateBefore2Months; 

select datepart(MONTH,getdate()) as NumberOfMonth;

select datename(MONTH,getdate()) as NameOfMonth;

select convert(varchar, getdate(), 103) as FormatedDate;

select cast(getdate() as date) as DateOnly;

select cast(getdate() as varchar) as DateOnly;

select datepart(day, eomonth(getdate()))  as EndOfCurrentMonth;

-- aggregate fun

select Department, count(*) as EmployeesCount 
from Employees2  group by Department; 

select Department, AVG(PerformanceRating) as AvaragePerformance
from Employees2 group by Department;

select max(Salary) as MaxSalary from Employees2 ;

select min(Salary) as MinSalary from Employees2 ;

select Department, sum(salary) as SumOfSalary from Employees2
group by Department;