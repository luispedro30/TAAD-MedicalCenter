select * from medical_center.doctor;
select * from medical_center.insurance;--percentagem para reduzir o valor
select * from medical_center.medicine;
select * from medical_center.patient;--free - se for 1 é isento e não paga
select * from medical_center.reception;
select * from medical_center.paycheck_reception;
select * from medical_center.ticket;
select * from medical_center.diagnosis;
select * from medical_center.paycheck_doctor
select * from medical_center.prescribe_medicine;
select * from medical_center.appointment;
select * from medical_center.prescription;
select * from medical_center.payment;
select * from medical_center.medical_center;



--5 Doctor, 35 medical_insurance, 17369 medicamentos, 300 pacientes, 5 rececionistas
--Funcionamento das 8 às 6

SET IDENTITY_INSERT medical_center.medical_center.paycheck_reception ON;

INSERT INTO medical_center.medical_center.paycheck_reception (paycheck_id, salary, bonus, total_payment, date_payment, reception_id) 
VALUES ('1', '750', '0', '750', '2022-01-28 00:00:00.740', '1');
INSERT INTO medical_center.medical_center.paycheck_reception (paycheck_id, salary, bonus, total_payment, date_payment, reception_id)  
VALUES ('2', '750', '250', '1000', '2022-01-28 00:00:00.740', '2');
INSERT INTO medical_center.medical_center.paycheck_reception (paycheck_id, salary, bonus, total_payment, date_payment, reception_id) 
VALUES ('3', '750', '0', '750', '2022-01-28 00:00:00.740', '3');
INSERT INTO medical_center.medical_center.paycheck_reception (paycheck_id, salary, bonus, total_payment, date_payment, reception_id) 
VALUES ('4', '750', '300', '1050', '2022-01-28 00:00:00.740', '4');
INSERT INTO medical_center.medical_center.paycheck_reception (paycheck_id, salary, bonus, total_payment, date_payment, reception_id) 
VALUES ('5', '750', '50', '800', '2022-01-28 00:00:00.740', '5');

select * from medical_center.ticket;


select count(distinct cast(t.arrived_date as date)),
t.reception_id
from medical_center.ticket t
where CONVERT(DATE, t.arrived_date) between '2022-01-01' and '2022-01-31'
group by t.reception_id;