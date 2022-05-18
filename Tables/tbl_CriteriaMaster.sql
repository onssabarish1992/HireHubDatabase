CREATE TABLE tbl_CriteriaMaster (
	criteria_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,criteria_name VARCHAR(50) NOT NULL
	,criteria_description VARCHAR(250) NOT NULL
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME DEFAULT GETDATE()
	,modified_by NVARCHAR(450)
	);
