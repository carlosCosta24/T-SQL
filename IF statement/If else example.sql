use C21_DB1;
----------------------------
-- simple if else statement
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
------------------------------------
--nestetd if statement

if 

