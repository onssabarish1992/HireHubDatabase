-- =============================================
-- Author:		Ashima Agarwal
-- Create date: 22-May-2022
-- Description:	This stored procedure is used to get Candidate information
-- =============================================
-- Modified By   | Modified On  | Comments
-- ----------------------------------------------
-- Sabarish Nair | 09-June-2022 | Retrieve the interview status of the candidate
-- =============================================
CREATE PROCEDURE [dbo].[usp_getInterviewerCandidates]
	@interviewer_id NVARCHAR(450)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);
	

		SELECT CD.[candidate_id]
		  ,CD.candidate_name
		  ,CD.date_created
		  ,CS.project_name
		  ,CS.interview_timestamp
		  ,CS.schedule_id
		  ,CS.job_id
		  ,JM.job_name
		  ,CASE 
				WHEN EV.schedule_id IS NULL THEN 'Pending'
				ELSE 'Completed'
		   END As interview_status
		FROM [dbo].[tbl_CandidateDetails] CD
		INNER JOIN [dbo].[tbl_CandidateInterviewSchedule] CS
			ON CD.candidate_id = CS.candidate_id
		INNER JOIN tbl_JobMaster JM
			ON JM.job_id = CS.job_id
		LEFT JOIN [dbo].[tbl_CandidateEvaluation] EV
			ON EV.schedule_id = CS.schedule_id
			AND EV.job_id  = CS.job_id
		WHERE CS.interviewer_id = @interviewer_id
		GROUP BY CD.[candidate_id]
				 ,CD.candidate_name
				 ,CD.date_created
				 ,CS.project_name
				 ,CS.interview_timestamp
				 ,CS.schedule_id
				 ,CS.job_id
				 ,JM.job_name
				 ,EV.schedule_id


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
		
				SET	@Params='InterviewerID='+CONVERT(NVARCHAR(MAX),@interviewer_id);
		
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getInterviewerCandidates',@Params;
			END
	END CATCH

END