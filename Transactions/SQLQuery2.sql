--transactions
use C21_DB1;

begin transaction
	begin try 
		update Accounts set Balance = Balance - 100 where AccountID = 1;

		update Accounts set Balance = Balance + 100 where AccountID = 2;

		insert into Transactions (FromAccount, ToAccount, Amount, Date) values (1 , 2, 100, GETDATE());

		commit
	end try
	begin catch
		rollback
	end catch

	select * from Accounts;

		
