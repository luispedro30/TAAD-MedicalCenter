USE [DataWarehouseMedicalCenter]
GO
/****** Object:  StoredProcedure [dbo].[PopulateDateDimensionForYear]    Script Date: 19/01/2023 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PopulateDateDimensionForYear]
@YearNumber int
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @DateCounter date = DATEFROMPARTS(@YearNumber, 1, 1);

	CREATE TABLE #DateDimension
    (
       [Date] [date] NOT NULL,
		[DateKey] [int] NOT NULL,
		[Day Number] [int] NOT NULL,
		[Day] [nvarchar](10) NOT NULL,
		[Day of Year] [nvarchar](5) NOT NULL,
		[Day of Year Number] [int] NOT NULL,
		[Day of Week] [nvarchar](20) NOT NULL,
		[Day of Week Number] [int] NOT NULL,
		[Week of Year] [nvarchar](5) NOT NULL,
		[Month] [nvarchar](10) NOT NULL,
		[Short Month] [nvarchar](3) NOT NULL,
		[Quarter] [nvarchar](2) NOT NULL,
		[Half of Year] [nvarchar](3) NOT NULL,
		[Beginning of Month] [date] NOT NULL,
		[Beginning of Quarter] [date] NOT NULL,
		[Beginning of Half Year] [date] NOT NULL,
		[Beginning of Year] [date] NOT NULL,
		[Beginning of Month Label] [nvarchar](40) NOT NULL,
		[Beginning of Month Label Short] [nvarchar](40) NOT NULL,
		[Beginning of Quarter Label] [nvarchar](40) NOT NULL,
		[Beginning of Quarter Label Short] [nvarchar](40) NOT NULL,
		[Beginning of Half Year Label] [nvarchar](40) NOT NULL,
		[Beginning of Half Year Label Short] [nvarchar](40) NOT NULL,
		[Beginning of Year Label] [nvarchar](40) NOT NULL,
		[Beginning of Year Label Short] [nvarchar](40) NOT NULL,
		[Calendar Day Label] [nvarchar](20) NOT NULL,
		[Calendar Day Label Short] [nvarchar](20) NOT NULL,
		[Calendar Week Number] [int] NOT NULL,
		[Calendar Week Label] [nvarchar](20) NOT NULL,
		[Calendar Month Number] [int] NOT NULL,
		[Calendar Month Label] [nvarchar](20) NOT NULL,
		[Calendar Month Year Label] [nvarchar](20) NOT NULL,
		[Calendar Quarter Number] [int] NOT NULL,
		[Calendar Quarter Label] [nvarchar](20) NOT NULL,
		[Calendar Quarter Year Label] [nvarchar](20) NOT NULL,
		[Calendar Half of Year Number] [int] NOT NULL,
		[Calendar Half of Year Label] [nvarchar](20) NOT NULL,
		[Calendar Year Half of Year Label] [nvarchar](20) NOT NULL,
		[Calendar Year] [int] NOT NULL,
		[Calendar Year Label] [nvarchar](10) NOT NULL,
		[Fiscal Month Number] [int] NOT NULL,
		[Fiscal Month Label] [nvarchar](20) NOT NULL,
		[Fiscal Quarter Number] [int] NOT NULL,
		[Fiscal Quarter Label] [nvarchar](20) NOT NULL,
		[Fiscal Half of Year Number] [int] NOT NULL,
		[Fiscal Half of Year Label] [nvarchar](20) NOT NULL,
		[Fiscal Year] [int] NOT NULL,
		[Fiscal Year Label] [nvarchar](10) NOT NULL,
		[Date Key] [int] NOT NULL,
		[Year Week Key] [int] NOT NULL,
		[Year Month Key] [int] NOT NULL,
		[Year Quarter Key] [int] NOT NULL,
		[Year Half of Year Key] [int] NOT NULL,
		[Year Key] [int] NOT NULL,
		[Beginning of Month Key] [int] NOT NULL,
		[Beginning of Quarter Key] [int] NOT NULL,
		[Beginning of Half Year Key] [int] NOT NULL,
		[Beginning of Year Key] [int] NOT NULL,
		[Fiscal Year Month Key] [int] NOT NULL,
		[Fiscal Year Quarter Key] [int] NOT NULL,
		[Fiscal Year Half of Year Key] [int] NOT NULL,
		[ISO Week Number] [int] NOT NULL
    );


    BEGIN TRY;

        BEGIN TRAN;

        WHILE YEAR(@DateCounter) = @YearNumber
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM #DateDimension WHERE [Date] = @DateCounter)
            BEGIN
                INSERT #DateDimension
                       ( [Date]
                       , [DateKey]                              
                       , [Day Number]                        
                       , [Day]                               
                       , [Day of Year]                       
                       , [Day of Year Number]                
                       , [Day of Week]                       
                       , [Day of Week Number]                
                       , [Week of Year]                      
                       , [Month]                             
                       , [Short Month]                       
                       , [Quarter]                           
                       , [Half of Year]
                       , [Beginning of Month]
                       , [Beginning of Quarter]
                       , [Beginning of Half Year] 
                       , [Beginning of Year] 
                       , [Beginning of Month Label]        
                       , [Beginning of Month Label Short]  
                       , [Beginning of Quarter Label]      
                       , [Beginning of Quarter Label Short]
                       , [Beginning of Half Year Label]         
                       , [Beginning of Half Year Label Short]                                               
                       , [Beginning of Year Label]         
                       , [Beginning of Year Label Short]                                               
                       , [Calendar Day Label]                
                       , [Calendar Day Label Short]          
                       , [Calendar Week Number]              
                       , [Calendar Week Label]               
                       , [Calendar Month Number]             
                       , [Calendar Month Label]              
                       , [Calendar Month Year Label]         
                       , [Calendar Quarter Number]           
                       , [Calendar Quarter Label]            
                       , [Calendar Quarter Year Label]       
                       , [Calendar Half of Year Number]      
                       , [Calendar Half of Year Label]       
                       , [Calendar Year Half of Year Label]  
                       , [Calendar Year]                     
                       , [Calendar Year Label]               
                       , [Fiscal Month Number]               
                       , [Fiscal Month Label]                
                       , [Fiscal Quarter Number]             
                       , [Fiscal Quarter Label]              
                       , [Fiscal Half of Year Number]        
                       , [Fiscal Half of Year Label]         
                       , [Fiscal Year]                       
                       , [Fiscal Year Label]                 
                       , [Date Key]                          
                       , [Year Week Key]                     
                       , [Year Month Key]                    
                       , [Year Quarter Key]                  
                       , [Year Half of Year Key]
                       , [Year Key]    
                       , [Beginning of Month Key]   
                       , [Beginning of Quarter Key] 
                       , [Beginning of Half Year Key]             
                       , [Beginning of Year Key]             
                       , [Fiscal Year Month Key]             
                       , [Fiscal Year Quarter Key] 
                       , [Fiscal Year Half of Year Key]          
                       , [ISO Week Number]                   
                       )
                SELECT [Date] 
                       , [DateKey]                             
                       , [Day Number]                        
                       , [Day]                               
                       , [Day of Year]                       
                       , [Day of Year Number]                
                       , [Day of Week]                       
                       , [Day of Week Number]                
                       , [Week of Year]                      
                       , [Month]                             
                       , [Short Month]                       
                       , [Quarter]                           
                       , [Half of Year]                      
                       , [Beginning of Month]
                       , [Beginning of Quarter]
                       , [Beginning of Half of Year]                      
                       , [Beginning of Year]                      
                       , [Beginning of Month Label]        
                       , [Beginning of Month Label Short]  
                       , [Beginning of Quarter Label]      
                       , [Beginning of Quarter Label Short]
                       , [Beginning of Half Year Label]         
                       , [Beginning of Half Year Label Short]   
                       , [Beginning of Year Label]         
                       , [Beginning of Year Label Short]   
                       , [Calendar Day Label]                
                       , [Calendar Day Label Short]          
                       , [Calendar Week Number]              
                       , [Calendar Week Label]               
                       , [Calendar Month Number]             
                       , [Calendar Month Label]              
                       , [Calendar Month Year Label]         
                       , [Calendar Quarter Number]           
                       , [Calendar Quarter Label]            
                       , [Calendar Quarter Year Label]       
                       , [Calendar Half of Year Number]      
                       , [Calendar Half of Year Label]       
                       , [Calendar Year Half of Year Label]  
                       , [Calendar Year]                     
                       , [Calendar Year Label]               
                       , [Fiscal Month Number]               
                       , [Fiscal Month Label]                
                       , [Fiscal Quarter Number]             
                       , [Fiscal Quarter Label]              
                       , [Fiscal Half of Year Number]        
                       , [Fiscal Half of Year Label]         
                       , [Fiscal Year]                       
                       , [Fiscal Year Label]                 
                       , [Date Key]                          
                       , [Year Week Key]                     
                       , [Year Month Key]                    
                       , [Year Quarter Key]                  
                       , [Year Half of Year Key]             
                       , [Year Key]
                       , [Beginning of Month Key]   
                       , [Beginning of Quarter Key] 
                       , [Beginning of Half of Year Key]    
                       , [Beginning of Year Key]    
                       , [Fiscal Year Month Key]             
                       , [Fiscal Year Quarter Key]
                       , [Fiscal Year Half of Year Key]           
                       , [ISO Week Number]                   
                    FROM GenerateDateDimensionColumns(@DateCounter);
            END;
            SET @DateCounter = DATEADD(day, 1, @DateCounter);
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        PRINT N'Unable to populate dates for the year';
        THROW;
        RETURN -1;
    END CATCH;

	SELECT *
	FROM #DateDimension;

	DROP TABLE #DateDimension;
END;