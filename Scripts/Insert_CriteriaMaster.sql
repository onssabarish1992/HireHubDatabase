
IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('EXPERIENCE'
           ,'EXPERIENCE'
           ,GETDATE()
           ,'ADMIN'
           ,NULL
           ,NULL)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END


IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('SALARY'
           ,'SALARY'
           ,GETDATE()
           ,'ADMIN'
           ,NULL
           ,NULL)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END


IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('COMMUNICATION'
           ,'COMMUNICATION'
           ,GETDATE()
           ,'ADMIN'
           ,NULL
           ,NULL)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('SQL'
           ,'SQL'
           ,GETDATE()
           ,'ADMIN'
           ,NULL
           ,NULL)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('SYNERGY'
           ,'SYNERGY'
           ,GETDATE()
           ,'ADMIN'
           ,NULL
           ,NULL)

	PRINT 'Record inserted successfully...'
END
ELSE
BEGIN
	PRINT 'Record already exists...'
END

