CREATE TABLE [medical_center].[medical_center] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] int,
  [nif] int,
  [address] nvarchar(255),
  [adress2] nvarchar(255),
  [city] nvarchar(255),
  [country] nvarchar(255)
)


SET IDENTITY_INSERT medical_center.medical_center.[medical_center] ON;

insert into medical_center.medical_center.[medical_center] 
(id, full_name, email,phone_number, nif, address, adress2, city, country) 
values 
(1, 'Hospital das Enguardas', 'hospitalenguardas@gmail.com','914662172','508963150','Rua das Flores','nº323','Porto','Portugal');
GO


ALTER TABLE [medical_center].[patient] ADD FOREIGN KEY ([medical_center_id]) REFERENCES [medical_center].[medical_center] ([id])
GO
ALTER TABLE [medical_center].[reception] ADD FOREIGN KEY ([medical_center_id]) REFERENCES [medical_center].[medical_center] ([id])
GO
ALTER TABLE [medical_center].[doctor] ADD FOREIGN KEY ([medical_center_id]) REFERENCES [medical_center].[medical_center] ([id])
GO



ALTER TABLE medical_center.medical_center.reception
ADD medical_center_id INTEGER NOT NULL
CONSTRAINT CONSTRAINT_MEDICAL DEFAULT '1'
WITH VALUES;

ALTER TABLE medical_center.medical_center.doctor
ADD medical_center_id INTEGER NOT NULL
CONSTRAINT CONSTRAINT_MEDICAL_CENTER_DOCTOR DEFAULT '1'
WITH VALUES;

ALTER TABLE medical_center.medical_center.patient
ADD medical_center_id INTEGER NOT NULL
CONSTRAINT CONSTRAINT_MEDICAL_CENTER_PATIEN DEFAULT '1'
WITH VALUES;

