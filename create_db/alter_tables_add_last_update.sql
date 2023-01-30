ALTER TABLE medical_center.reception
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.appointment
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.doctor
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.insurance
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.medical_center
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.medicine
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.patient
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.paycheck_doctor
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.paycheck_reception
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.payment
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.prescribe_medicine
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.prescription
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.ticket
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE medical_center.diagnosis
ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Select from table


UPDATE medical_center.reception
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.appointment
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.doctor
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.insurance
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.medicine
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.patient
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.paycheck_doctor
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.paycheck_reception
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.payment
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.prescribe_medicine
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.paycheck_doctor
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.prescription
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.reception
set last_update = '2022-01-01 00:00:00.737';

UPDATE medical_center.ticket
set last_update = '2022-01-01 00:00:00.737';



