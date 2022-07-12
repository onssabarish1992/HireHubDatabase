CREATE TABLE [dbo].[tbl_EntityMaster]
(
	[entity_id] [int] IDENTITY(1,1) NOT NULL,
	[entity_type] [nvarchar](50) NULL,
	[date_created] [datetime] NOT NULL,
	[created_by] [nvarchar](450) NOT NULL,
	[date_modified] [datetime] NULL,
	[modified_by] [nvarchar](450) NULL,
	PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC
	)
)
