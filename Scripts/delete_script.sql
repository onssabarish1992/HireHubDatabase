--DECLARE @job_id INT
--DECLARE @candidate_id INT
--DECLARE @schedule_id INT

--SELECT @job_id = job_id 
--FROM tbl_JobMaster 
--WHERE job_name = 'Software Developer'

--DELETE FROM tbl_JobCriteria 
--WHERE job_id = @job_id

--DELETE FROM tbl_SubCriteria 
--WHERE job_id = @job_id

--DELETE FROM tbl_CandidateEvaluation 
--WHERE job_id = @job_id

--DELETE FROM tbl_CandidateInterviewSchedule 
--WHERE job_id = @job_id

--DELETE FROM tbl_CandidateDetails WHERE LOWER(LTRIM(RTRIM(candidate_name))) IN ('sandy orton','mark obrien','cathryn fernandes')