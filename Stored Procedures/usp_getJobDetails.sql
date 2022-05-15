-- =============================================
-- Author:		Sabarish Nair
-- Create date: 13-May-2022
-- Description:	This stored procedure is used to fetch all job details
-- =============================================
CREATE PROCEDURE [dbo].[usp_getJobDetails] 
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

		SELECT   [job_id]
				,[job_name]
				,[job_description]
		FROM [dbo].[tbl_JobMaster]

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
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getJobDetails',@Params;
			END
	END CATCH

END

