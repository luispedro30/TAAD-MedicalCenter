use Dw_Medical_Center;

--Povoamento inicial
--DELETE FROM [Dw_Medical_Center].[Integration].[ETL_Cutoffs]
--WHERE ID != 1;

use medical_center;

--Incremental
SET IDENTITY_INSERT medical_center.medical_center.doctor OFF;
SET IDENTITY_INSERT medical_center.medical_center.doctor ON;
insert into medical_center.medical_center.doctor (id, gender, full_name, email, age, phone_number, ssn) values (11, 'M', 'Carlos Aguiar', 'carlosaguiar@gmail.com', 43, 913667228, 476456773);
SET IDENTITY_INSERT medical_center.medical_center.doctor OFF;

SET IDENTITY_INSERT medical_center.medical_center.reception OFF;
SET IDENTITY_INSERT medical_center.medical_center.reception ON;
insert into medical_center.medical_center.reception (id, gender, full_name, age, email, phone_number, ssn) values (15, 'M', 'Pedro Silva', 42, 'pedroSilva@gmail.com', 911423434, 489454733);
SET IDENTITY_INSERT medical_center.medical_center.reception OFF;

