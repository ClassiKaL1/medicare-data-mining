SELECT 
    m.BENEFICIARY_ID,
    m.GENDER_CODE,
    SUM(m.TOTAL_PAYMENT)                                         AS grand_total,
    COUNT(m.TOTAL_PAYMENT)                                       AS total_claims,
    (MAX(CASE WHEN d.ALZHEIMERS_DISEASE      = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.CONGESTIVE_HEART_FAILURE = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.CHRONIC_KIDNEY_DISEASE   = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.CANCER                   = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.COPD                     = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.DEPRESSION                 = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.DIABETES                 = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.ISCHEMIC_HEART_DISEASE   = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.OSTEOPOROSIS             = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.RHEUMATOID_ARTHRITIS_OA  = 1 THEN 1 ELSE 0 END) +
     MAX(CASE WHEN d.STROKE                   = 1 THEN 1 ELSE 0 END)) AS disease_count,
    MAX(CASE WHEN d.ALZHEIMERS_DISEASE      = 1 THEN 1 ELSE 0 END) AS alzheimers,
    MAX(CASE WHEN d.CONGESTIVE_HEART_FAILURE= 1 THEN 1 ELSE 0 END) AS heart_failure,
    MAX(CASE WHEN d.CHRONIC_KIDNEY_DISEASE  = 1 THEN 1 ELSE 0 END) AS kidney_disease,
    MAX(CASE WHEN d.CANCER                  = 1 THEN 1 ELSE 0 END) AS cancer,
    MAX(CASE WHEN d.COPD                    = 1 THEN 1 ELSE 0 END) AS copd,
    MAX(CASE WHEN d.DEPRESSION                = 1 THEN 1 ELSE 0 END) AS depression,
    MAX(CASE WHEN d.DIABETES                = 1 THEN 1 ELSE 0 END) AS diabetes,
    MAX(CASE WHEN d.ISCHEMIC_HEART_DISEASE  = 1 THEN 1 ELSE 0 END) AS ischemic_heart,
    MAX(CASE WHEN d.OSTEOPOROSIS            = 1 THEN 1 ELSE 0 END) AS osteoporosis,
    MAX(CASE WHEN d.RHEUMATOID_ARTHRITIS_OA = 1 THEN 1 ELSE 0 END) AS arthritis,
    MAX(CASE WHEN d.STROKE                  = 1 THEN 1 ELSE 0 END) AS stroke
FROM medicare_data m,
     DISEASES d
WHERE m.BENEFICIARY_ID = d.BENEFICIARY_ID
  AND m.YEAR = d.YEAR
GROUP BY m.BENEFICIARY_ID, m.GENDER_CODE
ORDER BY grand_total DESC
LIMIT 10;