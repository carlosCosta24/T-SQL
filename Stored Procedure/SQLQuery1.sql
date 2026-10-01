--stored procedures

create procedure SP_AddPerson
	@Name varchar(50),
	@Email varchar(50),
	@Department varchar(20), 
	@PersonID int output
as 
begin
	insert into People (Name, Email, Department)
	values	(@Name, @Email,@Department);
	set @PersonID = SCOPE_IDENTITY();
end

-- excute SP

declare @ID int;
exec SP_AddPerson
	@Name = 'Costa',
	@Email = 'Costa.pen@gmail.com',
	@Department = 'Manegment',
	@PersonID = @ID output;
select @ID as NewPersonID;
