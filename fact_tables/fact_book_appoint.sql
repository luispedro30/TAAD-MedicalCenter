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
  [arrival] datetime,
  [departure] datetime,
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
  [height] float,
  [weight] float,
  [ssn] integer,
  [phone_number] integer,
  [age] integer,
  [doctor_name] varchar(60)
)
GO

CREATE TABLE [DIM_counter] (
  [sk_counter] integer PRIMARY KEY,
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

CREATE TABLE [FACT_bookappointment] (
  [sk_day] integer,
  [sk_hour] integer,
  [sk_patient] integer,
  [sk_counter] integer,
  [sk_medical_center] integer,
  [time_waiting] integer,
  [appointment_done] bit,
  [ticket_number] integer,
  [appointment_id] integer
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

ALTER TABLE [FACT_bookappointment] ADD FOREIGN KEY ([sk_day]) REFERENCES [DIM_day] ([sk_day])
GO

ALTER TABLE [FACT_bookappointment] ADD FOREIGN KEY ([sk_hour]) REFERENCES [DIM_hour] ([sk_hour])
GO

ALTER TABLE [FACT_bookappointment] ADD FOREIGN KEY ([sk_counter]) REFERENCES [DIM_counter] ([sk_counter])
GO

ALTER TABLE [FACT_bookappointment] ADD FOREIGN KEY ([sk_patient]) REFERENCES [DIM_patient] ([sk_patient])
GO

ALTER TABLE [FACT_bookappointment] ADD FOREIGN KEY ([sk_medical_center]) REFERENCES [DIM_medical_center] ([sk_medical_center])
GO
