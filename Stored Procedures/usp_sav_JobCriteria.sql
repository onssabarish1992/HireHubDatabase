SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kishore Valavan
-- Create date: 21-May-2022
-- Description:	This stored procedure is used to insert role criteria information into Job Criteria
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_JobCriteria] 
	@job_id INT,
	@Position INT,
	@Compensation DECIMAL(18,5),
    @JobDescription VARCHAR(450) NULL,
    @ClosingDate DATETIME,
    @Mode VARCHAR(20),
    @job_criteria_id INT NULL

AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

            
            IF UPPER(@Mode) = 'CREATE'
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
                    (@job_id
                    ,@Compensation
                    ,@JobDescription
                    ,@Position
                    ,@ClosingDate
                    ,1
                    ,GETDATE()
                    ,'ADMIN');

            ELSE IF UPPER(@MODE) = 'UPDATE'
                -- update the table using primary key
                UPDATE [dbo].[tbl_JobCriteria]
                SET job_id=@job_id,
                    position_count = @Position,
                    job_description = @JobDescription,
                    closing_date = @ClosingDate,
                    date_modified = GETDATE()
                WHERE job_criteria_id = @job_criteria_id;

            ELSE IF UPPER(@MODE) = 'DELETE'
                DELETE FROM [dbo].[tbl_JobCriteria] WHERE job_criteria_id = @job_criteria_id;
            ELSE 
                PRINT('UNEXPECTED');
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
				SET	@Params='@job_id='+CONVERT(NVARCHAR(MAX),@job_id)+
						' | @Position ='+CONVERT(NVARCHAR(MAX),@Position)+
						' | @Compensation ='+CONVERT(NVARCHAR(MAX),@Compensation)+
						' | @JobDescription ='+CONVERT(NVARCHAR(MAX),@JobDescription)+
						' | @ClosingDate ='+CONVERT(NVARCHAR(MAX),@ClosingDate)+
                        ' | @Mode ='+CONVERT(NVARCHAR(MAX),@Mode)+
                        ' | @job_criteria_id='+CONVERT(NVARCHAR(MAX),@job_criteria_id);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_JobCriteria',@Params;
			END
	END CATCH
    
END
GO
