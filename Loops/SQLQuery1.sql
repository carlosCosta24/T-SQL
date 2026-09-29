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
-----------------------------------
--Matrix using Nested while loop 
-----------------------------------
declare @Header varchar(255);
declare @RowHeader varchar(255);
declare @MRow int = 1;
declare @MColumn int;
declare @MResult int;

set @Header = char(9);
set @MColumn = 1;
	while  @MColumn <= 10
		begin
			set @Header = @Header + cast(@MColumn as varchar) + char(9);
			set @MColumn = @MColumn +1;
		end
		print @Header
	while @MRow <= 10
		begin
			set @MColumn = 1;
			set @RowHeader = cast(@MRow as varchar) + char(9);
			while @MColumn <= 10
				begin 
					set @MResult = @MRow * @MColumn;
					set @RowHeader = @RowHeader + cast(@MResult as varchar) + char(9);
					set @MColumn = @MColumn +1;
				end
				print @RowHeader;
				set @MRow = @MRow +1;
				end
-----------------------------------
--Break and continue  
-----------------------------------

declare @BreakCounter int = 0

while @BreakCounter <= 10
	begin 
		if @BreakCounter = 5 
		break;
		print cast(@BreakCounter as varchar);
		set @BreakCounter = @BreakCounter + 1;
	end 

	declare @ContinueCounter int = 0;
	while @ContinueCounter <= 10
	begin 
		set @ContinueCounter = @ContinueCounter+ 1;
		if @ContinueCounter % 2 = 0 
		begin
			continue;
		end
		print 'Counter: ' + cast(@ContinueCounter as varchar);
	end 
	