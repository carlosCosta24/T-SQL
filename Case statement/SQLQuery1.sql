use C21_DB1;

-- simple case statement

-------------------------------

select EmployeeID,
case DepartmentID
	when 1 then 'Engineering'
	when 2 then 'HR'
	when 3 then'Sales'
	else 'Other'
end as DepartmentName
from Employees;


-- Searched case statement

-------------------------------

select SaleID,SaleAmount,
 case 
	when saleAmount < 100 then 'week'
	when saleAmount between 101 and 200 then 'fare'
	when SaleAmount > 200 then 'good'
	end as SalesRanks
from Sales
-------------------------------
-- case statement with order by 

select * from Sales
order by 
	case when SaleAmount >= 300 then 1
	else 2
	 end, SaleID;
