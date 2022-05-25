-- =============================================
-- Author:		Sabarish Nair
-- Create date: 25-May-20222
-- Description:	Get all criterias for a job role
-- =============================================
CREATE PROCEDURE [dbo].[usp_getCriteriasForJob]
	@job_id INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

		SELECT JM.job_id,
			   JM.job_name,
			   CM.criteria_id,
			   CM.criteria_name,
			   CM.criteria_description
		FROM tbl_JobCriteriaMapping JCM
		INNER JOIN tbl_JobMaster JM
			ON JCM.job_id = JM.job_id
		INNER JOIN tbl_CriteriaMaster CM
			ON CM.criteria_id = JCM.criteria_id
		WHERE JCM.job_id = @job_id

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
			SET	@Params='@job_id='+CONVERT(NVARCHAR(MAX),@job_id);

				-- Save error to log table
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getCriteriasForJob',@Params;
			END
		
	END CATCH
END
GO
