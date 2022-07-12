-- =============================================
-- Author:		Rishabh Singh Chauhan
-- Create date: 22-May-2022
-- Description:	This stored procedure is used to insert details into Sub Criteria new table
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_SubCriteria]
	@job_id INT,
	@criteria_id INT,
    @sub_criteria_description VARCHAR(450),
    @CreatedBy NVARCHAR(450),
    @Mode NVARCHAR(20),
    @sub_criteria_id int null
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT
			,@ErrorState INT
			,@StackTrace NVARCHAR(MAX)
			,@Params NVARCHAR(MAX);

        IF UPPER(@Mode) = 'CREATE'
            INSERT INTO [dbo].[tbl_SubCriteria]
			   ([job_id]
			   ,[criteria_id]
			   ,[sub_criteria_description]
			   ,[weightage]
			   ,[is_Active]
			   ,[date_created]
			   ,[created_by]
			   ,[date_modified]
			   ,[modified_by])
		    VALUES
			   (@job_id
			   ,@criteria_id
			   ,@sub_criteria_description
			   ,NULL
			   ,1
			   ,GETDATE()
			   ,@CreatedBy
			   ,NULL
			   ,NULL);
        ELSE IF UPPER(@MODE) = 'UPDATE'

            UPDATE [dbo].[tbl_SubCriteria]
            SET job_id =@job_id,
                criteria_id = @criteria_id,
                sub_criteria_description = @sub_criteria_description
            WHERE sub_criteria_id = @sub_criteria_id;
        
        ELSE IF UPPER(@Mode) = 'DELETE'

            DELETE FROM [dbo].[tbl_SubCriteria] WHERE sub_criteria_id = @sub_criteria_id;
        
        ELSE

            PRINT('UNEXPECTED');


	END TRY

	BEGIN CATCH
		SET @ErrorSeverity = ERROR_SEVERITY();
		SET @ErrorState = ERROR_STATE();
		SET @StackTrace = ERROR_MESSAGE();

		IF (ERROR_NUMBER() = 50000) -- User defined error 
		BEGIN
			RAISERROR (
					@StackTrace
					,@ErrorSeverity
					,@ErrorState
					);
		END
		ELSE
		BEGIN

		SET	@Params= '@job_id ='+CONVERT(NVARCHAR(MAX),@job_id)+
						' | @criteria_id ='+CONVERT(NVARCHAR(MAX),@criteria_id)+
						' | @sub_criteria_description ='+CONVERT(NVARCHAR(MAX),@sub_criteria_description)+
						' | @CreatedBy ='+CONVERT(NVARCHAR(MAX),@CreatedBy)+
                        ' | @Mode ='+CONVERT(NVARCHAR(MAX),@Mode)+
                        ' | @sub_criteria_id='+CONVERT(NVARCHAR(MAX),@sub_criteria_id);
			-- Save error to log table
			EXEC usp_sav_ErrorLog @StackTrace
				,'usp_sav_SubCriteria'
				,@Params;
		END
	END CATCH
END
GO
