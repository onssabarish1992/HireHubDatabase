-- =============================================  
-- Author:  Rishabh Singh Chauhan  
-- Create date: 25-May-2022  
-- Description: This stored procedure is used to get Job Role information from the Subcriteria table  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_getEvaluationCriteria]   
AS  
BEGIN  
 BEGIN TRY  
 SET NOCOUNT ON;  
  DECLARE @ErrorSeverity INT,  
   @ErrorState INT,    
   @StackTrace NVARCHAR(MAX),  
   @Params NVARCHAR(MAX);  
  
   SELECT  
     JM.job_name  
    ,CM.criteria_name  
    ,CM.date_created
	,SC.sub_criteria_description
   FROM [dbo].[tbl_CriteriaMaster] CM  
   INNER JOIN [dbo].[tbl_SubCriteria] SC  
    ON CM.criteria_ID = SC.criteria_ID  
   INNER JOIN tbl_JobMaster JM  
    ON JM.job_id=SC.job_id  
  
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
  EXEC usp_sav_ErrorLog @StackTrace,'usp_getEvaluationCriteria',@Params;  
  END  
 END CATCH  
END  