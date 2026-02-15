------------------------------
Author : Nikos Kalligeris
------------------------------

DELIMITER $$

CREATE PROCEDURE POPULATE_ALL_TABLES(IN target_year INT)
BEGIN
    
    INSERT INTO GENDERS (GENDER_CODE, DESCRIPTION)
    SELECT DISTINCT gender_code,
        CASE WHEN gender_code = 1 THEN 'Male' WHEN gender_code = 2 THEN 'Female' ELSE 'Unknown' END
    FROM temp_staging t
    WHERE t.gender_code IS NOT NULL 
      AND NOT EXISTS (SELECT 1 FROM GENDERS g WHERE g.GENDER_CODE = t.gender_code);

    INSERT INTO RACES (RACE_CODE, DESCRIPTION)
    SELECT DISTINCT race_code,
        CASE WHEN race_code = 1 THEN 'White' WHEN race_code = 2 THEN 'Black' WHEN race_code = 3 THEN 'Other' ELSE 'Unknown' END
    FROM temp_staging t
    WHERE t.race_code IS NOT NULL 
      AND NOT EXISTS (SELECT 1 FROM RACES r WHERE r.RACE_CODE = t.race_code);

    INSERT INTO STATES (STATE_CODE, STATE_NAME)
    SELECT DISTINCT state_code, state_code
    FROM temp_staging t
    WHERE t.state_code IS NOT NULL 
      AND NOT EXISTS (SELECT 1 FROM STATES s WHERE s.STATE_CODE = t.state_code);

    INSERT INTO COUNTIES (COUNTY_CODE, COUNTY_NAME, STATE_CODE)
    SELECT DISTINCT county_code, county_code, state_code
    FROM temp_staging t
    WHERE t.county_code IS NOT NULL 
      AND NOT EXISTS (SELECT 1 FROM COUNTIES co WHERE co.COUNTY_CODE = t.county_code);
    
    -- BENEFICIARIES 
    INSERT IGNORE INTO beneficiaries (BENEFICIARY_ID, BIRTH_DATE, DEATH_DATE, GENDER_CODE, RACE_CODE)
    SELECT DISTINCT beneficiary_id, birth_date, death_date, gender_code, race_code
    FROM temp_staging;

    -- COVERAGE
    INSERT INTO coverage (BENEFICIARY_ID, YEAR, ESRD_INDICATOR, STATE_CODE, COUNTY_CODE, MEDICARE_COVERAGE_MONTHS, SUPPLEMENTARY_COVERAGE_MONTHS, HMO_COVERAGE_MONTHS, PLAN_COVERAGE_MONTHS)
    SELECT beneficiary_id, target_year, CASE WHEN esrd_indicator = 'Y' THEN 1 ELSE 0 END, state_code, county_code, medicare_coverage_months, supplementary_coverage_months, hmo_coverage_months, plan_coverage_months
    FROM temp_staging;

    -- DISEASES
    INSERT INTO diseases (BENEFICIARY_ID, YEAR, ALZHEIMERS_DISEASE, CONGESTIVE_HEART_FAILURE, CHRONIC_KIDNEY_DISEASE, CANCER, COPD, DEPRESSION, DIABETES, ISCHEMIC_HEART_DISEASE, OSTEOPOROSIS, RHEUMATOID_ARTHRITIS_OA, STROKE)
    SELECT beneficiary_id, target_year, alzheimers_disease, congestive_heart_failure, chronic_kidney_disease, cancer, copd, depression, diabetes, ischemic_heart_disease, osteoporosis, rheumatoid_arthritis_oa, stroke
    FROM temp_staging;

    -- FINANCIALS
    INSERT INTO financials (BENEFICIARY_ID, YEAR, MEDICAL_REIMBURSEMENT_INPATIENT, beneficiary_responsibility_inpatient, PAYMENT_INPATIENT, MEDICAL_REIMBURSEMENT_OUTPATIENT, beneficiary_responsibility_outpatient, PAYMENT_OUTPATIENT, MEDICAL_REIMBURSEMENT_CARRIER, beneficiary_responsibility_carrier, PAYMENT_CARRIER)
    SELECT beneficiary_id, target_year, medical_reimbursement_inpatient, beneficiary_responsibility_inpatient, payment_inpatient, medical_reimbursement_outpatient, beneficiary_responsibility_outpatient, payment_outpatient, medical_reimbursement_carrier, beneficiary_responsibility_carrier, payment_carrier
    FROM temp_staging;

END$$

DELIMITER ;