-- =============================================
-- Author:		Sabarish Nair
-- Create date: 18-June-2022
-- Description:	This stored procedure is used to save weightages for AHP
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_AHPWeightage] 
	@CreatedBy nvarchar(450),
	@AHPWeightagesXML XML
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

			DECLARE @Ratings As TABLE (pair_id INT, weightage INT);

			
			-- Move XML data to Temp Table
			INSERT INTO @Ratings(
					pair_id,
					weightage
			)
			SELECT  x.AHPPairDataTable.value('PairId[1]','INT'),
					x.AHPPairDataTable.value('Weightage[1]','INT')
				FROM @AHPWeightagesXML.nodes('Pairs/Pair')
				AS x(AHPPairDataTable);

			UPDATE AP
			SET AP.weightage = RT.weightage
			FROM [dbo].[tbl_AHPPairs] AP
			INNER JOIN @Ratings RT
				ON RT.pair_id = AP.pair_id
  
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
						' | @AHPWeightagesXML ='+CONVERT(NVARCHAR(MAX),@AHPWeightagesXML);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_AHPWeightage',@Params;
			END
	END CATCH
    
END