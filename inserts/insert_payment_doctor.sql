select count(distinct cast(t.start_date as date)),
t.doctor_id
from medical_center.appointment t
where CONVERT(DATE, t.start_date) between '2022-01-01' and '2022-01-31'
group by t.doctor_id;

SET IDENTITY_INSERT medical_center.medical_center.paycheck_doctor ON;

INSERT INTO medical_center.medical_center.paycheck_doctor (paycheck_id, salary, bonus, total_payment, date_payment, doctor_id) 
VALUES ('1', '3000', '0', '3000', '2022-01-28 00:00:00.740', '1');
INSERT INTO medical_center.medical_center.paycheck_doctor (paycheck_id, salary, bonus, total_payment, date_payment, doctor_id)  
VALUES ('2', '3500', '500', '4000', '2022-01-28 00:00:00.740', '2');
INSERT INTO medical_center.medical_center.paycheck_doctor (paycheck_id, salary, bonus, total_payment, date_payment, doctor_id) 
VALUES ('3', '3000', '600', '3600', '2022-01-28 00:00:00.740', '3');
INSERT INTO medical_center.medical_center.paycheck_doctor (paycheck_id, salary, bonus, total_payment, date_payment, doctor_id) 
VALUES ('4', '2900', '100', '3000', '2022-01-28 00:00:00.740', '4');
INSERT INTO medical_center.medical_center.paycheck_doctor (paycheck_id, salary, bonus, total_payment, date_payment, doctor_id) 
VALUES ('5', '2000', '100', '2100', '2022-01-28 00:00:00.740', '5');

select * from medical_center.doctor;