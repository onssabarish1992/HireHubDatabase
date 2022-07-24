-- create table script
CREATE TABLE tbl_EmployeeMaster (
	emp_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,emp_code VARCHAR(50) NOT NULL
	,emp_name VARCHAR(255) NOT NULL
	,emp_designation VARCHAR(20) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_JobMaster (
	job_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_name VARCHAR(50) NOT NULL
	,job_description VARCHAR(250) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_CriteriaMaster (
	criteria_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,criteria_name VARCHAR(50) NOT NULL
	,criteria_description VARCHAR(250) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_JobCriteriaMapping (
	job_criteria_mapping_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,criteria_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CriteriaMaster(criteria_id)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_CandidateDetails (
	Candidate_details_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,criteria_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CriteriaMaster(criteria_id)
	,project_name VARCHAR(100)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_CandidateInterviewSchedule (
	schedule_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,candidate_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateDetails(Candidate_details_id)
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,interviewer_id INT NOT NULL FOREIGN KEY REFERENCES tbl_EmployeeMaster(emp_id)
	,interview_timestamp DATETIME NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_CandidateEvaluation (
	evaluation_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,schedule_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateInterviewSchedule(schedule_id)
	,job_criteria_mapping_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobCriteriaMapping(job_criteria_mapping_id)
	,criteria_score INT NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);

CREATE TABLE tbl_CandidateGlobalScores (
	global_score_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,candidate_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateDetails(Candidate_details_id)
	,schedule_id INT NOT NULL FOREIGN KEY REFERENCES tbl_CandidateInterviewSchedule(schedule_id)
	,job_id INT NOT NULL FOREIGN KEY REFERENCES tbl_JobMaster(job_id)
	,is_hired BIT NOT NULL
	,proposed_compensation DECIMAL(18, 5)
	,actual_compensation DECIMAL(18, 5)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by INT NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by INT
	);
