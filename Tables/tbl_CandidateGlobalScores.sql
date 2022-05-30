CREATE TABLE [dbo].[tbl_CandidateGlobalScores]
(
	global_score_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,candidate_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateDetails(candidate_id)
	,schedule_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateInterviewSchedule(schedule_id)
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,is_hired BIT NOT NULL
	,proposed_compensation DECIMAL(18, 5)
	,actual_compensation DECIMAL(18, 5)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
)
