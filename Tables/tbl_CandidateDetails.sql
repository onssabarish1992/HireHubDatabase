CREATE TABLE tbl_CandidateDetails (
	Candidate_details_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,criteria_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CriteriaMaster(criteria_id)
	,project_name VARCHAR(100)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
	);
