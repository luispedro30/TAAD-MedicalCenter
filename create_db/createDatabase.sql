drop database medical_center;
create database medical_center;

use medical_center;

CREATE SCHEMA [medical_center];
GO


CREATE TABLE [medical_center].[reception] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(255),
  [age] int,
  [gender] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [ssn] nvarchar(255),
  [create_date] datetime Default current_timestamp,
  [update_date] datetime Default current_timestamp on update current_timestamp
)
GO

CREATE TABLE [medical_center].[ticket] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [number] int,
  [arrived_date] datetime,
  [call_date] datetime,
  [cancelled] bit,
  [cancelled_reason] nvarchar(255),
  [leave_date] datetime,
  [reception_id] int,
  [patient_id] int
)
GO

CREATE TABLE [medical_center].[doctor] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(255),
  [age] int,
  [gender] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [ssn] nvarchar(255)
)
GO

CREATE TABLE [medical_center].[patient] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(255),
  [age] nvarchar(255),
  [weight] float,
  [height] float,
  [phone_number] nvarchar(255),
  [email] nvarchar(255),
  [ssn] nvarchar(255),
  [gender] nvarchar(255),
  [free] bit,
  [adress] nvarchar(255),
  [occupation] nvarchar(255),
  [doctor_id] int,
  [insurance_id] int
)
GO

CREATE TABLE [medical_center].[insurance] (
  [company_id] int PRIMARY KEY IDENTITY(1, 1),
  [company_name] nvarchar(255),
  [phone_number] nvarchar(255),
  [percentage] float,
  [country] nvarchar(255)
)
GO

CREATE TABLE [medical_center].[appointment] (
  [appointment_id] int PRIMARY KEY IDENTITY(1, 1),
  [start_date] datetime,
  [end_date] datetime,
  [reception_id] int,
  [doctor_id] int,
  [patient_id] int,
  [total_amount] int,
  [original_start_date] datetime,
  [original_end_date] datetime,
  [diagnosis_id] int
)
GO

CREATE TABLE [medical_center].[payment] (
  [payment_id] int PRIMARY KEY IDENTITY(1, 1),
  [data] datetime,
  [reception_id] int,
  [patient_id] int,
  [appointment_id] int,
  [amount] float
)
GO

CREATE TABLE [medical_center].[diagnosis] (
  [diagnosis_id] int PRIMARY KEY IDENTITY(1, 1),
  [category] nvarchar(255),
  symptoms nvarchar(max)
)
GO

CREATE TABLE [medical_center].[prescription] (
  [prescription_id] int PRIMARY KEY IDENTITY(1, 1),
  [patient_id] int,
  [prescription_date] date,
  [description] nvarchar(255),
  [amount] float,
  [appointment_id] int
)
GO

CREATE TABLE [medical_center].[medicine] (
  [medicine_id] int PRIMARY KEY IDENTITY(1, 1),
  [substance] nvarchar(255),
  [medicine_name] nvarchar(255),
  [taking_form] nvarchar(255),
  [dose] nvarchar(255),
  [brand] nvarchar(255),
  [generic] bit,
  [comercialization] nvarchar(255)
)
GO

CREATE TABLE [medical_center].[prescribe_medicine] (
  [prescribe_medicine_id] int PRIMARY KEY IDENTITY(1, 1),
  [medicine_id] int,
  [prescription_id] int
)
GO

CREATE TABLE [medical_center].[paycheck_doctor] (
  [paycheck_id] int PRIMARY KEY IDENTITY(1, 1),
  [salary] float,
  [bonus] float,
  [total_payment] float,
  [date_payment] datetime,
  [doctor_id] int
)
GO

CREATE TABLE [medical_center].[paycheck_reception] (
  [paycheck_id] int PRIMARY KEY IDENTITY(1, 1),
  [salary] float,
  [bonus] float,
  [total_payment] float,
  [date_payment] datetime,
  [reception_id] int
)
GO

ALTER TABLE [medical_center].[ticket] ADD FOREIGN KEY ([reception_id]) REFERENCES [medical_center].[reception] ([id])
GO

ALTER TABLE [medical_center].[ticket] ADD FOREIGN KEY ([patient_id]) REFERENCES [medical_center].[patient] ([id])
GO

ALTER TABLE [medical_center].[patient] ADD FOREIGN KEY ([doctor_id]) REFERENCES [medical_center].[doctor] ([id])
GO

ALTER TABLE [medical_center].[patient] ADD FOREIGN KEY ([insurance_id]) REFERENCES [medical_center].[insurance] ([company_id])
GO

ALTER TABLE [medical_center].[appointment] ADD FOREIGN KEY ([reception_id]) REFERENCES [medical_center].[reception] ([id])
GO

ALTER TABLE [medical_center].[appointment] ADD FOREIGN KEY ([doctor_id]) REFERENCES [medical_center].[doctor] ([id])
GO

ALTER TABLE [medical_center].[appointment] ADD FOREIGN KEY ([patient_id]) REFERENCES [medical_center].[patient] ([id])
GO

ALTER TABLE [medical_center].[appointment] ADD FOREIGN KEY ([diagnosis_id]) REFERENCES [medical_center].[diagnosis] ([diagnosis_id])
GO

ALTER TABLE [medical_center].[prescription] ADD FOREIGN KEY ([appointment_id]) REFERENCES [medical_center].[appointment] ([appointment_id])
GO

ALTER TABLE [medical_center].[payment] ADD FOREIGN KEY ([reception_id]) REFERENCES [medical_center].[reception] ([id])
GO

ALTER TABLE [medical_center].[payment] ADD FOREIGN KEY ([patient_id]) REFERENCES [medical_center].[patient] ([id])
GO

ALTER TABLE [medical_center].[payment] ADD FOREIGN KEY ([appointment_id]) REFERENCES [medical_center].[appointment] ([appointment_id])
GO

ALTER TABLE [medical_center].[prescription] ADD FOREIGN KEY ([patient_id]) REFERENCES [medical_center].[patient] ([id])
GO

ALTER TABLE [medical_center].[prescribe_medicine] ADD FOREIGN KEY ([medicine_id]) REFERENCES [medical_center].[medicine] ([medicine_id])
GO

ALTER TABLE [medical_center].[prescribe_medicine] ADD FOREIGN KEY ([prescription_id]) REFERENCES [medical_center].[prescription] ([prescription_id])
GO

ALTER TABLE [medical_center].[paycheck_doctor] ADD FOREIGN KEY ([doctor_id]) REFERENCES [medical_center].[doctor] ([id])
GO

ALTER TABLE [medical_center].[paycheck_reception] ADD FOREIGN KEY ([reception_id]) REFERENCES [medical_center].[reception] ([id])
GO
