use C21_DB1;

-- use CTE to count Duplicates


with DuplicatesEmail as 
(
	select Email, 
	count(*) as Duplicate
	from Contacts 
	group by Email
	having count(*) > 1

)
select c.ContactID, c.Name, c.Email 
from Contacts c inner join DuplicatesEmail D
on c.Email = D.Email