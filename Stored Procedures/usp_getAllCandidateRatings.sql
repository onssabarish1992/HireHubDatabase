-- =============================================  
-- Author:  Sabarish Nair
-- Create date: 10-06-2022  
-- Description: Get ratings obtained by all the candidates  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_getAllCandidateRatings]   
AS  
BEGIN  
 BEGIN TRY  
 SET NOCOUNT ON;  
  DECLARE @ErrorSeverity INT,  
		   @ErrorState INT,    
		   @StackTrace NVARCHAR(MAX),  
		   @Params NVARCHAR(MAX);  
  
   SELECT CE.job_id
		,CE.criteria_id
		,CM.criteria_name
		,SC.sub_criteria_description
		,CE.criteria_score
		,CE.criteria_comments
		,CD.candidate_id
		,CD.candidate_name
		,CIS.schedule_id
	FROM [tbl_CandidateEvaluation] CE
	INNER JOIN [tbl_JobMaster] JM
		ON JM.job_id = CE.job_id
	INNER JOIN [tbl_CriteriaMaster] CM
		ON CM.criteria_id = CE.criteria_id
	INNER JOIN tbl_SubCriteria SC
		ON SC.criteria_id = CE.criteria_id
		AND SC.job_id = JM.job_id
	INNER JOIN tbl_CandidateInterviewSchedule CIS
		ON CIS.schedule_id = CE.schedule_id
	INNER JOIN tbl_CandidateDetails CD
		ON CD.candidate_id = CIS.candidate_id 
  
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
		EXEC usp_sav_ErrorLog @StackTrace,'usp_getAllCandidateRatings',@Params;  
	END  
 END CATCH  
END