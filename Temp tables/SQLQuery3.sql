-- variable table 

declare @EmployeeT table
(
	ID int,
	Name varchar(20),
	Department varchar(20)
);

insert into @EmployeeT (ID,Name,Department) values (1, 'Carlos' , 'Engineering');
insert into @EmployeeT (ID,Name,Department) values (2, 'Aloha' , 'Sales'); 
insert into @EmployeeT (ID,Name,Department) values (3, 'Koda' , 'bet'); 
insert into @EmployeeT (ID,Name,Department) values (4, 'Ricardo' , 'Manegement'); 

declare @DepartmentName varchar(30);
set @DepartmentName = (select Department from @EmployeeT where ID = 1);
print @DepartmentName 
select * from @EmployeeT