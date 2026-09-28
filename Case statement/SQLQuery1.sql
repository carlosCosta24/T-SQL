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

-------------------------------
-- case statement with Update
update Employees2 set Salary = 
	case 
		when PerformanceRating > 90 then Salary *1.15
		when PerformanceRating between 75 and 90 then Salary * 1.10
		when PerformanceRating between 50 and 74 then Salary * 1.05
		else Salary
		end;
-------------------------------
-- Nested case statement 

select Name, Department, Salary ,
	Bonus = case 
		when Department = 'IT' then
			case 
				when PerformanceRating > 90 then Salary * 1.20
				when PerformanceRating between 75 and 90 then Salary * 1.15
				else Salary
			end
		when Department = 'Marketing' then
			case 
				when PerformanceRating  > 90 then Salary * 1.10
				when PerformanceRating  between 75 and 90 then Salary * 1.05
			else Salary 
			end
		end
from Employees2
-------------------------------
-- case statement with group by 
select count(*) as NumberOfEmployees,
avg(Salary) as AvgSalaries,
Ranking from

(select Name, PerformanceRating, Salary,
	Ranking = case 
		when PerformanceRating > 90 then 'High'
		when PerformanceRating between 70 and 90 then 'Mediam'
		else 'Low'
		end
		from Employees2)
	as PerformanceCategory group by Ranking;
