--use CTE to ranke sales 

with TotalSalesPerEmployee as 
(
	select EmployeeID, sum(SaleAmount) 
	as Total
	from SalesRecords 
	group by EmployeeID
),
RankingSales as 
(
	select EmployeeID,
	Total,
	rank() over (order by Total desc) as SalesRank
	from TotalSalesPerEmployee
)
select EmployeeID, Total from RankingSales; 