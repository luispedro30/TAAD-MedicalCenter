--create database Dw_Medical_Center;

use Dw_Medical_Center;

create schema Integration;

CREATE PROCEDURE [Integration].[GetLastETLCutoffTime]
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
SELECT [cutOff] AS CutoffTime
FROM Integration.[ETL_Cutoffs]
WHERE cutOff = (SELECT MAX([cutOff])
FROM Integration.[ETL_Cutoffs])
RETURN 0;
END;

CREATE TABLE [Integration].[ETL_Cutoffs](
[id] [int] IDENTITY(1,1) NOT NULL,
[cutOff] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
[id] ASC
))


SELECT * FROM Integration.ETL_Cutoffs;
INSERT INTO Integration.ETL_Cutoffs
VALUES ('2005-10-31 21:09:46.610');


--SELECT DATEADD("Minute", -5, GETUTCDATE());
