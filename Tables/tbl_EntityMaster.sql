CREATE TABLE tbl_EntityMaster (
	entity_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
    ,entity_type NVARCHAR(50)
	,date_created DATETIME NOT NULL DEFAULT GETDATE()
	,created_by NVARCHAR(450) NOT NULL
	,date_modified DATETIME 
	,modified_by NVARCHAR(450)
)
