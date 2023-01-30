SET IDENTITY_INSERT medical_center.medical_center.doctor ON;

insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (1, 'M', 'Lourenço Ribeiro', 'lourençoribeiro@gmail.com', 62, 919151210, 455147095);
insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (2, 'M', 'João Freitas', 'joãofreitas@gmail.com', 65, 912945467, 968007947);
insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (3, 'F', 'Ana Gomes', 'anagomes@gmail.com', 64, 910262696, 483034090);
insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (4, 'F', 'Joana Nunes', 'joananunes@gmail.com', 52, 919434398, 425956610);
insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (5, 'F', 'Mariana Rodrigues', 'marianarodrigues@gmail.com', 28, 915913146, 966303011);

select * from medical_center.medical_center.doctor;