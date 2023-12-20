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

go

-- second function --
-- показывается текущую смертность в отделении

create or alter function department_mortality(@department_id integer) returns integer
as begin
return (
	select (1 - cast(sum(cast(is_successful as integer)) as decimal) / count(*)) * 100 
	from doctor doc join surgery s on doc.doctor_id = s.doctor_id
	where doc.department_id = @department_id
);
end

go

select dbo.department_mortality(1)


