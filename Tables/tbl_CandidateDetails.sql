CREATE TABLE [dbo].[tbl_CandidateDetails]
(
	 candidate_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,candidate_name VARCHAR(250) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME 
	,modified_by NVARCHAR(450)
)
