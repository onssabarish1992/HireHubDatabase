-- =============================================
-- Author:	Kishore Valavan
-- Create date: 23-June-2022
-- Description:	This stored procedure is used to insert into the tbl_criteriaMaster table
-- =============================================
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
           ('Experience'
           ,'Experience'
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


IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Communication')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Communication'
           ,'Communication'
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


IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Risk Assesment')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Risk Assesment'
           ,'Risk Assesment'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Leadership')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Leadership'
           ,'Leadership'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'PMP® Certification')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('PMP® Certification'
           ,'PMP® Certification'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Negotiation')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Negotiation'
           ,'Negotiation'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'UML Modelling ')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('UML Modelling '
           ,'UML Modelling '
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Agile Methodology')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Agile Methodology'
           ,'Agile Methodology'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Visualization')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Visualization'
           ,'Visualization'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Prototyping')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Prototyping'
           ,'Prototyping'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'CBAP® Certification')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('CBAP® Certification'
           ,'CBAP® Certification'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Analytical Skills')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Analytical Skills'
           ,'Analytical Skills'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'JIRA')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('JIRA'
           ,'JIRA'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Selenium')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Selenium'
           ,'Selenium'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SDLC')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('SDLC'
           ,'SDLC'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Problem Solving')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Problem Solving'
           ,'Problem Solving'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Dot Net')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Dot Net'
           ,'Dot Net'
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

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'Agile Methodology')
BEGIN
INSERT INTO [dbo].[tbl_CriteriaMaster]
           ([criteria_name]
           ,[criteria_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Agile Methodology'
           ,'Agile Methodology'
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
