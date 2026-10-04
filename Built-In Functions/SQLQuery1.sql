use C21_DB1;

-- common string func

select len(Name) as NameLength from Employees;

select upper (Department) as Department from Employees2;

select lower (Department) as Department from Employees2;

select concat(Name , '-' , DepartmentID) as NameDep from Employees;

select concat (CustomerID , ' / ', upper(Name), ' / ' , LoyaltyPoints) as Summary from Customers;



