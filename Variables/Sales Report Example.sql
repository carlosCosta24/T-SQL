use C21_DB1;

declare @Year int;
declare @Month int;
declare @TotalSales decimal(10,2);
declare @TotalTransactions int;
declare @AvgSales decimal(10,2);

set @Year = 2026;
set @Month = 6;

select @TotalSales = sum(SaleAmount) from Sales
where Year(SaleDate) = @Year 
and MONTH(SaleDate) = @Month;

select @TotalTransactions = count(*) from Sales where YEAR(SaleDate) = @Year
and MONTH(SaleDate) = @Month;

select @AvgSales = @TotalSales / @TotalTransactions;

print 'Sales Report: ';
print 'Time Period: ' + cast(@Year as varchar) + ', Month ' + cast(@Month as varchar);
print 'Total Sales: ' + cast(@TotalSales as varchar);
print 'Total Transactions: ' + cast(@TotalTransactions as varchar);
print 'Average Sales: ' + cast(@AvgSales as varchar);



