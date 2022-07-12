-- =============================================
-- Author:		Sabarish Nair
-- Create date: 18-June-2022
-- Description:	Get all AHP Pairs
-- =============================================
CREATE PROCEDURE [dbo].[usp_getAHPPairs]
	@entity_id INT,
	@parent_entity_id INT NULL
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

		IF @entity_id = 1 
		BEGIN

			SELECT AH.pair_id
				  ,AH.pair_1
				  ,JM1.job_name AS [pair1name]
				  ,AH.pair_2
				  ,JM2.job_name AS [pair2name]
				  ,AH.weightage
				  ,AH.parent_entity_id
			FROM [dbo].[tbl_AHPPairs] AH
			INNER JOIN [dbo].[tbl_JobMaster] JM1
				ON JM1.job_id = AH.pair_1
			INNER JOIN [dbo].[tbl_JobMaster] JM2
				ON JM2.job_id = AH.pair_2
			WHERE [entity_id] = @entity_id

		END
		ELSE IF @entity_id = 2
		BEGIN
			
			SELECT AH.pair_id
				  ,AH.pair_1
				  ,CM1.criteria_name AS [pair1name]
				  ,AH.pair_2
				  ,CM2.criteria_name AS [pair2name]
				  ,AH.weightage
				  ,AH.parent_entity_id
			FROM [dbo].[tbl_AHPPairs] AH
			INNER JOIN [dbo].[tbl_JobMaster] JM
				ON JM.job_id = AH.parent_entity_id
			INNER JOIN [dbo].[tbl_CriteriaMaster] CM1
				ON CM1.criteria_id = AH.pair_1
			INNER JOIN [dbo].[tbl_CriteriaMaster] CM2
				ON CM2.criteria_id = AH.pair_2
			WHERE [entity_id] = @entity_id
			AND parent_entity_id = @parent_entity_id

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
			SET	@Params='@entity_id='+CONVERT(NVARCHAR(MAX),@entity_id)+
						'@parent_entity_id='+CONVERT(NVARCHAR(MAX),@parent_entity_id);

				-- Save error to log table
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getAHPPairs',@Params;
			END
		
	END CATCH
END