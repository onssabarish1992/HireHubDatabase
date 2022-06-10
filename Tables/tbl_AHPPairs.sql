CREATE TABLE tbl_AHPPairs (
    pair_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
    ,pair_1 INT NOT NULL
    ,pair_2 INT NOT NULL
    ,entity_id INT 
    ,weightage DECIMAL(18,5)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME 
	,modified_by NVARCHAR(450)
)
