-- INSERT INTO CRITERIA MASTERS
IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[tbl_CriteriaMaster]
		WHERE UPPER(criteria_name]) = ‘EXPERIENCE’
		)
BEGIN
	INSERT INTO [dbo].[tbl_CriteriaMaster] (
		[criteria_name]
		,[job_description]
		,[date_created]
		,[created_by]
		,[date_modified]
		,[modified_by]
		)
	VALUES (
		‘Experience’
		,‘’
		,
		,GETDATE()
		,'ADMIN'
		,NULL
		,NULL
		)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[tbl_CriteriaMaster]
		WHERE UPPER(criteria_name]) = ‘SALARY’
		)
BEGIN
	INSERT INTO [dbo].[tbl_CriteriaMaster] (
		[criteria_name]
		,[job_description]
		,[date_created]
		,[created_by]
		,[date_modified]
		,[modified_by]
		)
	VALUES (
		‘Salary’
		,‘’
		,
		,GETDATE()
		,'ADMIN'
		,NULL
		,NULL
		)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[tbl_CriteriaMaster]
		WHERE UPPER(criteria_name]) = ‘COMMUNICATION’
		)
BEGIN
	INSERT INTO [dbo].[tbl_CriteriaMaster] (
		[criteria_name]
		,[job_description]
		,[date_created]
		,[created_by]
		,[date_modified]
		,[modified_by]
		)
	VALUES (
		‘Communication’
		,‘’
		,
		,GETDATE()
		,'ADMIN'
		,NULL
		,NULL
		)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[tbl_CriteriaMaster]
		WHERE UPPER(criteria_name]) = ‘SQL’
		)
BEGIN
	INSERT INTO [dbo].[tbl_CriteriaMaster] (
		[criteria_name]
		,[job_description]
		,[date_created]
		,[created_by]
		,[date_modified]
		,[modified_by]
		)
	VALUES (
		‘SQL’
		,‘’
		,
		,GETDATE()
		,'ADMIN'
		,NULL
		,NULL
		)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[tbl_CriteriaMaster]
		WHERE UPPER(criteria_name]) = ‘SYNERGY’
		)
BEGIN
	INSERT INTO [dbo].[tbl_CriteriaMaster] (
		[criteria_name]
		,[job_description]
		,[date_created]
		,[created_by]
		,[date_modified]
		,[modified_by]
		)
	VALUES (
		‘SYNERGY’
		,‘’
		,
		,GETDATE()
		,'ADMIN'
		,NULL
		,NULL
		)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END
