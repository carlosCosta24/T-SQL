-- Print Date series using recursive cte
declare @StartDate date = '2026-10-01';
declare @EndDate date = '2026-10-31';

with PrintDate as 
(
	-- anchor date 
	select @StartDate as DateValue

	union all

	select dateadd(DAY, 1, Datevalue) from PrintDate 
	where DateValue < @EndDate

)
select DateValue from PrintDate;