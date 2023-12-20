insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (1, 'Tabb', 'Futty', 'Male', '21/02/1991', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (2, 'Haily', 'O''Cooney', 'Female', '27/01/2002', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (3, 'Audrie', 'Beade', 'Female', '28/06/1941', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (4, 'Amabelle', 'Sewart', 'Female', '18/06/1963', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (5, 'Ertha', 'Bartalini', 'Female', '14/04/1997', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (6, 'Sofie', 'Brizell', 'Female', '30/11/1966', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (7, 'Dyanna', 'Robroe', 'Female', '12/09/1994', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (8, 'Raimondo', 'Agnew', 'Male', '04/04/1958', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (9, 'Antin', 'Clubley', 'Male', '26/08/1983', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (10, 'Horatio', 'McDuffie', 'Male', '04/08/1995', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (11, 'Vic', 'Tibald', 'Male', '21/09/1955', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (12, 'Siffre', 'Lilian', 'Male', '26/03/1977', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (13, 'Jerrylee', 'Libbie', 'Female', '16/09/1962', 1);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (14, 'Remington', 'Alison', 'Male', '27/10/1987', 0);
insert into patient (patient_id, first_name, last_name, gender, birth_date, is_alive) values (15, 'Si', 'Yokley', 'Male', '24/08/2004', 0);

go

insert into department (department_id, name) values 
(1, 'surgical'),
(2, 'gynecological'),
(3, 'emergency'),
(4, 'pulmonological'),
(5, 'neurological')

go 

insert into doctor (doctor_id, first_name, last_name, department_id) values (1, 'Ines', 'Scorey', 3);
insert into doctor (doctor_id, first_name, last_name, department_id) values (2, 'Alisa', 'MacKonochie', 2);
insert into doctor (doctor_id, first_name, last_name, department_id) values (3, 'Wyndham', 'Syplus', 4);
insert into doctor (doctor_id, first_name, last_name, department_id) values (4, 'Monique', 'Zannotelli', 3);
insert into doctor (doctor_id, first_name, last_name, department_id) values (5, 'Evangelina', 'Jilliss', 3);
insert into doctor (doctor_id, first_name, last_name, department_id) values (6, 'Kori', 'Zisneros', 1);
insert into doctor (doctor_id, first_name, last_name, department_id) values (7, 'Lucita', 'Fifield', 5);
insert into doctor (doctor_id, first_name, last_name, department_id) values (8, 'Olva', 'LLelweln', 5);
insert into doctor (doctor_id, first_name, last_name, department_id) values (9, 'Giff', 'Steinor', 2);
insert into doctor (doctor_id, first_name, last_name, department_id) values (10, 'Antony', 'Kleinhausen', 5);

go

insert into room (room_id, capacity, department_id) values (262, 1, 1);
insert into room (room_id, capacity, department_id) values (128, 1, 1);
insert into room (room_id, capacity, department_id) values (103, 4, 3);
insert into room (room_id, capacity, department_id) values (218, 1, 4);
insert into room (room_id, capacity, department_id) values (104, 3, 1);
insert into room (room_id, capacity, department_id) values (247, 4, 5);
insert into room (room_id, capacity, department_id) values (113, 2, 2);
insert into room (room_id, capacity, department_id) values (57, 2, 5);
insert into room (room_id, capacity, department_id) values (364, 3, 4);
insert into room (room_id, capacity, department_id) values (386, 1, 5);

go

insert into service (service_id, name, type, price) values
(1, 'liver surgery', 'surgery', 0),
(2, 'therapist appointment', 'doctor', 0),
(6, 'nerve removal', 'surgery', 20000),
(3, 'blood general test', 'test', 0),
(4, 'urine test', 'test', 0),
(5, 'neurologist appointment', 'doctor', 2000),
(7, 'blood vitamins test', 'test', 10000),
(8, 'pleural punction', 'surgery', 0),
(9, 'pulmonologist appointment', 'doctor', 0)

go

insert into doctor_appointment (service_id, doctor_id, patient_id, date, treatment) values 
(10, 7, 5, '04-09-2023', 'antibiotic'),
(10, 6, 15, '14-05-2023', 'arbidol'),
(10, 8, 14, '19-09-2023', 'antibiotic'),
(10, 3, 1, '04-02-2022', 'arbidol'),
(10, 3, 10, '01-06-2023', 'tizin'),
(10, 9, 6, '13-04-2022', 'paracetamol'),
(10, 5, 11, '13-05-2022', 'paracetamol'),
(10, 9, 7, '23-05-2023', 'tizin'),
(10, 3, 10, '25-03-2023', 'tizin'),
(10, 5, 2, '11-05-2022', 'tizin'),
(10, 8, 2, '05-01-2023', 'arbidol'),
(10, 4, 5, '02-10-2022', 'paracetamol'),
(10, 4, 3, '22-04-2023', 'tizin'),
(10, 5, 6, '29-06-2022', 'paracetamol'),
(10, 4, 2, '23-03-2022', 'arbidol'),
(10, 2, 8, '08-08-2023', 'tizin'),
(10, 8, 7, '16-05-2023', 'paracetamol'),
(10, 8, 4, '17-12-2022', 'arbidol'),
(10, 7, 12, '16-06-2023', 'antibiotic'),
(10, 1, 12, '17-04-2023', 'paracetamol'),
(10, 10, 2, '31-08-2023', 'antibiotic'),
(10, 6, 11, '19-02-2023', 'paracetamol'),
(10, 2, 14, '04-06-2022', 'paracetamol'),
(10, 1, 10, '31-10-2023', 'paracetamol'),
(10, 4, 5, '11-07-2022', 'tizin'),
(10, 4, 11, '04-06-2023', 'paracetamol'),
(10, 5, 3, '30-03-2022', 'paracetamol'),
(10, 8, 5, '02-12-2022', 'paracetamol'),
(10, 9, 2, '25-11-2022', 'paracetamol'),
(10, 2, 8, '07-01-2023', 'arbidol')

go

insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (4, '23/11/2023', '16/12/2023', 57, 'tempus semper');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (4, '28/11/2023', null, 386, 'curae donec');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (15, '24/11/2023', null, 364, 'nunc');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (15, '23/11/2023', '16/12/2023', 386, 'est phasellus');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (2, '06/12/2023', '16/12/2023', 104, 'ipsum');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (14, '03/12/2023', '13/12/2023', 364, 'nonummy maecenas');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (6, '07/12/2023', '14/12/2023', 103, 'quis');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (11, '23/11/2023', '16/12/2023', 113, 'pretium nisl');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (1, '02/12/2023', null, 386, 'ipsum primis');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (10, '02/12/2023', '16/12/2023', 364, 'sapien iaculis');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (10, '04/12/2023', '14/12/2023', 364, 'nulla');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (5, '30/11/2023', '19/12/2023', 218, 'cursus');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (6, '28/11/2023', '17/12/2023', 386, 'platea dictumst');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (2, '28/11/2023', '17/12/2023', 386, 'dis');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (12, '06/12/2023', '15/12/2023', 386, 'lacus');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (4, '24/11/2023', null, 104, 'praesent lectus');
insert into stay (patient_id, start_date, end_date, room_id, diagnosis) values (6, '04/12/2023', '16/12/2023', 364, 'maecenas leo');

select * from stay