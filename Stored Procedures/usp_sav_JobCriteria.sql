-- =============================================
-- Author:		Kishore Valavan
-- Create date: 21-May-2022
-- Description:	This stored procedure is used to insert role criteria information into Job Criteria
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_JobCriteria] 
	@JobRole INT,
	@Position INT,
	@Compensation DECIMAL(18,5),
    @JobDescription VARCHAR(450),
    @ClosingDate DATETIME
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);
            
            INSERT INTO [dbo].[tbl_JobCriteria]
                ([job_id]
                ,[compensation]
                ,[job_description]
                ,[position_count]
                ,[closing_date]
                ,[is_Active]
                ,[date_created]
                ,[created_by])
            VALUES
                (@JobRole
                ,@Compensation
                ,@JobDescription
                ,@Position
                ,@ClosingDate
                ,1
                ,GETDATE()
                ,'ADMIN');
    END TRY
    BEGIN CATCH

			SET @ErrorSeverity = ERROR_SEVERITY();  
			SET @ErrorState = ERROR_STATE();  
			SET @StackTrace = ERROR_MESSAGE(); 
	
	
			IF(ERROR_NUMBER()=50000) -- User defined error 
			BEGIN
				RAISERROR(@StackTrace, @ErrorSeverity, @ErrorState);  
			END
			ELSE
			BEGIN
				-- Save error to log table
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_JobCriteria',@Params;
			END
	END CATCH
    
END


