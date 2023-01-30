CREATE DATABASE Dw_Medical_Center;

CREATE SCHEMA DSA;

CREATE TABLE [DSA].[reception] (
  [sk_reception] int PRIMARY KEY IDENTITY(1, 1),
  [id] int,
  [full_name] nvarchar(255),
  [age] int,
  [gender] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [ssn] nvarchar(255),
  [last_update] [datetime] NULL,
  [medical_center_id] int);
GO

CREATE TABLE [DSA].[ticket] (
  [sk_ticket] int PRIMARY KEY IDENTITY(1, 1),
  [id] int,
  [arrived_date] datetime,
  [call_date] datetime,
  [cancelled] bit,
  [cancelled_reason] nvarchar(255),
  [leave_date] datetime,
  [reception_id] int,
  [patient_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[doctor] (
  [sk_doctor] int PRIMARY KEY IDENTITY(1, 1),
  [id] int,  [full_name] nvarchar(255),
  [age] int,
  [gender] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [ssn] nvarchar(255),
  [last_update] [datetime] NULL,
  [medical_center_id] int);
GO

CREATE TABLE [DSA].[patient] (
  [sk_patient] int PRIMARY KEY IDENTITY(1, 1),
  [id] int,
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
  [insurance_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[insurance] (
  [sk_insurance] int PRIMARY KEY IDENTITY(1, 1),
  [company_id] int,
  [company_name] nvarchar(255),
  [phone_number] nvarchar(255),
  [percentage] float,
  [country] nvarchar(255),
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[appointment] (
  [sk_appointment] int PRIMARY KEY IDENTITY(1, 1),
  [appointment_id] int,
  [start_date] datetime,
  [end_date] datetime,
  [reception_id] int,
  [doctor_id] int,
  [patient_id] int,
  [total_amount] int,
  [original_start_date] datetime,
  [original_end_date] datetime,
  [diagnosis_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[payment] (
  [sk_payment] int PRIMARY KEY IDENTITY(1, 1),
  [payment_id] int,
  [data] datetime,
  [reception_id] int,
  [patient_id] int,
  [appointment_id] int,
  [amount] float,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[diagnosis] (
  [sk_diagnosis] int PRIMARY KEY IDENTITY(1, 1),
  [diagnosis_id] int ,
  [category] nvarchar(255),
  symptoms nvarchar(max),
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[prescription] (
  [sk_prescription] int PRIMARY KEY IDENTITY(1, 1),
  [prescription_id] int,
  [patient_id] int,
  [prescription_date] date,
  [description] nvarchar(255),
  [amount] float,
  [appointment_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[medicine] (
  [sk_medicine] int PRIMARY KEY IDENTITY(1, 1),
  [medicine_id] int,
  [substance] nvarchar(255),
  [medicine_name] nvarchar(255),
  [taking_form] nvarchar(255),
  [dose] nvarchar(255),
  [brand] nvarchar(255),
  [generic] bit,
  [comercialization] nvarchar(255),
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[prescribe_medicine] (
  [sk_prescribe_medicine] int PRIMARY KEY IDENTITY(1, 1),
  [prescribe_medicine_id] int,
  [medicine_id] int,
  [prescription_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[paycheck_doctor] (
  [sk_paycheck_doctor] int PRIMARY KEY IDENTITY(1, 1),
  [paycheck_doctor_id] int,
  [salary] float,
  [bonus] float,
  [total_payment] float,
  [date_payment] datetime,
  [doctor_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[paycheck_reception] (
  [sk_paycheck_reception] int PRIMARY KEY IDENTITY(1, 1),
  [paycheck_reception_id] int,
  [salary] float,
  [bonus] float,
  [total_payment] float,
  [date_payment] datetime,
  [reception_id] int,
  [last_update] [datetime] NULL);
GO

CREATE TABLE [DSA].[medical_center] (
  [sk_medical_center] int PRIMARY KEY IDENTITY(1, 1),
  [id] int,
  [full_name] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] int,
  [nif] int,
  [address] nvarchar(255),
  [adress2] nvarchar(255),
  [city] nvarchar(255),
  [country] nvarchar(255),
  [last_update] [datetime] NULL);


