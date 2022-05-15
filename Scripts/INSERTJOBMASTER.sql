
IF NOT EXISTS (SELECT 1 FROM [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER') 
BEGIN
	INSERT INTO [dbo].[tbl_JobMaster]
           ([job_name]
           ,[job_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Project Manager'
           ,'Join us as a Project manager, supporting the fast-paced CF&E department in the implementation of various automation initiatives. In this exciting position, you would be responsible for all the key aspects of the project''s delivery lifecycle. '
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER') 
BEGIN
	INSERT INTO [dbo].[tbl_JobMaster]
           ([job_name]
           ,[job_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Product Owner'
           ,'Lead our Platform Squad, shaping and guiding the evolution our of e-commerce system from an existing monolith solution to a microservices-based solution. '
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST') 
BEGIN
	INSERT INTO [dbo].[tbl_JobMaster]
           ([job_name]
           ,[job_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Business Analyst'
           ,'As part of the operations finance team, the Business Analyst will be responsible for working closely with the business owners to analyze data and build inferences.'
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER') 
BEGIN
	INSERT INTO [dbo].[tbl_JobMaster]
           ([job_name]
           ,[job_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Sr. Software Tester'
           ,'Perform quality and process adherence reviews of the commercial agents based on interactions with our clients.'
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

IF NOT EXISTS (SELECT 1 FROM [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER') 
BEGIN
	INSERT INTO [dbo].[tbl_JobMaster]
           ([job_name]
           ,[job_description]
           ,[date_created]
           ,[created_by]
           ,[date_modified]
           ,[modified_by])
     VALUES
           ('Software Developer'
           ,'Develop object-oriented models and design data structures for new software projects and implement business logic and data models in suitable class design.'
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