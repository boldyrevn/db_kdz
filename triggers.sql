-- first trigger --

create trigger check_service on service after insert, update as
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
