use C21_DB1;

-- stored procedure to create a dynamic sql query 

alter procedure SP_DynamicSelect
	@TableName nvarchar(20)
as begin
	declare @Query nvarchar(max);
	select @Query = 'select * from ' + @TableName;
	exec (@Query);
end

-- execute procedure

declare @Name nvarchar(20) = 'Students';
declare @Result int;

exec @Result = SP_DynamicSelect
@Name;

create procedure SP_DynamicSlect2
@TName nvarchar(20)
as begin
	declare @SQL nvarchar(max);
	set @SQL = N'select * from ' + quotename(@TName);
	exec sp_executesql @SQL;
	end

exec SP_DynamicSlect2 'Students';