SELECT 
    m.BENEFICIARY_ID,
    m.GENDER_CODE,
    SUM(CASE WHEN m.YEAR = 2008 THEN m.TOTAL_PAYMENT ELSE 0 END) AS amount_2008,
    SUM(CASE WHEN m.YEAR = 2009 THEN m.TOTAL_PAYMENT ELSE 0 END) AS amount_2009,
    SUM(CASE WHEN m.YEAR = 2010 THEN m.TOTAL_PAYMENT ELSE 0 END) AS amount_2010,
    COUNT(CASE WHEN m.YEAR = 2008 THEN 1 END)                    AS claims_2008,
    COUNT(CASE WHEN m.YEAR = 2009 THEN 1 END)                    AS claims_2009,
    COUNT(CASE WHEN m.YEAR = 2010 THEN 1 END)                    AS claims_2010,
    SUM(m.TOTAL_PAYMENT)                                         AS grand_total,
    MAX(d.ALZHEIMERS_DISEASE)       AS alzheimers,
    MAX(d.CONGESTIVE_HEART_FAILURE) AS heart_failure,
    MAX(d.CHRONIC_KIDNEY_DISEASE)   AS kidney_disease,
    MAX(d.CANCER)                   AS cancer,
    MAX(d.COPD)                     AS copd,
    MAX(d.DEPRESSION)               AS depression,      
    MAX(d.DIABETES)                 AS diabetes,
    MAX(d.ISCHEMIC_HEART_DISEASE)   AS ischemic_heart,
    MAX(d.OSTEOPOROSIS)             AS osteoporosis,
    MAX(d.RHEUMATOID_ARTHRITIS_OA)  AS arthritis,
    MAX(d.STROKE)                   AS stroke
FROM medicare_data m,
     DISEASES d
WHERE m.BENEFICIARY_ID = d.BENEFICIARY_ID
  AND m.YEAR = d.YEAR
GROUP BY m.BENEFICIARY_ID, m.GENDER_CODE
HAVING (MAX(d.ALZHEIMERS_DISEASE) + MAX(d.CONGESTIVE_HEART_FAILURE) +   
        MAX(d.CHRONIC_KIDNEY_DISEASE) + MAX(d.CANCER) + MAX(d.COPD) +
        MAX(d.DEPRESSION) + MAX(d.DIABETES) + MAX(d.ISCHEMIC_HEART_DISEASE) +
        MAX(d.OSTEOPOROSIS) + MAX(d.RHEUMATOID_ARTHRITIS_OA) + MAX(d.STROKE)) >= 3
ORDER BY grand_total DESC
LIMIT 10;
