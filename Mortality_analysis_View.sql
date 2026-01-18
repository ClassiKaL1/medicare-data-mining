-- ==========================================
-- PACKAGE: MEDICARE_DATA_MINING_TOOLS
-- Description: This view aggregates data for all 11 chronic diseases, comparing patient counts and costs between alive and deceased status
-- Author: [Nick Kalligeris]
-- ==========================================

CREATE OR REPLACE VIEW Mortality_analysis_View AS
	SELECT 'diabetes' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE diabetes = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'cancer' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE cancer = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'congestive_heart_failure' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE congestive_heart_failure = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'alzheimers_disease' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE alzheimers_disease = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'chronic_kidney_disease' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE chronic_kidney_disease = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'copd' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE copd = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'depression' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE depression = 1 
	GROUP BY Status
	 
	UNION ALL

	SELECT 'ischemic_heart_disease' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE ischemic_heart_disease = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'osteoporosis' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE osteoporosis = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'rheumatoid_arthritis_oa' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE rheumatoid_arthritis_oa = 1 
	GROUP BY Status

	UNION ALL

	SELECT 'stroke' AS Disease, 
		   CASE WHEN death_date IS NOT NULL AND death_date <> '' AND death_date <> '  ' THEN 'Deceased' ELSE 'Alive' END AS Status,
		   COUNT(*) AS Patient_Count,
		   ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost
	FROM beneficiarysummarysample_2008 
	WHERE stroke = 1 
	GROUP BY Status
