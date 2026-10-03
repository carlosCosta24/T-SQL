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

-- create stored procedure to get all people

create procedure SP_GetAllPeople
as 
	begin 
	select * from People;
	end

exec SP_GetAllPeople;

-- create a stored procedure to get person by id 

create procedure SP_GetPersonByID
	 @PersonID int
as
	begin 
		select * from People where PersonID = @PersonID
	end

exec SP_GetPersonByID
	@PersonID = 1;
-- Another way to get person
alter procedure SP_GetPerson2

@ID int,
@Name varchar(50) output,
@Email varchar(50)output,
@Department varchar(20)output,
@IsFound bit output
as
	begin
		if exists (select 1 from People where PersonID = @ID)
		begin
			select 
				@Name = Name,
				@Email = Email,
				@Department = Department
				from People where PersonID = @ID;

				set @IsFound = 1 ;
		end
		else
		begin
			set @IsFound = 0
		end
	end
		
declare @RID int =1;
declare @RName varchar(20);
declare @REmail varchar(20);
declare @RDepartment varchar(20);
declare @Result bit;

exec SP_GetPerson2
	@ID = @RID,
	@Name = @RName output,
	@Email = @REmail output,
	@Department = @RDepartment output,
	@IsFound = @Result output;
	if @Result = 1
		select @RName as Name, @RID as ID, @RDepartment as DepartmentName;
	else
		print 'person does''t exist';
--create a stored procedure to update person info
alter procedure SP_UpdatePersonInfo
@UpdateID int,
@UpdateEmail varchar(50),
@UpdateName varchar(20),
@UpdateDepartment varchar(50)
as begin
	update People set Name = @UpdateName, Email = @UpdateEmail, 
	Department = @UpdateDepartment
	where PersonID = @UpdateID
end

--excute sp
exec SP_UpdatePersonInfo
@UpdateID = 1,
@UpdateName = 'Carlos costa',
@UpdateEmail = 'carloscosta.pen@gmail.com',
@UpdateDepartment = 'Engineering';

select * from People;

--stored procedure to delete person 
create procedure SP_DeletePerson
@IDKey int
as begin 
	delete from People where PersonID = @IDKey
end
	
--excute Stored procedure

exec SP_DeletePerson @IDKey = 2; 

