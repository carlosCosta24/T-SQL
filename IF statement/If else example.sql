use C21_DB1;
----------------------------
-- simple if else statement
print 'Simple if else statement: '
declare @A int;
declare @B int; 
declare @C int;

set @A = 20;
set @B = 30;
set @C = 40; 

if @A > @B 
	begin
		print 'A is greater than B';
	end
else
	begin
		print 'B is greater than A';
	end
print '---------------------'

------------------------------------
--nestetd if statement
print 'Nested if statement: '
print '---------------------'

if @A > @B
	begin
		print 'A is grater than B'
	end
else 
	begin
		if @B > @C
		begin
			print 'B is greater than C'
		end
	else
		begin 
			 Print 'C is greater than B'
			 end
	end
print '---------------------'

--using if with var && conditional assignment
print 'using if with var && conditional assignment'

declare @Adolescent int ;
declare @Adult int;
declare @LoanAmount int;
declare @Age int;

set @Age = 20;
set @Adolescent = 19;
	
	if @Adolescent >= @Age
		begin 
			print 'eligable for a small loan';
			set @LoanAmount = 1000;
			print 'Loan Amount is: ' + cast(@LoanAmount as varchar);
		end
	else
		begin
			print 'eligable for bigger loan';
			set @LoanAmount = 5000;
			print 'Loan Amount is: ' + cast(@LoanAmount as varchar);
		end
print '---------------------'
-- using if with and or not
print 'using if with and or not'

if(@Age >= 20 and @LoanAmount >= 5000)
	begin
		print 'Monthely payment for 5000 loan is : ' + cast((7500 / 12) as varchar);
	end
if(@Adolescent < 20 or @LoanAmount < 5000)
	begin 
		print 'Monthely payment for 1000 loan is: ' + cast((1500 / 12) as varchar);
	end
if not (@Age > 21)
	begin
		print 'Loan is garanted'
	end

print '---------------------'
-- Basic error handling
print 'Basic error handling'
	declare @ErrorValue int;
	insert into Employees (name) values ('carlos');
	set @ErrorValue = @@ERROR;
	if @ErrorValue <> 0
		begin 
			print 'Error occurred while excution:
			Error number: ' + cast(@ErrorValue as varchar)
		end
print '---------------------'
-- using if with exist
print 'using if with exist';

if exists (select * from Employees where Name = 'Emily Davis')
	begin
		print 'This employee exist'
	end
else
	begin
		print 'No employee with this nmae'
	end
