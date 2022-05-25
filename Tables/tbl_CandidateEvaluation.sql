CREATE TABLE tbl_CandidateEvaluation (
	 evaluation_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,schedule_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateInterviewSchedule(schedule_id)
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,criteria_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CriteriaMaster(criteria_id)
	,criteria_score INT NOT NULL
	,criteria_comments NVARCHAR(MAX) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME NULL
	,modified_by NVARCHAR(450)
	);
