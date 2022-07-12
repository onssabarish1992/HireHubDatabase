-- =============================================
-- Author:		Kishore Valavan
-- Create date: 10-June-2022
-- Description:	This stored procedure is used to save global scores
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_GlobalScores] 
	@CreatedBy nvarchar(450),
	@GlobalScoresXML XML
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

			IF EXISTS (SELECT 1 FROM [dbo].[tbl_CandidateGlobalScores])
			BEGIN
				DELETE FROM [dbo].[tbl_CandidateGlobalScores]
			END

			DECLARE @temp_GlobalScore AS TABLE(candidate_id INT, 
											   schedule_id INT,
											   job_id INT,
											   is_hired BIT, 
											   global_score DECIMAL(18,5),
											   local_score DECIMAL(18,5),
											   is_recommended BIT,
											   proposed_compensation DECIMAL(18,5), 
											   actual_compensation DECIMAL(18,5));

			
			-- Move XML data to Temp Table
			INSERT INTO @temp_GlobalScore(
					candidate_id,
					schedule_id,
					job_id,
					is_hired,
					global_score,
					local_score,
					is_recommended,
					proposed_compensation,
                    actual_compensation
			)
			SELECT  x.ScoreDataTable.value('candidate_id[1]','INT'),
					x.ScoreDataTable.value('schedule_id[1]','INT'),	
					x.ScoreDataTable.value('job_id[1]','INT'),	
					x.ScoreDataTable.value('is_hired[1]','BIT'),
					x.ScoreDataTable.value('global_score[1]','DECIMAL(18,5)'),
					x.ScoreDataTable.value('local_score[1]','DECIMAL(18,5)'),
					x.ScoreDataTable.value('is_recommended[1]','BIT'),
					x.ScoreDataTable.value('proposed_compensation[1]','DECIMAL(18,5)'),
                    x.ScoreDataTable.value('actual_compensation[1]','DECIMAL(18,5)')
				FROM @GlobalScoresXML.nodes('Scores/Score')
				AS x(ScoreDataTable);

            INSERT INTO [dbo].[tbl_CandidateGlobalScores] (
                [candidate_id]
                ,[schedule_id]
                ,[job_id]
                ,[is_hired]
				,[is_recommeded]
				,global_score
			    ,local_score
                ,[proposed_compensation]
                ,[actual_compensation]
                ,[date_created]
                ,[created_by]
                ,[date_modified]
                ,[modified_by])
        
            SELECT [candidate_id]
                ,[schedule_id]
                ,[job_id]
                ,[is_hired]
				,[is_recommended]
				,[global_score]
			    ,[local_score]
                ,[proposed_compensation]
                ,[actual_compensation]
                ,Getdate()
                ,@CreatedBy
                ,NULL
                ,NULL
            FROM @temp_GlobalScore
  
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
						' | @GlobalScoresXML ='+CONVERT(NVARCHAR(MAX),@GlobalScoresXML);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_GlobalScores',@Params;
			END
	END CATCH
    
END