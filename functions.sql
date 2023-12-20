-- first function --
-- показывает среднее время пребывания в стационаре определенного отделения 

create function average_stay_time(@department_id integer) returns integer
as begin
declare @time integer = (
	select avg(datediff(d, s.start_date, s.end_date)) from stay s
	join room r on s.room_id = r.room_id
	join department d on r.department_id = d.department_id
	where d.department_id = @department_id
)
return @time
end

go

select d.name, dbo.average_stay_time(d.department_id) average_stay_time from department d


