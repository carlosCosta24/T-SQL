-- cte 
use C21_DB1;

with SalesStaff as 
(
	select Name, Sales, Department from Employees6
	where Department = 'Sales'

)
select * from SalesStaff;


with SalesPerDepartment as
(
select Department, sum(Sales) as TotalSales from Employees6
group by Department
)

select * from SalesPerDepartment;
