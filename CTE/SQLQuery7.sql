--Calculate Avg sales for top SalesEmployee using CTE
use C21_DB1;

with TotalSales as 
(
	select EmployeeID, 
	sum(SaleAmount) As TotalSales
	from SalesRecords
	group by EmployeeID 
),
TopEmployees as 
(
	select top 3 EmployeeID, TotalSales from TotalSales
	order by TotalSales desc
) 
select avg(TotalSales) as AvgSales 
from TopEmployees;