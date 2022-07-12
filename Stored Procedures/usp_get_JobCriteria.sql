-- =============================================
-- Author:		Kishore Valavan
-- Create date: 21-May-2022
-- Description:	This stored procedure is used to get details from Job Criteria
-- =============================================
CREATE PROCEDURE [dbo].[usp_get_JobCriteria]
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT
			,@ErrorState INT
			,@StackTrace NVARCHAR(MAX)
			,@Params NVARCHAR(MAX);

		SELECT job_criteria_id 
            ,JM.[job_id]
			,[position_count]
			,JC.[job_description]
			,[compensation]
			,JM.[job_name]
			,JC.[closing_date]
			,JC.weightage
		FROM [dbo].[tbl_JobCriteria] JC
		INNER JOIN [dbo].[tbl_JobMaster] JM
			ON JC.job_id = JM.job_id
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
			-- Save error to log table
			EXEC usp_sav_ErrorLog @StackTrace
				,'usp_get_JobCriteria'
				,@Params;
		END
	END CATCH
END