update medical_center.ticket
set leave_date = Null;


delete from medical_center.prescription where appointment_id = 0;
delete from medical_center.appointment where appointment_id = 0;
delete from medical_center.payment where appointment_id = 0;

UPDATE medical_center.appointment
SET original_end_date = DATEADD(MINUTE,30,original_start_date);

UPDATE medical_center.appointment
SET end_date = DATEADD(MINUTE,30,original_start_date);

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE medical_center.updateDates
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
SET NOCOUNT ON;
	UPDATE  medical_center.appointment SET start_date = DATEADD(MINUTE, FLOOR(RAND()*(10-2+1)+2),original_start_date);
END;
GO


DECLARE @CursorTestID INT;
 
DECLARE CUR_TEST CURSOR FAST_FORWARD FOR
    SELECT medical_center.appointment.appointment_id
    FROM   medical_center.appointment
    ORDER BY medical_center.appointment.appointment_id;
 
OPEN CUR_TEST
FETCH NEXT FROM CUR_TEST INTO @CursorTestID
 
WHILE @@FETCH_STATUS = 0
BEGIN
   UPDATE medical_center.appointment
   set start_date = DATEADD(MINUTE, FLOOR(RAND()*(10-2+1)+2),original_start_date),
		end_date = DATEADD(MINUTE,FLOOR(RAND()*(10-2+1)+2),original_end_date)
   WHERE medical_center.appointment.appointment_id = @CursorTestID;

   FETCH NEXT FROM CUR_TEST INTO @CursorTestID
END
CLOSE CUR_TEST
DEALLOCATE CUR_TEST
GO

select * from medical_center.appointment;

update medical_center.payment 
set data = (select end_date from medical_center.appointment where medical_center.payment.appointment_id = medical_center.appointment.appointment_id);

update medical_center.appointment
set total_amount = 10;

update medical_center.payment
set amount = (select total_amount from medical_center.appointment where medical_center.appointment.appointment_id = medical_center.payment.appointment_id)
			+ (select amount from medical_center.prescription where medical_center.payment.appointment_id = medical_center.prescription.appointment_id);

update medical_center.payment
set amount = 0
where patient_id in (select id from medical_center.patient where free = '1');