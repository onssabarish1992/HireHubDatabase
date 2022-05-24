-- =============================================
-- Author:		Sabarish Nair
-- Create date: 24-May-2022
-- Description:	This stored procedure is used to get candidate details
-- =============================================
CREATE PROCEDURE [dbo].[usp_getCandidateDetails] 
	@CandidateID INT,
	@ScheduleID INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

		SELECT CD.candidate_id,
			   candidate_name,
			   CIS.job_id,
			   JM.job_name,
			   CONCAT(AU.FirstName,' ',ISNULL(AU.LastName,'')) AS interviewer_name,
			   project_name
		FROM tbl_CandidateDetails CD
		INNER JOIN tbl_CandidateInterviewSchedule CIS
			ON CD.candidate_id = CIS.candidate_id
		INNER JOIN tbl_JobMaster JM
			ON JM.job_id = CIS.job_id
		INNER JOIN AspNetUsers AU
			ON AU.Id = CIS.interviewer_id
		WHERE CD.candidate_id = @CandidateID
		AND CIS.schedule_id = @ScheduleID

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
			SET	@Params='@candidate_id='+CONVERT(NVARCHAR(MAX),@CandidateID)+
						' | @schedule_id ='+CONVERT(NVARCHAR(MAX),@ScheduleID);

				-- Save error to log table
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getCandidateDetails',@Params;
			END
	END CATCH

END

