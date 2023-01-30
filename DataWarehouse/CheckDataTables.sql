select * from DSA.appointment;
select * from DSA.diagnosis;
select * from DSA.doctor;
select * from DSA.insurance;
select * from DSA.medical_center;
select * from DSA.medicine;
select * from DSA.patient;
select * from DSA.payment;
select * from DSA.doctor;
select * from DSA.prescription;
select * from DSA.reception;
select * from DSA.ticket;

select * from Integration.ETL_Cutoffs;

select * from DSA.patient

DECLARE
@start AS DATETIME2(7)= ?,
@end AS DATETIME2(7)= ?;
SELECT [id]
,[full_name]
,[age]
,[weight]
,[height]
,[phone_number]
,[email]
,[ssn]
,[gender]
,[free]
,[adress]
,[occupation]
,[doctor_id]
,[insurance_id]
,[last_update]
,[SysStartTime]
,[SysEndTime]
FROM [medical_center].[patient]
WHERE SysStartTime > @start AND SysStartTime < @end
UNION ALL
SELECT [id]
,[full_name]
,[age]
,[weight]
,[height]
,[phone_number]
,[email]
,[ssn]
,[gender]
,[free]
,[adress]
,[occupation]
,[doctor_id]
,[insurance_id]
,[last_update]
,[SysStartTime]
,[SysEndTime]
FROM [medical_center].[patient]
WHERE SysStartTime < @end AND SysEndTime > @start;

