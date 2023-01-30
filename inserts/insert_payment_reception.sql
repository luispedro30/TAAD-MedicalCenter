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

select count(distinct cast(t.arrived_date as date)),
t.reception_id
from medical_center.ticket t
where CONVERT(DATE, t.arrived_date) between '2022-01-01' and '2022-01-31'
group by t.reception_id;