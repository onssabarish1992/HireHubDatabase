-- =============================================
-- Author:		Sabarish Nair
-- Create date: 04-June-2022
-- Description:	This stored procedure is used to save interviewer ratings and comments
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_InterviewRatings] 
	@CreatedBy nvarchar(450),
	@InterviewRatingsXML XML
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

			DECLARE @TempCandidateRating AS TABLE(schedule_id INT, job_id INT,criteria_id INT,criteria_score INT, criteria_comments NVARCHAR(MAX));

			
			-- Move XML data to Temp Table
			INSERT INTO @TempCandidateRating(
					schedule_id,
					job_id,
					criteria_id,
					criteria_score,
					criteria_comments
			)
			SELECT  x.InterviewDataTable.value('ScheduleId[1]','INT'),
					x.InterviewDataTable.value('JobId[1]','INT'),	
					x.InterviewDataTable.value('CriteriaId[1]','INT'),	
					x.InterviewDataTable.value('CriteriaScore[1]','INT'),	
					x.InterviewDataTable.value('CriteriaComments[1]','NVARCHAR(MAX)')
				FROM @InterviewRatingsXML.nodes('Criterias/Criteria')
				AS x(InterviewDataTable);

			INSERT INTO [dbo].[tbl_CandidateEvaluation]
			(
				[schedule_id]
			   ,[job_id]
			   ,[criteria_id]
			   ,[criteria_score]
			   ,[criteria_comments]
			   ,[date_created]
			   ,[created_by]
			   ,[date_modified]
			   ,[modified_by]
			)
			SELECT schedule_id
				  ,job_id
				  ,criteria_id
				  ,criteria_score
				  ,criteria_comments
				  ,GETDATE()
				  ,@CreatedBy
				  ,NULL
				  ,NULL
			FROM @TempCandidateRating
  
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
				SET	@Params='@CreatedBy='+CONVERT(NVARCHAR(MAX),@CreatedBy)+
						' | @InterviewRatingsXML ='+CONVERT(NVARCHAR(MAX),@InterviewRatingsXML);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_JobCriteria',@Params;
			END
	END CATCH
    
END


