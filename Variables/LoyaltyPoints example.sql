use C21_DB1;

declare @CustomerID int;
declare @PointsEarned int;
declare @TotalPoints int;
declare @TotalSpent decimal (10,2);
declare @CurrentYear int =  year(getdate());
declare @CustomerName varchar(20);

set @CustomerID = 1;

select @CustomerName = Name from Customers where CustomerID = @CustomerID;

select @TotalSpent = sum(Amount) 
from Purchases 
where CustomerID = @CustomerID
and year(PurchaseDate) = @CurrentYear;

select @TotalPoints = LoyaltyPoints from Customers 
where CustomerID = @CustomerID;

set @PointsEarned = cast(@TotalSpent / 10 as int);

update Customers 
set LoyaltyPoints = LoyaltyPoints + @PointsEarned 
where CustomerID = @CustomerID;

print 'Loyalty Points for customer: ' + @CustomerName;
print 'Total Spent in year ' + cast(@CurrentYear as varchar) + ' : '+ cast(@TotalSpent as varchar);
print 'Loyalty points earned: ' + cast (@PointsEarned as varchar);
print 'Total points earned: ' + cast (@TotalPoints as varchar);

select * from Customers;

