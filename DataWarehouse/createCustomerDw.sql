use Dw_Sakila

--Divide staging area (DSA) from data warehouse (DW)
/*CREATE SCHEMA DSA;


CREATE TABLE DSA.[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[email] [varchar](50) NULL,
	[address_id] [int] NOT NULL,
	[active] [char](1) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[last_update] [datetime] NOT NULL)*/

/*CREATE TABLE DSA.[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[address2] [varchar](50) NULL,
	[district] [varchar](20) NOT NULL,
	[city_id] [int] NOT NULL,
	[postal_code] [varchar](10) NULL,
	[phone] [varchar](20) NOT NULL,
	[last_update] [datetime] NOT NULL)*/

/*CREATE TABLE DSA.[rental](
	[rental_id] [int] IDENTITY(1,1) NOT NULL,
	[rental_date] [datetime] NOT NULL,
	[inventory_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[return_date] [datetime] NULL,
	[staff_id] [tinyint] NOT NULL,
	[last_update] [datetime] NOT NULL)*/

CREATE TABLE DSA.[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_id] [smallint] NOT NULL,
	[last_update] [datetime] NOT NULL);

CREATE TABLE DSA.[country](
	[country_id] [smallint] IDENTITY(1,1) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[last_update] [datetime] NULL);

SELECT * FROM DSA.country;
USE sakila;
SELECT * FROM DSA.address;


use sakila;

--Temporal Tables
ALTER TABLE dbo.customer
ADD
SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
CONSTRAINT DF_SysStart DEFAULT SYSUTCDATETIME()
, SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
CONSTRAINT DF_SysEnd DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime);

CREATE SCHEMA History;

ALTER TABLE customer
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = History.customer));

INSERT INTO [dbo].[customer]
([store_id],[first_name],[last_name],[email],[address_id],[active],[create_date],[last_update])
VALUES (1,'Jonh','Doe','john.doe@estg.ipp.pt',605,1,GETDATE(),GETDATE())

select * from [dbo].customer;
UPDATE customer
SET address_id = 604
WHERE customer_id = 601;

SELECT * FROM [History].customer;

DECLARE
@start AS DATETIME2(7)= GETDATE()-4,
@end AS DATETIME2(7)= GETDATE();
SELECT [customer_id]
,[store_id]
,[first_name]
,[last_name]
,[email]
,[address_id]
,[active]
,[create_date]
,[last_update]
,[SysStartTime]
,[SysEndTime]
FROM [dbo].[customer]
WHERE SysStartTime > @start AND SysStartTime < @end
UNION ALL
SELECT [customer_id]
,[store_id]
,[first_name]
,[last_name]
,[email]
,[address_id]
,[active]
,[create_date]
,[last_update]
,[SysStartTime]
,[SysEndTime]
FROM [History].[customer]
WHERE SysStartTime < @end AND SysEndTime > @start;

use sakila;
select * from dbo.customer;

INSERT INTO [dbo].[customer]
([store_id],[first_name],[last_name],[email],[address_id],[active],[create_date],[last_update])
VALUES (1,'Carlos','Silva','john.silvation@estg.ipp.pt',605,1,GETDATE(),GETDATE())





