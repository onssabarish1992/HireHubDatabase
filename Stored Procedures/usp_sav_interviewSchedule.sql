-- =============================================
-- Author:		Sabarish Nair
-- Create date: 15-May-2022
-- Description:	This stored procedure is used to save candidate interview details
-- =============================================
CREATE PROCEDURE [dbo].[usp_sav_interviewSchedule] 
	@candidate_name VARCHAR(250),
	@job_id INT,
	@project_name VARCHAR(100) NULL,
	@interviewer_id nvarchar(450),
	@CreatedBy nvarchar(450),
	@interview_timestamp DATETIME
AS
BEGIN

BEGIN TRY
	SET NOCOUNT ON;

	DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX),
			@CandidateID INT
	
	INSERT INTO [dbo].[tbl_CandidateDetails]
           ([candidate_name]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           (
		   @candidate_name
           ,GETDATE()
           ,@CreatedBy
           ,NULL
           ,NULL
		   )

	SET @CandidateID = @@IDENTITY

	INSERT INTO [dbo].[tbl_CandidateInterviewSchedule]
           ([candidate_id]
           ,[job_id]
           ,[project_name]
           ,[interviewer_id]
           ,[interview_timestamp]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           (
			@CandidateID
           ,@job_id
           ,@project_name
           ,@interviewer_id
           ,@interview_timestamp
           ,GETDATE()
           ,@CreatedBy
           ,NULL
           ,NULL
		   )
    
END TRY
BEGIN CATCH

	SET @ErrorSeverity = ERROR_SEVERITY();  
	SET @ErrorState = ERROR_STATE();  
	SET @StackTrace = ERROR_MESSAGE(); 
	
	IF XACT_STATE() <> 0  
			ROLLBACK TRAN 
	
	IF(ERROR_NUMBER()=50000) -- User defined error 
	BEGIN
		RAISERROR(@StackTrace, @ErrorSeverity, @ErrorState);  
	END
	ELSE
	BEGIN
		-- Save error to log table
		SET	@Params='@candidate_name='+CONVERT(NVARCHAR(MAX),@candidate_name)+
						' | @job_id ='+CONVERT(NVARCHAR(MAX),@job_id)+
						' | @project_name ='+CONVERT(NVARCHAR(MAX),@project_name)+
						' | @interviewer_id ='+CONVERT(NVARCHAR(MAX),@interviewer_id)+
						' | @CreatedBy ='+CONVERT(NVARCHAR(MAX),@CreatedBy) +
						' | @interview_timestamp ='+CONVERT(NVARCHAR(MAX),@interview_timestamp);
		EXEC usp_sav_ErrorLog @StackTrace,'usp_sav_ErrorLog',@Params;
	END
			
END CATCH
END