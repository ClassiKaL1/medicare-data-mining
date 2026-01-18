-- ==========================================
-- PACKAGE: MEDICARE_DATA_MINING_TOOLS
-- Description: Procedures for analyzing and finding patterns in Medicare 2008 data
-- Author: [Nick Kalligeris]
-- ==========================================

DELIMITER $$

CREATE PROCEDURE CompareGenderByDisease(IN v_gender_disease VARCHAR(50))
BEGIN
    SET @sql = CONCAT(
        'SELECT 
            CASE WHEN gender_code = 1 THEN "Male" ELSE "Female" END AS Gender,
            COUNT(*) AS Patient_Count,
            ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost,
            ROUND(AVG(payment_outpatient), 2) AS Avg_Outpatient_Cost
         FROM beneficiarysummarysample_2008
         WHERE ', v_gender_disease, ' = 1
         GROUP BY gender_code'
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE PROCEDURE AnalyzeAgeByDisease(IN v_age_disease VARCHAR(50))
BEGIN
    SET @sql = CONCAT(
        'SELECT 
            CASE 
                WHEN (2008 - LEFT(birth_date, 4)) < 45 THEN "Under 45"
                WHEN (2008 - LEFT(birth_date, 4)) BETWEEN 45 AND 64 THEN "45-64"
                WHEN (2008 - LEFT(birth_date, 4)) BETWEEN 65 AND 74 THEN "65-74"
                WHEN (2008 - LEFT(birth_date, 4)) BETWEEN 75 AND 84 THEN "75-84"
                ELSE "85+" 
            END AS Age_Group,
            COUNT(*) AS Patient_Count,
            ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost,
            ROUND(AVG(payment_outpatient), 2) AS Avg_Outpatient_Cost
         FROM beneficiarysummarysample_2008
         WHERE ', v_age_disease, ' = 1
         GROUP BY Age_Group
         ORDER BY Age_Group'
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE PROCEDURE AnalyzeStateByDisease(IN v_state_disease VARCHAR(50))
BEGIN
    SET @sql = CONCAT(
        'SELECT 
            state_code,
            COUNT(*) AS Patient_Count,
            ROUND(AVG(payment_inpatient), 2) AS Avg_Inpatient_Cost,
            ROUND(SUM(payment_inpatient), 2) AS Total_State_Spending
         FROM beneficiarysummarysample_2008
         WHERE ', v_state_disease, ' = 1
         GROUP BY state_code
         ORDER BY Avg_Inpatient_Cost DESC'
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

