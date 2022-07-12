CREATE TABLE [dbo].[tbl_JobMaster]
(
	 job_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_name VARCHAR(50) NOT NULL
	,job_description VARCHAR(MAX) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME 
	,modified_by NVARCHAR(450)
)
