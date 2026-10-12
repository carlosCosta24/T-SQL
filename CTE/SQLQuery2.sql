--Recursive cte


with Recursive_Counter as
(

	select 1 as Recursive_Counter 
	
	union all 

	select Recursive_Counter + 1 from Recursive_Counter where Recursive_Counter < 20

)
select * from Recursive_Counter;