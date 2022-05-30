CREATE TABLE [dbo].[tbl_JobCriteria]
(
	job_criteria_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,compensation DECIMAL(18,5) NOT NULL 
	,job_description VARCHAR(450)
	,position_count INT NOT NULL
	,weightage DECIMAL(18,5) 
	,closing_date DATETIME
	,is_Active BIT NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
)
