use medical_center;

ALTER TABLE medical_center.reception
ADD
SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
CONSTRAINT DF_SysStart DEFAULT SYSUTCDATETIME()
, SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
CONSTRAINT DF_SysEnd DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime);

CREATE SCHEMA History;

ALTER TABLE medical_center.patient
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = History.reception));

ALTER TABLE medical_center.patient
ADD
SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
CONSTRAINT DF_SysStartPatient DEFAULT SYSUTCDATETIME()
, SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
CONSTRAINT DF_SysEndPatient DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime);

select * from medical_center.patient;
select * from History.patient;

ALTER TABLE medical_center.patient
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = History.patient));



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
      ,[medical_center_id]
      ,[SysStartTime]
      ,[SysEndTime]
      ,[last_update]
FROM medical_center.patient
WHERE SysStartTime > @start AND SysStartTime < @end
UNION ALL
SELECT  [id]
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
      ,[medical_center_id]
      ,[SysStartTime]
      ,[SysEndTime]
      ,[last_update]
FROM [History].patient
WHERE SysStartTime < @end AND SysEndTime > @start;
