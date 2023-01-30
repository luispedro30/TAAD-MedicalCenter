CREATE TABLE [DIM_day] (
  [sk_day] integer PRIMARY KEY,
  [date] datetime,
  [day_of_month_number] int,
  [day_of_year_number] int,
  [day_of_week_name] varchar(12),
  [day_of_week_number] int,
  [month_name] varchar(20),
  [short_month] char(3),
  [month_number] int,
  [year_number] int,
  [half_of_year_number] int,
  [semester] int,
  [trimester] int
)
GO

CREATE TABLE [DIM_hour] (
  [sk_hour] integer PRIMARY KEY,
  [supposed_arrival] datetime,
  [supposed_departure] datetime,
  [real_arrival] datetime,
  [real_departure] datetime,
  [hour_12h] varchar(4),
  [hour_24h] varchar(4),
  [hour_desc] varchar(4),
  [hour_type] varchar(4)
)
GO

CREATE TABLE [DIM_patient] (
  [sk_patient] integer PRIMARY KEY,
  [first_name] varchar(80),
  [last_name] varchar(80),
  [email] varchar(60),
  [gender] varchar(4),
  [occupation] varchar(60),
  [insurance_designation] varchar(60),
  [insurance_percentage] float,
  [free] bit,
  [height] float,
  [weight] float,
  [ssn] integer,
  [phone_number] integer,
  [age] integer
)
GO

CREATE TABLE [DIM_doctor] (
  [sk_doctor] integer PRIMARY KEY,
  [first_name] varchar(80),
  [last_name] varchar(80),
  [email] varchar(60),
  [gender] varchar(4),
  [ssn] integer,
  [phone_number] integer,
  [age] integer
)
GO

CREATE TABLE [DIM_medical_center] (
  [sk_medical_center] integer PRIMARY KEY,
  [name] varchar(50),
  [address] varchar(200),
  [postal_code] varchar(10),
  [district] varchar(80),
  [city] varchar(80)
)
GO

CREATE TABLE [FACT_appointment] (
  [sk_day] integer,
  [sk_hour] integer,
  [sk_patient] integer,
  [sk_doctor] integer,
  [sk_medical_center] integer,
  [sk_payment] integer,
  [sk_prescription] integer,
  [delay] integer,
  [appointment_id] integer
)
GO

CREATE TABLE [DIM_payment] (
  [sk_payment] integer PRIMARY KEY,
  [amount] float,
  [date_Payment] datetime
)
GO

CREATE TABLE [DIM_prescription] (
  [sk_prescription] integer PRIMARY KEY,
  [drug] varchar(100),
  [quantity] integer,
  [dose] varchar(100),
  [company] varchar(100)
)
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Poderíamos incluir mais atributos. Este conjunto representa apenas um exemplo.',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'DIM_day';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'de janeiro a junho toma o valor de 1, de julho a dezembro toma o valor de 2',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'DIM_day',
@level2type = N'Column', @level2name = 'half_of_year_number';
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_day]) REFERENCES [DIM_day] ([sk_day])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_hour]) REFERENCES [DIM_hour] ([sk_hour])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_doctor]) REFERENCES [DIM_doctor] ([sk_doctor])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_patient]) REFERENCES [DIM_patient] ([sk_patient])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_medical_center]) REFERENCES [DIM_medical_center] ([sk_medical_center])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_payment]) REFERENCES [DIM_payment] ([sk_payment])
GO

ALTER TABLE [FACT_appointment] ADD FOREIGN KEY ([sk_prescription]) REFERENCES [DIM_prescription] ([sk_prescription])
GO


DROP DATABASE DataWarehouseMedicalCenter;