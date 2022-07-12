CREATE TABLE [dbo].[tbl_CandidateGlobalScores]
(
	[global_score_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_id] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[job_id] [int] NOT NULL,
	[is_hired] [bit] NOT NULL,
	[global_score] [decimal](18, 5) NULL,
	[local_score] [decimal](18, 5) NULL,
	[proposed_compensation] [decimal](18, 5) NULL,
	[actual_compensation] [decimal](18, 5) NULL,
	[date_created] [datetime] NOT NULL,
	[created_by] [nvarchar](450) NOT NULL,
	[date_modified] [datetime] NULL,
	[modified_by] [nvarchar](450) NULL,
	[is_recommeded] [bit] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[global_score_id] ASC
	)
)
