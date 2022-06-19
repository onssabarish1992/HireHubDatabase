SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kishore Valavan
-- Create date: 15-June-2022
-- Description:	This stored procedure is used to update table
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateCompensation]
    @actual_compensation DECIMAL(18, 5),
    @is_hired BIT,
    @global_score_id INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

        DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);
        -- <update the table>
        -- update ishred and compensation

        UPDATE [dbo].[tbl_CandidateGlobalScores]
        SET is_hired = @is_hired,
            actual_compensation = @actual_compensation
        WHERE global_score_id = @global_score_id

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
		
				SET	@Params='@actual_compensation='+CONVERT(NVARCHAR(MAX),@actual_compensation)+
							' | @is_hired ='+CONVERT(NVARCHAR(MAX),@is_hired)+
							' | @global_score_id ='+CONVERT(NVARCHAR(MAX),@global_score_id);
		
				EXEC usp_sav_ErrorLog @StackTrace,'usp_UpdateCompensation',@Params;
			END
	END CATCH

END



-- exec [dbo].[usp_UpdateCompensation] 'jkask'
GO
