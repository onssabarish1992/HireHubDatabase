CREATE TABLE [dbo].[tbl_AHPPairs]
(
	[pair_id] [int] IDENTITY(1,1) NOT NULL,
	[pair_1] [int] NOT NULL,
	[pair_2] [int] NOT NULL,
	[entity_id] [int] NULL,
	[weightage] [decimal](18, 5) NULL,
	[date_created] [datetime] NOT NULL,
	[created_by] [nvarchar](450) NOT NULL,
	[date_modified] [datetime] NULL,
	[modified_by] [nvarchar](450) NULL,
	[parent_entity_id] [int] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[pair_id] ASC
	)
)
