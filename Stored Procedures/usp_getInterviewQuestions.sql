-- =============================================
-- Author:		Sabarish Nair
-- Create date: 04-June-2022
-- Description:	This stored procedure is used to fetch the questions for interview
-- =============================================
CREATE PROCEDURE [dbo].[usp_getInterviewQuestions]
	@ScheduleID INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX),
			@job_id INT;

		SELECT @job_id = job_id
		FROM tbl_CandidateInterviewSchedule
		WHERE schedule_id = @ScheduleID

		SELECT CIS.schedule_id,
			   CIS.candidate_id,
			   CIS.job_id,
			   JM.job_name,
			   CD.candidate_name
		FROM tbl_CandidateInterviewSchedule CIS
		INNER JOIN tbl_JobMaster JM
			ON JM.job_id = CIS.job_id
		INNER JOIN tbl_CandidateDetails CD
			ON CD.candidate_id = CIS.candidate_id
		WHERE schedule_id = @ScheduleID

		IF EXISTS (SELECT 1 FROM [tbl_CandidateEvaluation] WHERE schedule_id = @ScheduleID)
		BEGIN
			
			SELECT CE.job_id
				   ,CE.criteria_id
				   ,CM.criteria_name
				   ,SC.sub_criteria_description
				   ,CE.criteria_score
				   ,CE.criteria_comments
			FROM [tbl_CandidateEvaluation] CE
			INNER JOIN [tbl_JobMaster] JM
				ON JM.job_id = CE.job_id
			INNER JOIN [tbl_CriteriaMaster] CM
				ON CM.criteria_id = CE.criteria_id
			INNER JOIN tbl_SubCriteria SC
				ON SC.criteria_id = CE.criteria_id
				AND SC.job_id = JM.job_id
			WHERE schedule_id = @ScheduleID

		END
		ELSE
		BEGIN	

			SELECT JM.job_id
				   ,SC.criteria_id
				   ,CM.criteria_name
				   ,SC.sub_criteria_description
				   ,NULL as criteria_score
				   ,NULL as criteria_comments
			FROM tbl_JobCriteria JC
			INNER JOIN tbl_SubCriteria SC
				ON JC.job_id = SC.job_id
			INNER JOIN tbl_CriteriaMaster CM
				ON CM.criteria_id = SC.criteria_id
			INNER JOIN tbl_JobMaster JM
				ON JM.job_id = SC.job_id
			WHERE SC.job_id = @job_id
		END


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
		
				SET	@Params='schedule_id='+CONVERT(NVARCHAR(MAX),@ScheduleID);
		
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getInterviewQuestions',@Params;
			END
	END CATCH

END

