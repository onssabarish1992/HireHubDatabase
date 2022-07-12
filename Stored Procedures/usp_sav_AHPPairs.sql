-- =============================================
-- Author:		Sabarish Nair
-- Create date: 15-June-2022
-- Description:	This stored procedure is used to save the AHP Pairs
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_AHPPairs] 
	@CreatedBy nvarchar(450),
	@AHPPairsXML XML
AS
BEGIN

    BEGIN TRY
            SET NOCOUNT ON;

            DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

			DECLARE @TempAHPPairs AS TABLE(pair_1 INT, pair_2 INT, [entity_id] INT,[parent_entity_id] INT NULL);

			
			-- Move XML data to Temp Table
			INSERT INTO @TempAHPPairs(
					pair_1,
					pair_2,
					[entity_id],
					[parent_entity_id]
			)
			SELECT  x.AHPDataTable.value('Pair1[1]','INT'),
					x.AHPDataTable.value('Pair2[1]','INT'),	
					x.AHPDataTable.value('EntityId[1]','INT'),	
					x.AHPDataTable.value('ParentEntityId[1]','INT')
				FROM @AHPPairsXML.nodes('Pairs/Pair')
				AS x(AHPDataTable);

			IF EXISTS(SELECT 1 FROM @TempAHPPairs WHERE [entity_id] = 1)
			BEGIN
				DELETE FROM [dbo].[tbl_AHPPairs]
			END

			INSERT INTO [dbo].[tbl_AHPPairs]
				   ([pair_1]
				   ,[pair_2]
				   ,[entity_id]
				   ,[weightage]
				   ,[date_created]
				   ,[created_by]
				   ,[date_modified]
				   ,[modified_by]
				   ,[parent_entity_id])
			 SELECT pair_1,
					pair_2,
					[entity_id],
					NULL,
					GETDATE(),
					@CreatedBy,
					NULL,
					NULL,
					[parent_entity_id]
				FROM @TempAHPPairs
  
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
						' | @AHPPairsXML ='+CONVERT(NVARCHAR(MAX),@AHPPairsXML);
				EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_AHPPairs',@Params;
			END
	END CATCH
    
END