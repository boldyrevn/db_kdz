select * from doctor_appointment

go

-- first procedure --
-- считает количество принятых пациентов, начиная с какой-то даты, группируя по департаментам

create or alter procedure count_patients_by_department @start_date datetime as
select count(*) patients_count, dep.name department from doctor_appointment da 
join doctor d on da.doctor_id = d.doctor_id 
join department dep on d.department_id = dep.department_id
where da.date >= @start_date
group by dep.name
order by patients_count

go

exec count_patients_by_department '2023-01-04';
exec count_patients_by_department '2022-30-01';

go

-- second procedure --
-- добавляет услугу к счету пациента, открывает новый, если все имеющиеся закрыты

create or alter procedure add_patient_service @patient_id integer, @service_id integer as
begin
if not exists(select * from service where service_id = @service_id and price > 0)
	throw 50003, 'there is no paid service with such id', 0;
begin try
begin transaction;
	if not exists(select * from bill where patient_id = @patient_id and close_date is null)
		insert into bill(patient_id, open_date) values(@patient_id, GETDATE());
	declare @bill_id integer = (select top(1) bill_id from bill where patient_id = @patient_id and close_date is null);
	insert into bill_details(bill_id, service_id) values (@bill_id, @service_id);
	update bill set total_price = total_price + (select price from service where service_id = @service_id) where bill_id = @bill_id;
commit transaction;
end try
begin catch
	rollback transaction
end catch
end

go;

select * from service;

exec add_patient_service 7, 6;

select * from bill;
select * from bill_details;

go

-- third procedure --
-- выводит количество прооперированных пациентов, в т.ч. с осложнениями и с летальным исходом в определенном отделении

create or alter procedure count_surgeries @department_id integer as
begin
select dep.name department, count(*) general, 
sum(cast(s.is_complicated as int)) complicated, 
count(*) - sum(cast(s.is_successful as int)) lethal from surgery s 
join doctor d on s.doctor_id = d.doctor_id
join department dep on d.department_id = dep.department_id
where dep.department_id = @department_id
group by dep.name
end

go

exec dbo.count_surgeries 1;




