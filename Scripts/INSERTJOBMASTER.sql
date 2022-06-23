

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
           ,'Join us as a Project manager, supporting the fast-paced CF&E department in the implementation of various automation initiatives. In this exciting position, you would be responsible for all the key aspects of the project''s delivery lifecycle, including business analysis and process re-engineering, testing and rollout, working closely with the dedicated IT teams and with the relevant business stakeholders. You will take part in the delivery of projects with the aim of increasing the level of automation in existing processes, reducing process complexity, addressing key audit points, growing business efficiency and reducing risk.'
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
           ,'Lead our Platform Squad, shaping and guiding the evolution our of ecommerce system from an existing monolith solution to a microservices based solution.
Own the Product Backlog for the squad, driving our near-term and long-term product strategy for the platform migration.
Critically evaluate all existing platform features, identifying candidates for migration based on value.
Identify new opportunities and improvements where we can leverage new core technologies to drive adoption and revenue growth.
Deeply understand developer, business and operations user problems working across all functions to ensure our solution delivers the best customer experience.
Collaborate with Technology team members to groom Epics & User Stories up to a level that can be picked up within your Sprints.
Communicate key milestones of overall project to stakeholders during monthly and quarterly reviews.
Define go-to market strategy evaluating MVP and on-parity approach.'
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
           ,'As part of the operations finance team, the Business Analyst will be responsible for working closely with the business owners to analyze data, build inferences, and deliver compelling and actionable data insights in terms of multiple reports and dashboards (Tableau/QuickSight). This role requires an individual with excellent understanding of SQL and query development, good business acumen and the ability to work with quantitative and business teams. The successful candidate will be a self-starter comfortable with ambiguity, with strong attention to detail, an ability to work in a fast-paced and ever-changing environment, and driven by a desire to innovate in this space.'
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
           ,'Perform quality and process adherence reviews of the commercial agents based on interactions with our clients. Work closely with Customer team to update and implement changes to quality processes and criteria as these changes arise.
Execute the tracking and reporting of the quality metrics
Conduct calibration sessions and team huddles focused on quality
Keep track of the improvement of agents, especially outliers
Partner with Training to identify site/ agent opportunities and trend analysis to help determine training solutions to be done to address the areas for improvement'
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
           ,'Develop object-oriented models and design data structures for new software projects and implement business logic and data models in suitable class design.
Write high quality, reusable code while working on defined tasks/bugs.
Contribute relevant, clean, concise quality documentation to Trella’s knowledge base to support increased organizational information sharing.
Solve complex problems in an innovative way and deliver quality solutions while taking ownership and accountability of assigned things.
Efficiently collaborate with your peers in cross-functional teams to accomplish tasks.
Participate in on-call rotations and active involvement in resolving incidents.
Participate in team agile engineering practices.'
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
