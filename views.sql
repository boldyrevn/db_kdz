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

-- second view --
-- 