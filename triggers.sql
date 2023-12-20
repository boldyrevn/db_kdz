-- first trigger --
-- проверяет, что у услуги установлена правильная категория и неотрицательная цена

create or alter trigger check_service on service after insert, update as
if exists(select * from service where type != 'test' and type != 'doctor' and type != 'surgery')
begin
rollback transaction;
throw 50001, 'service type must be one of: test, doctor, surgery', 0;
end;
if exists(select * from service where price < 0)
begin
rollback transaction;
throw 50002, 'service price can not be negative', 0;
end;

go 

insert into service (service_id, name, type, price) values 
(99, 'some test', 'idk', 0);

insert into service (service_id, name, type, price) values 
(100, 'some doctor', 'test', -5);

go

-- second trigger --
-- проверяет, что в комнатах нет переполнения и людей разного пола

create or alter trigger check_stay on stay after insert, update as
begin
if exists(
	select room_id from (select r.room_id, gender from room r join stay s on r.room_id = s.room_id
	join patient p on s.patient_id = p.patient_id
	where s.end_date is null
	group by r.room_id, gender) as t
	group by room_id
	having count(*) > 1
) begin
rollback transaction;
throw 50004, 'all people in one room must have same gender', 0;
end
if exists(
	select * from room_information 
	where capacity < current_count
) begin
rollback transaction;
throw 50005, 'room overflow', 0;
end
end

go

update stay set room_id = 104 where stay_id = 66;
update stay set room_id = 386 where stay_id = 80;
select * from stay
select * from room_information
select * from room




