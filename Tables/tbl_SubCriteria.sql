CREATE TABLE [dbo].[tbl_SubCriteria]
(
	sub_criteria_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,criteria_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CriteriaMaster(criteria_id)
	,sub_criteria_description VARCHAR(450)
	,weightage DECIMAL(18,5) NULL
	,is_Active BIT NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
)
