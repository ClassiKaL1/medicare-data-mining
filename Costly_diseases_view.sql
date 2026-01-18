CREATE OR REPLACE VIEW Costly_diseases_view AS
	SELECT 'alzheimers_disease' AS Disease, ROUND(AVG(payment_inpatient + payment_outpatient), 2) AS Avg_Total_Cost 
	FROM beneficiarysummarysample_2008 
	WHERE alzheimers_disease = 1

	UNION ALL

	SELECT 'congestive_heart_failure', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE congestive_heart_failure = 1

	UNION ALL

	SELECT 'chronic_kidney_disease', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE chronic_kidney_disease = 1

	UNION ALL

	SELECT 'cancer', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE cancer = 1

	UNION ALL

	SELECT 'copd', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE copd = 1

	UNION ALL

	SELECT 'depression', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE depression = 1

	UNION ALL

	SELECT 'diabetes', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE diabetes = 1

	UNION ALL

	SELECT 'ischemic_heart_disease', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE ischemic_heart_disease = 1

	UNION ALL

	SELECT 'osteoporosis', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE osteoporosis = 1

	UNION ALL

	SELECT 'rheumatoid_arthritis_oa', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE rheumatoid_arthritis_oa = 1

	UNION ALL

	SELECT 'stroke', ROUND(AVG(payment_inpatient + payment_outpatient), 2) 
	FROM beneficiarysummarysample_2008 
	WHERE stroke = 1


