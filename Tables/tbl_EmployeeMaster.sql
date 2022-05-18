CREATE TABLE tbl_EmployeeMaster (
	emp_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,emp_code VARCHAR(50) NOT NULL
	,emp_name VARCHAR(255) NOT NULL
	,emp_designation VARCHAR(20) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
	);
