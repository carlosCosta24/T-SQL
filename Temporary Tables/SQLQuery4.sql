-- temperary table 
-- Local temp table start with #, global ##
create table #EmployeeTT 
(
	ID int,
	Name varchar(50),
	Rank varchar(20),
	Department varchar(50)
);

insert into #EmployeeTT (ID, Name, Rank, Department) values (1, 'Carlos', 'Junior' , 'Engineering');
insert into #EmployeeTT (ID, Name, Rank, Department) values (2, 'Edwardo', 'senior' , 'Engineering');
insert into #EmployeeTT (ID, Name, Rank, Department) values (3, 'Adriano', 'System architecture' , 'Engineering');


select * from #EmployeeTT;

drop table #EmployeeTT;