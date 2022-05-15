CREATE TABLE [dbo].[tbl_CandidateInterviewSchedule]
(
	 schedule_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,candidate_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateDetails(candidate_id)
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,project_name VARCHAR(100)
	,interviewer_id NVARCHAR(450) NOT NULL
	,interview_timestamp DATETIME NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME
	,modified_by NVARCHAR(450)
)
