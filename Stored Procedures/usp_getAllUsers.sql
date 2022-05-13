-- =============================================
-- Author:		Sabarish Nair
-- Create date: 13-May-2022
-- Description:	This stored procedure is used to get user information
-- =============================================
CREATE PROCEDURE usp_getAllUsers 
	@UserType VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;

		DECLARE @ErrorSeverity INT,
			@ErrorState INT,  
			@StackTrace NVARCHAR(MAX),
			@Params NVARCHAR(MAX);

		DECLARE @RoleID NVARCHAR(450)

		SELECT @RoleID = ID
		FROM AspNetRoles
		WHERE NormalizedName = @UserType
	

		SELECT AU.[Id]
		  ,AU.[UserName]
		  ,AU.[Email]
		FROM [dbo].[AspNetUsers] AU
		INNER JOIN [dbo].[AspNetUserRoles] AR
			ON AU.Id = AR.UserId
		WHERE AR.RoleId = @RoleID

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
		
				SET	@Params='UserType='+CONVERT(NVARCHAR(MAX),@UserType);
		
				EXEC usp_sav_ErrorLog @StackTrace,'usp_getAllUsers',@Params;
			END
	END CATCH

END

