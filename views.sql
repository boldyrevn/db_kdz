-- first view --
-- показывает историю выписанных пациентов 

create or alter view discharged_patients(patient_name, gender, start_date, end_date, diagnosis, department) as
select p.first_name + ' ' + p.last_name, gender, start_date, end_date, diagnosis, d.name from patient p 
join stay s on p.patient_id = s.patient_id
join room r on s.room_id = r.room_id
join department d on r.department_id = d.department_id
where s.end_date is not null

go

select * from discharged_patients;

go

-- second view --
-- показывает комнаты, их вместимость, текущее количество людей и их пол

create or alter view room_information(room_id, capacity, current_count, gender) as
select r.room_id, capacity, count(*) current_count, gender current_count from room r 
join stay s on r.room_id = s.room_id
join patient p on s.patient_id = p.patient_id
where s.end_date is null
group by r.room_id, capacity, gender

go

select * from room_information