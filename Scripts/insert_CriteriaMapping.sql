
-- insert into criteria mapping
-- first row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
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

-- second row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
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

-- third row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
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

-- fourth row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
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

-- fifth row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PROJECT MANAGER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
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

-- sixth row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
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

-- seventh row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
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

-- eighth row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
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

-- nine row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
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

-- ten row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'PRODUCT OWNER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
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

-- 11 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
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

-- 12 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
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

-- 13 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
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

-- 14 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
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

-- 15 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'BUSINESS ANALYST')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
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

-- 16 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
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

-- 17 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
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

-- 18 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
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

-- 19 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
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

-- 20 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SR. SOFTWARE TESTER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
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

-- 21 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'EXPERIENCE')
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

-- 22 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SALARY')
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

-- 23 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'COMMUNICATION')
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

-- 24 row

IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SQL')
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

-- 25 row
IF NOT EXISTS (SELECT 1 FROM tbl_JobCriteriaMapping 
		 where job_id = (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
		 and criteria_id = (SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')) 
BEGIN
	INSERT INTO [dbo].[tbl_JobCriteriaMapping] (
	[job_id]
	,[criteria_id]
	,[date_created]
	,[created_by]
	,[date_modified]
	,[modified_by]
	)
VALUES (
    (SELECT job_id from [dbo].[tbl_JobMaster] WHERE UPPER(job_name) = 'SOFTWARE DEVELOPER')
	,(SELECT criteria_id from [dbo].[tbl_CriteriaMaster] WHERE UPPER(criteria_name) = 'SYNERGY')
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
