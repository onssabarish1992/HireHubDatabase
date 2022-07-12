-- =============================================
-- Author:		Sabarish Nair
-- Create date: 18-June-2022
-- Description:	This stored procedure is used to save weightages for AHP
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_AHPFinalScores] 
	@CreatedBy nvarchar(450),
	@entity_id INT,
	@AHPFinalscoresXML XML,
	@job_id INT NULL
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

			DECLARE @Weightages As TABLE (eval_id INT, score DECIMAL(18,5));

			
			-- Move XML data to Temp Table
			INSERT INTO @Weightages(
					eval_id,
					score
			)
			SELECT  x.AHPPairDataTable.value('EvalID[1]','INT'),
					x.AHPPairDataTable.value('Weightage[1]','DECIMAL(18,5)')
				FROM @AHPFinalscoresXML.nodes('Pairs/Pair')
				AS x(AHPPairDataTable);

			IF @entity_id = 1
			BEGIN

				UPDATE JC
				SET JC.weightage = WT.score
				FROM [dbo].tbl_JobCriteria JC
				INNER JOIN @Weightages WT
					ON WT.eval_id = JC.job_id
			END 
			ELSE IF @entity_id = 2
			BEGIN

				UPDATE SC
				SET SC.weightage = WT.score
				FROM [dbo].tbl_SubCriteria SC
				INNER JOIN @Weightages WT
					ON WT.eval_id = SC.criteria_id
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
				SET	@Params='@CreatedBy='+CONVERT(NVARCHAR(MAX),@CreatedBy)+
						' | @entity_id ='+CONVERT(NVARCHAR(MAX),@entity_id)+
						' | @AHPFinalscoresXML ='+CONVERT(NVARCHAR(MAX),@AHPFinalscoresXML)+
						' | @job_id ='+CONVERT(NVARCHAR(MAX),@job_id);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_AHPFinalScores',@Params;
			END
	END CATCH
    
END