use C21_DB1;
-- Recursive cte to built company hierarchy 

with PrintHierarchy as
(
	--select anchor member 
	select EmployeeID, ManagerID, Name, 
	cast(Name as nvarchar(max)) as Hierarchy, 1 as 'Level'
	from Employees7
	where ManagerID is null

	union all 

	select e.EmployeeID, e.ManagerID,e.Name,
	cast(ETH.Hierarchy + ' -> ' + e.Name as nvarchar(max)) as 'Hierarchy',
	ETH.Level + 1 as Level from Employees7 e 
	inner join PrintHierarchy ETH on e.ManagerID = ETH.EmployeeID

)
select * from PrintHierarchy 
order by Hierarchy;