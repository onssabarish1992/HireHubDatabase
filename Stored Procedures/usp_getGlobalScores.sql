SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kishore Valavan
-- Create date: 07-June-2022
-- Description:	This stored procedure is used to get global scores
-- =============================================
CREATE PROCEDURE [dbo].[usp_getGlobalScores]
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);
	

		SELECT CG.[global_score_id]
      ,CG.[candidate_id]
      ,CD.[candidate_name]
      ,CG.[schedule_id]
      ,CG.[job_id]
      ,JM.[job_name]
      ,CG.[is_hired]
      ,CG.[proposed_compensation]
      ,CG.[actual_compensation]
      ,CG.[date_created]
      ,CG.[created_by]
      ,CG.[date_modified]
      ,CG.[modified_by]
	  ,CG.[is_recommeded]
  FROM [dbo].[tbl_CandidateGlobalScores] CG 
  INNER JOIN [dbo].[tbl_CandidateDetails] CD  ON CG.candidate_id = CD.candidate_id
  INNER JOIN [dbo].[tbl_JobMaster] JM ON CG.job_id = JM.job_id
  INNER JOIN [dbo].[tbl_CandidateInterviewSchedule] CIS on CIS.schedule_id = CG.schedule_id

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
		
				
		
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getGlobalScores';
			END
	END CATCH

END
GO
