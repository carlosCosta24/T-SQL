-- simple loop using while 
-----------------------------------
declare @Counter int;
set @Counter = 5;
	while @Counter >= 0
		begin
			print 'Counter is: ' + cast(@Counter as varchar)
			set @Counter = @Counter -1
		end
-----------------------------------
--using while to loop over a table 
-----------------------------------
use C21_DB1;
declare @EmployeeID int;
declare @Name varchar(30); 
declare @MaxID int;

Select @MaxID = max(EmployeeID) from Employees;
select @EmployeeID = min(EmployeeID) from Employees;


	while @EmployeeID is not null and @EmployeeID <= @MaxID
		begin
			select @Name = Name from Employees where EmployeeID = @EmployeeID;
			print @Name;

			select @EmployeeID =  min(EmployeeID) from Employees where EmployeeID > @EmployeeID;	
		end
-----------------------------------
--using while to loop with conditional exit
-----------------------------------

declare @Balance decimal(10,2);
declare @WithdrawAmount decimal(10,2);

set @Balance = 2550.52;
set @WithdrawAmount = 303.75;

while @Balance > 0
	begin 
		set @Balance = @Balance - @WithdrawAmount;
			if @Balance < 303.75
				begin
					print 'Insufficent fund, your balance is: ' + cast(@Balance as varchar);
					break;
				end
			else 
				print 'Your New Balace is: ' + cast(@Balance as varchar);
	end
-----------------------------------
--Nested while loop 
-----------------------------------
declare @Row int = 1;
declare @Column int;
declare @Result int;

	while @Row <= 10
		begin
			set @Column = 1;
			while @Column <= 10
				begin 
					set @Result = @Column * @Row;
					print cast(@Row as varchar) + '*' + cast(@Column as varchar) 
					+ '= ' + cast(@Result as varchar); 
					set @Column = @Column +1;
				end
				set @Row = @Row +1;
			end
